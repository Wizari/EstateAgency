package com.estateagency.controller;

import com.estateagency.model.Flat;
import com.estateagency.service.ContractService;
import com.estateagency.service.FlatService;
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
public class FlatController {
    private FlatService flatService;


    @Autowired(required = true)
    @Qualifier(value = "flatService")
    public void setFlatService(FlatService flatService) {
        this.flatService = flatService;
    }

    @RequestMapping(value = "flats", method = RequestMethod.GET)
    public String listFlats(Model model){
        model.addAttribute("flat", new Flat());
        model.addAttribute("listFlats", this.flatService.listFlats());

        return "flats";
    }

    @RequestMapping(value = "/flats/add", method = RequestMethod.POST)
    public String addFlat(@ModelAttribute("flat")@Valid Flat flat, BindingResult result, Model model){

        if (result.hasErrors()) {
            model.addAttribute("flat",flat);
            model.addAttribute("listFlats", this.flatService.listFlats());

            return "flats";
        }

        if(flat.getId() == 0){
            this.flatService.addFlat(flat);
        }else {
            this.flatService.updateFlat(flat);
        }

        return "redirect:/flats";
    }

    @RequestMapping("/flat/{id}/remove")
    public String removeFlat(@PathVariable("id") int id){
        this.flatService.removeFlat(id);

        return "redirect:/flats";
    }

    @RequestMapping("/flat/{id}/edit")
    public String editFlat(@PathVariable("id") int id, Model model){
        model.addAttribute("flat", this.flatService.getFlatById(id));
        model.addAttribute("listFlats", this.flatService.listFlats());

        return "flats";
    }

    @RequestMapping("/flat/{id}")
    public String flatData(@PathVariable("id") int id, Model model){
        model.addAttribute("flat", this.flatService.getFlatById(id));

        return "flatdata";
    }
}
