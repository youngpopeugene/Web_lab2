package com.youngpopeugene.web_lab2.model;

public class Shot {
    private double x;
    private double y;
    private double r;

    private boolean status;

    public Shot(){
    }

    public Shot(double x, double y, double r, boolean status){
        this.x = x;
        this.y = y;
        this.r = r;
        this.status = status;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        this.r = r;
    }
}
