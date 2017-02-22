package com.estateagency.service;

import com.estateagency.model.Realtor;

import java.util.List;

public interface RealtorService {
    void addRealtor(Realtor realtor);

    void updateRealtor(Realtor realtor);

    boolean removeRealtor(int id);

    Realtor getRealtorById(int id);

    List<Realtor> listRealtors();
}
