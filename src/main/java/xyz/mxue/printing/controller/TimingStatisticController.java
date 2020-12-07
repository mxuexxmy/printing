package xyz.mxue.printing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author mxuexxmy
 * @date 12/7/2020$ 1:11 AM$
 */
@Controller
@RequestMapping("time")
public class TimingStatisticController {

    @GetMapping
    public String time() {
        return "timing-statistics";
    }
}
