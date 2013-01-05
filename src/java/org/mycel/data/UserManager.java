package org.mycel.data;
/**
 *
 * @author Pavlina
 */
public class UserManager {
    private static User[] users = new User[7];
    public static long findUser(String username, String password){
        long userId=-1;
        //loaduser();
        for (int i=0; i<users.length; i++){
            if(username.equals(users[i].getUsername()) && password.equals(users[i].getPassword())){
                userId = users[i].getID();
            }
        }
        return userId;
    }
    public static void loaduser(){
        users[0] = new User("Julia", "julia");
        users[1] = new User("Lisa", "lisa");
        users[2] = new User("Martin", "martin");
        users[3] = new User("Pavlina", "pavlina");
        users[4] = new User("Ralph", "ralph");
        users[5] = new User("Richard", "richard");
        users[6] = new User("Stefan", "stefan");
    }
    public static User[] getAllUsers(){
        return users;
    }
    public static User getUserById(long userid){
        User founduser=null;
        for (int i=0; i<users.length; i++){
            if (users[i].getID() == userid){
                founduser = users[i];
            }
        }
        return founduser;
    }
}
