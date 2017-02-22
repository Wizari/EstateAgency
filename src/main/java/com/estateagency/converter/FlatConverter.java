package com.estateagency.converter;

import com.estateagency.model.Flat;
import com.estateagency.service.FlatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class FlatConverter implements Converter<String, Flat> {
    @Autowired
    private FlatService flatService;

    @Override
    public Flat convert(String s) {
        return flatService.getFlatById(Integer.valueOf(s));
    }
}
