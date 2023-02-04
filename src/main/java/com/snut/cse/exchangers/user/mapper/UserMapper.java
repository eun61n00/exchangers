package com.snut.cse.exchangers.user.mapper;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.domain.UserDTO;

public interface UserMapper {

    void insertKakaoUser(KakaoUserDTO kakaoUserDTO);

    void insertUser(UserDTO userDTO);

    KakaoUserDTO selectKakaoUser(String kakaoUserEmail);

    UserDTO selectUser(String userEmail);

}
