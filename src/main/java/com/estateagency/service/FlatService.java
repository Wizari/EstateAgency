package com.estateagency.service;

import com.estateagency.model.Flat;

import java.util.List;

public interface FlatService {
    void addFlat(Flat flat);

    void updateFlat(Flat flat);

    boolean removeFlat(int id);

    Flat getFlatById(int id);

    List<Flat> listFlats();
}
