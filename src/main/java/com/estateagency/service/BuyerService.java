package com.estateagency.service;

import com.estateagency.model.Buyer;

import java.util.List;

public interface BuyerService {
    void addBuyer(Buyer buyer);

    void updateBuyer(Buyer buyer);

    boolean removeBuyer(int id);

    Buyer getBuyerById(int id);

    List<Buyer> listBuyers();
}
