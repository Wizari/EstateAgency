package com.estateagency.service;

import com.estateagency.model.Seller;

import java.util.List;

public interface SellerService {
    void addSeller(Seller seller);

    void updateSeller(Seller seller);

    boolean removeSeller(int id);

    Seller getSellerById(int id);

    List<Seller> listSellers();
}
