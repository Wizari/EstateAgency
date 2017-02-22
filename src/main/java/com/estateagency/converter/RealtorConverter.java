package com.estateagency.converter;

import com.estateagency.model.Realtor;
import com.estateagency.service.RealtorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class RealtorConverter implements Converter<String, Realtor> {
    @Autowired
    private RealtorService realtorService;

    @Override
    public Realtor convert(String s) {
        return realtorService.getRealtorById(Integer.valueOf(s));
    }
}
