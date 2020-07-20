/*
 * Ping the application backend to keep session alive
 */
package uk.ac.antarctica.helpdesk.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class PingController {

    /**
     * Ping the server as a session keepalive ploy
     * 
     * @return
     */
    @RequestMapping(value = "/ping", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void ping() {
    }

}
