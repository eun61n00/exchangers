package com.snut.cse.exchangers.user.service;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.domain.UserDTO;

import java.util.HashMap;

public interface UserService {

    void insertUserInfo(UserDTO userDTO);

    UserDTO getUserInfo(String userEmail);

    void insertKakaoUserInfo(KakaoUserDTO kakaoUserDTO);

    KakaoUserDTO getKakaoUserInfo(String kakaoUserEmail);

}
