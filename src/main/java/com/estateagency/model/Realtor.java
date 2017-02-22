package com.estateagency.model;

import com.estateagency.validation.Name;
import com.estateagency.validation.Phone;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "realtors")
public class Realtor {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "fio")
    @Size(min = 2, max = 255)
    @Name
    private String fio;

    @Column(name = "phone")
    @Phone
    @Size(max = 20)
    private String phone;

    public int getId() {
         return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFIO() {
        return fio;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String toString() {
        return "Realtor{" +
                "id=" + id +
                ", fio='" + fio + '\'' +
                ", phone=" + phone + '}';
    }
}
