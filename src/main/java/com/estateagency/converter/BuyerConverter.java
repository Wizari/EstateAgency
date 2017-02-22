package com.estateagency.converter;

import com.estateagency.model.Buyer;
import com.estateagency.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class BuyerConverter implements Converter<String, Buyer> {
    @Autowired
    private BuyerService buyerService;

    @Override
    public Buyer convert(String s) {
        return buyerService.getBuyerById(Integer.valueOf(s));
    }
}
