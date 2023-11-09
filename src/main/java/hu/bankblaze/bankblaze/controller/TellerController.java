package hu.bankblaze.bankblaze.controller;
import hu.bankblaze.bankblaze.model.Teller;
import hu.bankblaze.bankblaze.service.TellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/tellers")
public class TellerController {

    private final TellerService tellerService;

    @Autowired
    public TellerController(TellerService tellerService) {
        this.tellerService = tellerService;
    }

    @GetMapping
    public String showTellers(Model model) {
        List<Teller> tellers = tellerService.getAllTellers();
        model.addAttribute("tellers", tellers);
        return "showteller";
    }

    @GetMapping("/queuenumber")
    public String queueNumberPage() {
        return "queuenumber";
    }
}