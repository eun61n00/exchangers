package com.snut.cse.exchangers.user.service;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;

import java.util.HashMap;

public interface UserService {

    void insertUserInfo(KakaoUserDTO kakaoUserDTO);

    KakaoUserDTO getUserInfo(String kakaoEmail);

}
