package SSM.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Borrow {
    private Integer id;

    private Integer bookid;

    private Book book;

    private Customer customer;

    private Integer customerid;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bdate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Date getBdate() {
        return bdate;
    }

    public void setBdate(Date bdate) {
        this.bdate = bdate;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                "id=" + id +
                ", bookid=" + bookid +
                ", book=" + book +
                ", customer=" + customer +
                ", customerid=" + customerid +
                ", bdate=" + bdate +
                ", rdate=" + rdate +
                '}';
    }
}