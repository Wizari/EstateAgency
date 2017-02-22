package com.estateagency.model;

import com.estateagency.validation.Name;
import com.estateagency.validation.Passport;
import com.estateagency.validation.Phone;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Size;

@Entity
@Table(name = "buyers")
public class Buyer {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "surname")
    @Size(min = 2, max = 45)
    @Name
    private String surname;

    @Column(name = "firstname")
    @Size(min = 2, max = 45)
    @Name
    private String firstname;

    @Column(name = "lastname")
    @Size(min = 2, max = 45)
    @Name
    private String lastname;

    @Column(name = "phone")
    @Phone
    @Size(max = 20)
    private String phone;

    @Column(name = "passport")
    @Passport
    @Size(min = 2, max = 10)
    private String passport;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getFIO() {
        return surname + " " + firstname + " " + lastname;
    }

    @Override
    public String toString() {
        return "Buyer{" +
                "id=" + id +
                ", surname='" + surname + '\'' +
                ", firstname='" + firstname + '\'' +
                ", lastname=" + lastname +
                ", phone=" + phone +
                ", passport=" + passport   +
                '}';
    }
}
