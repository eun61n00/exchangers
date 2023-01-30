package com.snut.cse.exchangers.security;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml",
        "file:src/main/webapp/WEB-INF/spring-config/security-config.xml"})
@Log4j
public class UserTest {

    @Setter(onMethod_ = {@Autowired})
    private PasswordEncoder passwordEncoder;

    @Setter(onMethod_ = {@Autowired})
    private DataSource dataSource;

    @Test
    public void testInsertUser() {
        String sql = "INSERT INTO tbl_member(id, password, name) values (?, ?, ?)";

        for (int i = 0; i < 100; i++) {
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            try {
                connection = dataSource.getConnection();
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(2, passwordEncoder.encode("pw" + i));

                if (i < 80) {
                    preparedStatement.setString(1, "user" + i);
                    preparedStatement.setString(3, "user" + i);
                }

                else if (i < 90) {
                    preparedStatement.setString(1, "manager" + i);
                    preparedStatement.setString(3, "manager" + i);
                }

                else {
                    preparedStatement.setString(1, "administrator" + i);
                    preparedStatement.setString(3, "administrator" + i);
                }
                preparedStatement.executeUpdate();
                log.info(preparedStatement);

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (preparedStatement != null) {
                    try {
                        preparedStatement.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                };
            }
        }
    }

    @Test
    public void testInserrAuth() {
        String sql = "INSERT INTO tbl_member_auth(id, auth) values (?, ?)";

        for (int i = 0; i < 100; i++) {
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            try {
                connection = dataSource.getConnection();
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(2, passwordEncoder.encode("pw" + i));

                if (i < 80) {
                    preparedStatement.setString(1, "user" + i);
                    preparedStatement.setString(2, "ROLE_USER");
                }

                else if (i < 90) {
                    preparedStatement.setString(1, "manager" + i);
                    preparedStatement.setString(2, "ROLE_MANAGER");
                }

                else {
                    preparedStatement.setString(1, "administrator" + i);
                    preparedStatement.setString(2, "ROLE_ADMIN");
                }

                preparedStatement.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (preparedStatement != null) {
                    try {
                        preparedStatement.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            }
        }
    }

}
