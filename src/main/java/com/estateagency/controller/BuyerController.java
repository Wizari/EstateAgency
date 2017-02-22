package com.estateagency.controller;

import com.estateagency.model.Buyer;
import com.estateagency.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
public class BuyerController {
    private BuyerService buyerService;

    @Autowired(required = true)
    @Qualifier(value = "buyerService")
    public void setBuyerService(BuyerService buyerService) {
        this.buyerService = buyerService;
    }

    @RequestMapping(value = "buyers", method = RequestMethod.GET)
    public String listBuyers(Model model){
        model.addAttribute("buyer", new Buyer());
        model.addAttribute("listBuyers", this.buyerService.listBuyers());

        return "buyers";
    }

    @RequestMapping(value = "/buyers/add", method = RequestMethod.POST)
    public String addBuyer(@ModelAttribute("buyer") @Valid Buyer buyer, BindingResult result, Model model){

        if (result.hasErrors()) {
            model.addAttribute("buyer", buyer);
            model.addAttribute("listBuyers", this.buyerService.listBuyers());
            return "buyers";
        }

        if(buyer.getId() == 0){
            this.buyerService.addBuyer(buyer);
        }else {
            this.buyerService.updateBuyer(buyer);
        }

        return "redirect:/buyers";
    }

    @RequestMapping("/buyer/{id}/remove")
    public String removeBuyer(@PathVariable("id") int id){
        this.buyerService.removeBuyer(id);

        return "redirect:/buyers";
    }

    @RequestMapping("/buyer/{id}/edit")
    public String editBuyer(@PathVariable("id") int id, Model model){
        model.addAttribute("buyer", this.buyerService.getBuyerById(id));
        model.addAttribute("listBuyers", this.buyerService.listBuyers());

        return "buyers";
    }

    @RequestMapping("/buyer/{id}")
    public String buyerData(@PathVariable("id") int id, Model model){
        model.addAttribute("buyer", this.buyerService.getBuyerById(id));

        return "buyerdata";
    }
}
