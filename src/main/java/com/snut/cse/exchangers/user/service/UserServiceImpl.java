package com.snut.cse.exchangers.user.service;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements  UserService {

    @Setter(onMethod_ = {@Autowired})
    private UserMapper userMapper;

    @Override
    public void insertUserInfo(KakaoUserDTO kakaoUserDTO) {
        userMapper.insert(kakaoUserDTO);
    }

    @Override
    public KakaoUserDTO getUserInfo(String kakaoEmail) {
        return userMapper.select(kakaoEmail);
    }
}
