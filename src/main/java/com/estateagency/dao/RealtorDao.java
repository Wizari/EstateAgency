package com.estateagency.dao;

import com.estateagency.model.Realtor;

import java.util.List;

public interface RealtorDao {
    void addRealtor(Realtor realtor);

    void updateRealtor(Realtor realtor);

    void removeRealtor(int id);

    Realtor getRealtorById(int id);

    List<Realtor> listRealtors();
}
