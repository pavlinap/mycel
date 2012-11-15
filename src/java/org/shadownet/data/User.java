package org.shadownet.data;
/**
 *
 * @author Pavlina
 */
public class User extends Group{
     private String firstName;
    private String lastName;
    private String password;
    private String username;
    
    public User(String myNewUsername, String myNewPassword){
        super(myNewUsername);
        username = myNewUsername;
        password = myNewPassword;
    }
    
    public String getFirstName(){
        return firstName;
    }
    
    public void setFirstName(String myNewFirstName){
        firstName = myNewFirstName;
    }
    
    public String getLastName(){
        return lastName;
    }
    
    public void setLastName(String myNewLastName){
        myNewLastName = lastName;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String myNewPassword){
        password = myNewPassword;
    }

    public String getUsername(){
        return username;
    }

    public void setUsername(String myNewUsername){
        username = myNewUsername;
    }
    
    public void addUser(Group userToAdd){
        myFriends.add(userToAdd);
    }
}