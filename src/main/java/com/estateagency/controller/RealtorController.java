package com.estateagency.controller;

import com.estateagency.model.Realtor;
import com.estateagency.service.RealtorService;
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
public class RealtorController {
    private RealtorService realtorService;

    @Autowired(required = true)
    @Qualifier(value = "realtorService")
    public void setRealtorService(RealtorService realtorService) {
        this.realtorService = realtorService;
    }

    @RequestMapping(value = "/realtors", method = RequestMethod.GET)
    public String listRealtors(Model model){
        model.addAttribute("realtor", new Realtor());
        model.addAttribute("listRealtors", this.realtorService.listRealtors());

        return "realtors";
    }

    @RequestMapping(value = "/realtors/add", method = RequestMethod.POST)
    public String addRealtor(@ModelAttribute("realtor") @Valid Realtor realtor, BindingResult result, Model model){

        if (result.hasErrors()) {
            model.addAttribute("realtor", realtor);
            model.addAttribute("listRealtors", this.realtorService.listRealtors());

            return "realtors";
        }

        if(realtor.getId() == 0){
            this.realtorService.addRealtor(realtor);
        }else {
            this.realtorService.updateRealtor(realtor);
        }

        return "redirect:/realtors";
    }

    @RequestMapping("/realtor/{id}/remove")
    public String removeRealtor(@PathVariable("id") int id){
        this.realtorService.removeRealtor(id);

        return "redirect:/realtors";
    }

    @RequestMapping("/realtor/{id}/edit")
    public String editRealtor(@PathVariable("id") int id, Model model){
        model.addAttribute("realtor", this.realtorService.getRealtorById(id));
        model.addAttribute("listRealtors", this.realtorService.listRealtors());

        return "realtors";
    }

    @RequestMapping("/realtor/{id}")
    public String realtorData(@PathVariable("id") int id, Model model){
        model.addAttribute("realtor", this.realtorService.getRealtorById(id));

        return "realtordata";
    }
}
