/*
 * William Stearns
 * 12/21/25
 * CSD430 Module 10 Paper
 * Description: Custom Tag Handler class that generates a dynamic copyright year.
 */

package com.stearns.tags;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.Calendar;

public class CopyrightTag extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        int year = Calendar.getInstance().get(Calendar.YEAR);
        out.println("&copy; " + year + " Stearns Movie Database");
    }
}