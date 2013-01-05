package org.mycel.data;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;

/**
 * @author Pavlina
 */
public class Group {
   private long group_id;
    /**
     *
     */
    protected List<Group> myMembers = new ArrayList<Group>();
    private String group_name; // unique, maybe mygroup@mycel.org
    private String privateKey;
    private String publicKey;
    private Hashtable<Group, Conversation> conversations;
    
    public Group(String name){
        group_name=name;
        //group_id=(long) (10000*Math.random());
        Random nextLong = new Random();
        group_id=nextLong.nextLong();
        conversations = new Hashtable<Group, Conversation>();
        //mk5 id
    }
    
    public long getID(){
        return group_id;
    }
    
    public void requestMembership(User u) {
        // need approval by all members thogh voting
        // VOTING PROZESS

    }
    
    public Group getUser(int index){
        return myMembers.get(index);
    } 
    
    /**
     * @return the conversations
     */
    public Hashtable<Group, Conversation> getConversations() {
        return conversations;
    }
    /**
     * add new conversation if not exists
     */
    public Conversation addOrGetConversation(Group g) {
        Conversation conversation;
        if(conversations.containsKey(g)) {
            conversation = conversations.get(g);
        } else {
            conversation = new Conversation(g);
            conversations.put(g, conversation);
        }
        return conversation;
    }
}
