/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.shadownet.data;
/**
 *
 * @author Pavlina
 */
public class UserContainer {
    public String _username;
    public String _password;
    public String name;
    public long _id;
    
    public UserContainer(String newUsername, String newPassword, long newId) {
        _username = newUsername;
        _password = newPassword;
        _id = newId;
    }
    public long getId() {
        return _id;
    }
    public void setId(long newId) {
        _id = newId;
    }
    public String getPassword() {
        return _password;
    }
    public void setPassword(String newPassword) {
        _password = newPassword;
    }
    public String getUsername() {
        return _username;
    }
    public void setUsername(String newUsername) {
        _username = newUsername;
    }
}