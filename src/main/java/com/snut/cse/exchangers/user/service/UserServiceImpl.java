package com.snut.cse.exchangers.user.service;

import com.google.gson.JsonObject;
import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    @Override
    public String getAccessToken(String authorize_code) {

        String accessToken = "";
        String refreshToken = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);

            BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("grant_type=authorization_code");
            stringBuilder.append("&client_id=3483bcfb08aececcc7d1a088230b4b27");
            stringBuilder.append("&code="+authorize_code);
            bufferedWriter.write(stringBuilder.toString());
            bufferedWriter.flush();

            int responseCode = connection.getResponseCode();
            log.info("response code: " + responseCode);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            String result = "";

            while ((line = bufferedReader.readLine()) != null) {
                result += line;
            }
            log.info("response body: " + result);

            JsonParser jsonParser = new JsonParser();
            JsonElement jsonElement = jsonParser.parse(result);

            accessToken = jsonElement.getAsJsonObject().get("access_token").getAsString();
            refreshToken = jsonElement.getAsJsonObject().get("refresh_token").getAsString();

            log.info("access token: " + accessToken);
            log.info("refresh token: " + refreshToken);

            bufferedReader.close();
            bufferedWriter.close();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
        return accessToken;
    }


    public KakaoUserDTO getUserInfo(String accessToken) {
        KakaoUserDTO kakaoUserDTO = new KakaoUserDTO();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = connection.getResponseCode();
            log.info("response code" + responseCode);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            String result = "";
            while((line = bufferedReader.readLine()) != null) {
                result += line;
            }
            log.info("response body: " + result);

            JsonParser jsonParser = new JsonParser();
            JsonElement jsonElement = jsonParser.parse(result);

            JsonObject properties = jsonElement.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakaoAccount = jsonElement.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakaoAccount.getAsJsonObject().get("email").getAsString();

            kakaoUserDTO.setNickname(nickname);
            kakaoUserDTO.setEmail(email);

        } catch (IOException exception) {
            exception.printStackTrace();
        }
        return kakaoUserDTO;
    }
}
