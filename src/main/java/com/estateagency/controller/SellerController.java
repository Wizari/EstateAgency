package com.estateagency.controller;

import com.estateagency.model.Seller;
import com.estateagency.service.SellerService;
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
public class SellerController {
    private SellerService sellerService;

    @Autowired(required = true)
    @Qualifier(value = "sellerService")
    public void setSellerService(SellerService sellerService) {
        this.sellerService = sellerService;
    }

    @RequestMapping(value = "sellers", method = RequestMethod.GET)
    public String listSellers(Model model){
        model.addAttribute("seller", new Seller());
        model.addAttribute("listSellers", this.sellerService.listSellers());

        return "sellers";
    }

    @RequestMapping(value = "/sellers/add", method = RequestMethod.POST)
    public String addSeller(@ModelAttribute("seller") @Valid Seller seller, BindingResult result, Model model){

        if (result.hasErrors()) {
            model.addAttribute("seller", seller);
            model.addAttribute("listSellers", this.sellerService.listSellers());
            return "sellers";
        } else {
            if (seller.getId() == 0) {
                this.sellerService.addSeller(seller);
            } else {
                this.sellerService.updateSeller(seller);
            }
            return "redirect:/sellers";
        }
    }

    @RequestMapping("/seller/{id}/remove")
    public String removeSeller(@PathVariable("id") int id){
        if (!this.sellerService.removeSeller(id)) {
            return "error";
        }
        return "redirect:/sellers";
    }

    @RequestMapping("/seller/{id}/edit")
    public String editSeller(@PathVariable("id") int id, Model model){
        model.addAttribute("seller", this.sellerService.getSellerById(id));
        model.addAttribute("listSellers", this.sellerService.listSellers());

        return "sellers";
    }

    @RequestMapping("/seller/{id}")
    public String sellerData(@PathVariable("id") int id, Model model){
        model.addAttribute("seller", this.sellerService.getSellerById(id));

        return "sellerdata";
    }
}
