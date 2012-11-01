package org.shadownet.data;
/**
 *
 * @author Pavlina
 */
public class UserManager {
    private static UserContainer[] users = new UserContainer[7];
    public static long findUser(String username, String password){
        long userId=-1;
        //loaduser();
        for (int i=0; i<users.length; i++){
            if(username.equals(users[i].getUsername()) && password.equals(users[i].getPassword())){
                userId = users[i].getId();
            }
        }
        return userId;
    }
    public static void loaduser(){
        users[0] = new UserContainer("Julia", "julia", 0);
        users[1] = new UserContainer("Lisa", "lisa", 1);
        users[2] = new UserContainer("Martin", "martin", 2);
        users[3] = new UserContainer("Pavlina", "pavlina", 3);
        users[4] = new UserContainer("Ralph", "ralph", 4);
        users[5] = new UserContainer("Richard", "richard", 5);
        users[6] = new UserContainer("Stefan", "stefan", 6);
    }
    public static UserContainer[] getUser(){
        return users;
    }
}
