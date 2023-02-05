package com.snut.cse.exchangers.currency;

import com.snut.cse.exchangers.currency.domain.CurrencyVO;
import org.json.JSONArray;
import org.json.JSONObject;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/currency")
@Log4j
public class CurrencyXmlServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @GetMapping("/xml")
    public String currency(Model model) throws Exception{

        URLConnection conn;
        BufferedReader br;

        LocalDate now = LocalDate.now();

        conn = new URL("https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=8cFRnzqkQmImBtLJOyTcyurw4NSUeI93&searchdate=" + now + "&data=AP01").openConnection();

        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        String currencyResult = br.readLine();

        JSONArray currencyArray = new JSONArray(currencyResult);
        List<CurrencyVO> currencyVOList = new ArrayList<CurrencyVO>();

        for (int i = 0; i < currencyArray.length(); i++) {
            JSONObject currencyObject = currencyArray.getJSONObject(i);
            int result = currencyObject.getInt("result");
            String cur_unit = currencyObject.getString("cur_unit");
            Double ttb = Double.parseDouble(currencyObject.getString("ttb").replace(",", ""));
            Double tts = Double.parseDouble(currencyObject.getString("tts").replace(",", ""));
            String cur_nm = currencyObject.getString("cur_nm");

            CurrencyVO currencyVO = new CurrencyVO(cur_unit, ttb, tts);
            currencyVOList.add(currencyVO);
        }


        log.info(currencyVOList);
        model.addAttribute("currencyList", currencyVOList);

        return "currency";

    }
}