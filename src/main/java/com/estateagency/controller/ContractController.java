package com.estateagency.controller;

import com.estateagency.model.Contract;
import com.estateagency.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.Date;
import java.text.SimpleDateFormat;

@Controller
public class ContractController {
    private ContractService contractService;
    private BuyerService buyerService;
    private SellerService sellerService;
    private FlatService flatService;
    private RealtorService realtorService;

    @Autowired(required = true)
    @Qualifier(value = "contractService")
    public void setContractService(ContractService contractService) {
        this.contractService = contractService;
    }

    @Autowired(required = true)
    @Qualifier(value = "sellerService")
    public void setSellerService(SellerService sellerService) {
        this.sellerService = sellerService;
    }

    @Autowired(required = true)
    @Qualifier(value = "buyerService")
    public void setBuyerService(BuyerService buyerService) {
        this.buyerService = buyerService;
    }

    @Autowired(required = true)
    @Qualifier(value = "flatService")
    public void setFlatService(FlatService flatService) {
        this.flatService = flatService;
    }

    @Autowired(required = true)
    @Qualifier(value = "realtorService")
    public void setRealtorService(RealtorService realtorService) {
        this.realtorService = realtorService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, "purchaseDate", new CustomDateEditor(sdf, true));

    }

    @RequestMapping(value = "contracts", method = RequestMethod.GET)
    public String listFlats(Model model){
        model.addAttribute("contract", new Contract());
        model.addAttribute("listContracts", this.contractService.listContracts());
        model.addAttribute("listBuyers", this.buyerService.listBuyers());
        model.addAttribute("listSellers", this.sellerService.listSellers());
        model.addAttribute("listFlats", this.flatService.listFlats());
        model.addAttribute("listRealtors", this.realtorService.listRealtors());



        return "contracts";
    }

    @RequestMapping(value = "/contracts/add", method = RequestMethod.POST)
    public String addContract(@ModelAttribute("contract") Contract contract){
        contract.getFlat().setPurchased(true);
        if(contract.getId() == 0){
            this.flatService.updateFlat(contract.getFlat());
            this.contractService.addContract(contract);
        }else {
            this.flatService.updateFlat(contract.getFlat());
            this.contractService.updateContract(contract);
        }
        return "redirect:/contracts";
    }

    @RequestMapping("/contract/{id}/remove")
    public String removeContract(@PathVariable("id") int id){
        Contract contract = this.contractService.getContractById(id);
        contract.getFlat().setPurchased(false);
        this.flatService.updateFlat(contract.getFlat());
        this.contractService.removeContract(id);
        return "redirect:/contracts";
    }

    @RequestMapping("/contract/{id}/edit")
    public String editContract(@PathVariable("id") int id, Model model){

        model.addAttribute("contract", this.contractService.getContractById(id));
        model.addAttribute("listContracts", this.contractService.listContracts());
        model.addAttribute("listBuyers", this.buyerService.listBuyers());
        model.addAttribute("listSellers", this.sellerService.listSellers());
        model.addAttribute("listFlats", this.flatService.listFlats());
        model.addAttribute("listRealtors", this.realtorService.listRealtors());

        return "contracts";
    }

    @RequestMapping("/contract/{id}")
    public String contractData(@PathVariable("id") int id, Model model){
        model.addAttribute("contract", this.contractService.getContractById(id));

        return "contractdata";
    }
}
