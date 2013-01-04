package org.shadownet.data;

import java.lang.Object;
import java.lang.String;
import java.lang.StringBuilder;

//import java.util.String;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Martin
 */
public class StringChange{
    
    public StringChange(){
    }
    
    public String DetectLink(String s){
        s = s.replaceAll(".\\swww|^www", " http://www");
        s = s.replaceAll("((http:[/][/]|www.)([\\S])*)", "<a target=\"_blank\" href=\"$0\">$0</a>");
        return s;
    }
}
