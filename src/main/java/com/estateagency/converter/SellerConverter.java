package com.estateagency.converter;

import com.estateagency.model.Seller;
import com.estateagency.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class SellerConverter implements Converter<String, Seller> {
    @Autowired
    private SellerService sellerService;
    
    @Override
    public Seller convert(String s) {
        return sellerService.getSellerById(Integer.valueOf(s));
    }
}
