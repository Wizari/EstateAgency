package com.estateagency.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "flats")
public class Flat implements Serializable {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "rooms")
    @Min(value = 1, message = "Сan not be 0")
    private int rooms;

    @Column(name = "area")
    @Min(value = 1, message = "Сan not be 0")
    private double area;

    @Column(name = "floor")
    @Min(value = 1, message = "Сan not be 0")
    private int floor;

    @Column(name = "district")
    @Size(min = 2, max = 45)
    private String district;

    @Column(name = "price")
    @Min(value = 1, message = "Сan not be 0")
    private double price;

    @Column(name = "address")
    @Size(min = 2, max = 255)
    private String address;

    @Column(name = "purchased")
    private boolean purchased;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String disctrict) {
        this.district = disctrict;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isPurchased() {
        return purchased;
    }

    public void setPurchased(boolean purchased) {
        this.purchased = purchased;
    }

    public String getFullAddress() {
        return district + ", " + address;
    }


    @Override
    public String toString() {
        return "Flat{" +
                "id=" + id +
                ", rooms='" + rooms + '\'' +
                ", area='" + area + '\'' +
                ", floor=" + floor +
                ", district=" + district +
                ", price=" + price +
                ", address=" + address +
                ", purchased=" + purchased +
                '}';
    }
}
