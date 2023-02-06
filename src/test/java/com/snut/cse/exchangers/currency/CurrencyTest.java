package com.snut.cse.exchangers.currency;

import com.snut.cse.exchangers.currency.domain.CurrencyVO;
import lombok.extern.log4j.Log4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml")
@Log4j
public class CurrencyTest {

    @Test
    public void currency() throws Exception {

        URLConnection conn;
        BufferedWriter bw;
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
            Float deal_bas_r = Float.parseFloat(currencyObject.getString("deal_bas_r").replace(",", ""));
            Float bkpr = Float.parseFloat(currencyObject.getString("bkpr").replace(",", ""));
            Float yy_efee_r = Float.parseFloat(currencyObject.getString("yy_efee_r").replace(",", ""));
            Float ten_dd_efee_r = Float.parseFloat(currencyObject.getString("ten_dd_efee_r").replace(",", ""));
            Float kftc_bkpr = Float.parseFloat(currencyObject.getString("kftc_bkpr").replace(",", ""));
            Float kftc_deal_bas_r = Float.parseFloat(currencyObject.getString("kftc_deal_bas_r").replace(",", ""));
            String cur_nm = currencyObject.getString("cur_nm");

            CurrencyVO currencyVO = new CurrencyVO(cur_unit, ttb, tts);
            currencyVOList.add(currencyVO);
            log.info(currencyVO);
        }

        log.info(currencyVOList);

    }

}
