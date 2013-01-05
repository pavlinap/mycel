package org.mycel.data;

import java.util.Date;
import java.util.Vector;

/**
 *
 * @author stefannegele
 */
public class Conversation {

    private Group recipient;
    private Vector<Announcement> announcements;
    private Date lastReading;
    private int newAnnouncementCounter;

    public Conversation(Group g) {
        recipient = g;
        announcements = new Vector<Announcement>();
        lastReading = new Date();
        newAnnouncementCounter = 0;
    }

    /**
     * @return the announcements
     */
    public Vector getAnnouncements() {
        return announcements;
    }

    /**
     * @return the recipient
     */
    public Group getRecipient() {
        return recipient;
    }

    /**
     * @return the lastReading
     */
    public Date getLastReading() {
        return lastReading;
    }

    /**
     * @return the annoucements, set lastReading to current time and reset
     * newAnnouncementCounter
     */
    public Vector readAnnoucements() {
        newAnnouncementCounter = 0;
        lastReading = new Date();
        return announcements;
    }

    /**
     * @add an announcement
     */
    public void addAnnouncement(Announcement a) {
        newAnnouncementCounter++;
        announcements.add(a);
    }

    /**
     * @return the newAnnouncementCounter
     */
    public int getNewAnnouncementCounter() {
        return newAnnouncementCounter;
    }
}