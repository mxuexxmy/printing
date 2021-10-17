package xyz.mxue.printing;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author LX
 */
@EnableTransactionManagement
@SpringBootApplication
@MapperScan("xyz.mxue.printing.mapper")
@EnableScheduling
public class PrintingApplication {

    public static void main(String[] args) {
        SpringApplication.run(PrintingApplication.class, args);
    }

}
