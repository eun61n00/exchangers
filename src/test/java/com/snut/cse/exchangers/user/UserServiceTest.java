package com.snut.cse.exchangers.user;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.service.UserService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml")
@Log4j
public class UserServiceTest {

    @Setter(onMethod_ = @Autowired)
    private UserService userService;

    @Test
    public void testExist() {
        log.info(userService);
        assertNotNull(userService);
    }

    @Test
    public void testGetUserInfo() {
        KakaoUserDTO user = userService.getKakaoUserInfo("8633hghg@naver.com");
        log.info(user);
    }

}
