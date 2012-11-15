package org.shadownet.data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Pavlina
 */
public class Group {
   private long group_id;
    /**
     *
     */
    protected List<Group> myFriends = new ArrayList<Group>();
    private String group_name;
    private String privateKey;
    private String publicKey;
    
    public Group(String name){
        group_name=name;
        group_id=(long) (10000*Math.random());
        //mk5 id
    }
    
    public long getID(){
        return group_id;
    }
    
    public void addUser(Group userToAdd){
        //;
        if (userToAdd instanceof User){
            myFriends.add(userToAdd);
        }
        else{
            System.out.println(userToAdd.group_name + " ist kein user");
        }
    }
    
    public void removeUser(Group userToRemove){
        myFriends.remove(userToRemove);
    }
    
    public Group getUser(int index){
        return myFriends.get(index);
    } 
}
