package exemee.models;

import java.util.Date;

public class Query {
    private double x;
    private double y;
    private double r;
    private String currentTime;
    private String time;
    private String result;

    public Query(double x, double y, double r, String currentTime, String time, String result) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.currentTime = currentTime;
        this.time = time;
        this.result = result;
    }
    public Query(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }


    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
