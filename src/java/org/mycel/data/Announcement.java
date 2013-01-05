package org.mycel.data;

import java.util.Date;

/**
 *
 * @author ralph
 */
public class Announcement {
    private Date date;
    private String message;
    private long userId;

    public Announcement( Date d, String m, long u ) {
        date = d;
        message = m;
        userId = u;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the userId
     */
    public long getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }
    
}
