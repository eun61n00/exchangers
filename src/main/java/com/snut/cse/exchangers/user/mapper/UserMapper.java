package com.snut.cse.exchangers.user.mapper;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;

public interface UserMapper {

    void insert(KakaoUserDTO kakaoUserDTO);

    KakaoUserDTO select(String kakaoEmail);

}
