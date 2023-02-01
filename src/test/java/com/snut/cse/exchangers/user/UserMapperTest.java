package com.snut.cse.exchangers.user;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml")
@Log4j
public class UserMapperTest {

    @Setter(onMethod_ = {@Autowired})
    private UserMapper userMapper;

    @Test
    public void testInsert() {

        KakaoUserDTO kakaoUserDTO = new KakaoUserDTO();
        kakaoUserDTO.setEmail("kakaoUser01@gmail.com");
        kakaoUserDTO.setName("kakaoUser01");
        userMapper.insert(kakaoUserDTO);
    }

    @Test
    public void testSelect() {
        KakaoUserDTO selected = userMapper.select("8633hghg@gmail.com");
        log.info(selected);
    }

}
