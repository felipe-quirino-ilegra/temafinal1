package com.felipe.quirino.temafinal1.Controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class temafinal1Controller {

    @GetMapping("/ini")
    public String obterMensagem() {
        return " \n" +
                " +-+-+-+ +-+-+-+-+ +-+-+-+-+-+ +-+ +-+-+-+-+-+-+-+-+-+-+-+\n" +
                " |APP| |TEMA| |FINAL 1 FUNCIONANDO|\n" +
                " +-+-+-+ +-+-+-+-+ +-+-+-+-+-+ +-+ +-+-+-+-+-+-+-+-+-+-+-+\n ";
    }
}