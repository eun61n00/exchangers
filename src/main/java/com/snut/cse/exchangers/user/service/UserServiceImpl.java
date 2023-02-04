package com.snut.cse.exchangers.user.service;

import com.snut.cse.exchangers.user.domain.AuthVO;
import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.domain.UserDTO;
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
    public void insertUserInfo(UserDTO userDTO) {
        userMapper.insertUser(userDTO);
    }

    @Override
    public UserDTO getUserInfo(String userEmail) {
        return userMapper.selectUser(userEmail);
    }

    @Override
    public void insertKakaoUserInfo(KakaoUserDTO kakaoUserDTO) {
        userMapper.insertKakaoUser(kakaoUserDTO);
    }

    @Override
    public KakaoUserDTO getKakaoUserInfo(String kakaoEmail) {
        return userMapper.selectKakaoUser(kakaoEmail);
    }

}
