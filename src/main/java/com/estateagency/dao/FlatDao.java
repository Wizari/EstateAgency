package com.estateagency.dao;

import com.estateagency.model.Flat;

import java.util.List;

public interface FlatDao {
    void addFlat(Flat flat);

    void updateFlat(Flat flat);

    void removeFlat(int id);

    Flat getFlatById(int id);

    List<Flat> listFlats();
}
