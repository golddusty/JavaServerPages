package com.ora.jsp.tags.xmp;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import com.ora.jsp.beans.motd.*;
public class MixedMessageTag extends TagSupport {
    private MixedMessageBean mmb = new MixedMessageBean();

    // Attributes
    private String category;

    public void setCategory(String category) {
        this.category = category;
    }

    public int doEndTag() {
        mmb.setCategory(category);
	JspWriter out = pageContext.getOut();
        try {
            out.println(mmb.getMessage());
        }
        catch (IOException e) {}
        return EVAL_PAGE;
    }
}
