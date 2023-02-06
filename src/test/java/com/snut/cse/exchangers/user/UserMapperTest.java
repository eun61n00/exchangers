package com.snut.cse.exchangers.user;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.domain.UserDTO;
import com.snut.cse.exchangers.user.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml")
@Log4j
public class UserMapperTest {

    @Setter(onMethod_ = @Autowired)
    private UserMapper userMapper;

    @Test
    public void testExist() {
        log.info(userMapper);
        assertNotNull(userMapper);
    }

    @Test
    public void testInsertKakaoUser() {

        KakaoUserDTO kakaoUserDTO = new KakaoUserDTO();
        kakaoUserDTO.setEmail("kakaoUser01@gmail.com");
        kakaoUserDTO.setName("kakaoUser01");
        userMapper.insertKakaoUser(kakaoUserDTO);
    }

    @Test
    public void testSelectKakaoUser() {
        KakaoUserDTO selected = userMapper.selectKakaoUser("8633hghg@naver.com");
        log.info(selected);
    }

    @Test
    public void testInsertUser() {
        UserDTO userDTO = new UserDTO();
        userDTO.setEmail("eun61n@gmail.com");
        userDTO.setName("eunbin");
        userDTO.setPassword("P@ssw0rd");
        userMapper.insertUser(userDTO);
    }

    @Test
    public void testSelectUser() {
        UserDTO userDTO = userMapper.selectUser("eun61n@gmail.com");
        log.info(userDTO);
    }

}
