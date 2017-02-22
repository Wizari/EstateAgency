package com.estateagency.service;

import com.estateagency.model.Realtor;

import java.util.List;

public interface RealtorService {
    void addRealtor(Realtor realtor);

    void updateRealtor(Realtor realtor);

    void removeRealtor(int id);

    Realtor getRealtorById(int id);

    List<Realtor> listRealtors();
}
