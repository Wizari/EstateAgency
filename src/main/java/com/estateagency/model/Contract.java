package com.estateagency.model;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "contracts")
public class Contract {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "buyers_id")
    private Buyer buyer;

    @ManyToOne
    @JoinColumn(name = "sellers_id")
    private Seller seller;

    @ManyToOne
    @JoinColumn(name = "realtors_id")
    private Realtor realtor;

    @ManyToOne
    @JoinColumn(name = "flats_id")
    private Flat flat;

    @Column(name = "comission")
    private double comission;

    @Column(name = "total_price")
    @NumberFormat (style = NumberFormat.Style.CURRENCY)
    private double totalPrice;

    @Column(name = "purchase_date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date purchaseDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Buyer getBuyer() {
        return buyer;
    }

    public void setBuyer(Buyer buyer) {
        this.buyer = buyer;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    public Realtor getRealtor() {
        return realtor;
    }

    public void setRealtor(Realtor realtor) {
        this.realtor = realtor;
    }

    public Flat getFlat() {
        return flat;
    }

    public void setFlat(Flat flat) {
        this.flat = flat;
    }

    public double getComission() {
        return comission;
    }

    public void setComission(double commission) {
        this.comission = commission;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }


    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", buyer='" + buyer + '\'' +
                ", seller='" + seller + '\'' +
                ", realtor='" + realtor + '\'' +
                ", flat='" + flat + '\'' +
                ", comission='" + comission + '\'' +
                ", total_price='" + totalPrice + '\'' +
                ", purchase_date=" + purchaseDate + '}';
    }
}
