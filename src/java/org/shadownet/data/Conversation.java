package org.shadownet.data;
import java.util.Vector;

/**
 *
 * @author stefannegele
 */
public class Conversation {
    private Vector members;
    private Vector<Announcement> announcements;
    private long id;
    
    public Conversation(Vector m) {
        members = m;
    }
    
    public Conversation(Vector m, long i) {
        members = m;
        id = i;
        announcements = new Vector<Announcement>();
    }
    
    public long getID() {
        return id;
    }
    
    public Vector getMembers() {
        return members;
    }
    
    public void addMember() {
        // to implement
    }
    
    public Vector getAnnouncements() {
        return announcements;
    }
}
