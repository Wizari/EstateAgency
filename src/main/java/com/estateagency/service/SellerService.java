package com.estateagency.service;

import com.estateagency.model.Seller;

import java.util.List;

public interface SellerService {
    void addSeller(Seller seller);

    void updateSeller(Seller seller);

    void removeSeller(int id);

    Seller getSellerById(int id);

    List<Seller> listSellers();
}
