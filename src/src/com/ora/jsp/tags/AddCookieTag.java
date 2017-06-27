package com.ora.jsp.tags;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import com.ora.jsp.util.*;
import org.apache.taglibs.standard.lang.support.*;

/**
 * This class is a custom action for adding a cookie header
 * to the response.
 *
 * @author Hans Bergsten, Gefion software <hans@gefionsoftware.com>
 * @version 2.0
 */
public class AddCookieTag extends TagSupport {
    private String nameEL;
    private String valueEL;
    private String maxAgeEL;

    /**
     * Sets the cookie name attribute.
     *
     * @param name the name of the cookie
     */
    public void setName(String name) {
        nameEL = name;
    }

    /**
     * Sets the cookie value attribute.
     *
     * @param value the value of the cookie
     */
    public void setValue(String value) {
        valueEL = value;
    }

    /**
     * Sets the cookie maxAge attribute.
     *
     * @param maxAgeString the max age (in seconds) of the cookie
     */
    public void setMaxAge(String maxAge) {
        maxAgeEL = maxAge;
    }

    /**
     * Creates a cookie and adds it to the response
     */
    public int doEndTag() throws JspException {
	/*
         * Evaluate the EL expression, if any
	 */
	String name = (String)
	    ExpressionEvaluatorManager.evaluate("name", nameEL, 
		String.class, this, pageContext);
	String value = (String)
	    ExpressionEvaluatorManager.evaluate("value", valueEL, 
		String.class, this, pageContext);

        int maxAge = -1;
        if (maxAgeEL != null) {
	    Integer maxAgeInteger = (Integer)
		ExpressionEvaluatorManager.evaluate("maxAge", maxAgeEL, 
		    Integer.class, this, pageContext);
	    maxAge = maxAgeInteger.intValue();
        }
	// FIX: Add a path argument, set to the path for the current
	// page
        CookieUtils.sendCookie(name, value, maxAge,
            (HttpServletResponse) pageContext.getResponse());
        return EVAL_PAGE;
    }
    
    /**
     * Releases all instance variables.
     */
    public void release() {
        nameEL = null;
        valueEL = null;
        maxAgeEL = null;
        super.release();
    }
}
