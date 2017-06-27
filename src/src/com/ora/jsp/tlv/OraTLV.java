package com.ora.jsp.tlv;

import java.util.*;
import javax.servlet.jsp.tagext.*;
import org.jdom.*;
import org.jdom.input.*;

/**
 * This is an example of a TagLibraryValidator class. It only validates
 * the use of the &lt;ora:param&gt; action element, but can be extended to
 * validate the use of other actions as well.
 *
 * @author Hans Bergsten, Gefion software <hans@gefionsoftware.com>
 * @version 1.0
 */
public class OraTLV extends TagLibraryValidator {
    private SAXBuilder builder = new SAXBuilder();
    private Namespace jspNamespace = 
	Namespace.getNamespace("jsp", "http://java.sun.com/JSP/Page");

    /**
     * Returns a ValidationMessage array with information about validation
     * errors, or null if no errors are found.
     */
    public ValidationMessage[] validate(String prefix, String uri, 
        PageData pd) {
	
	ValidationMessage[] vms = null;
	ArrayList msgs = new ArrayList();
        try {
            Document doc = builder.build(pd.getInputStream());
            Element root = doc.getRootElement();
	    validateElement(root, prefix, msgs);
	}
        catch (Exception e) {
	    vms = new ValidationMessage[1];
	    vms[0] = new ValidationMessage(null, e.getMessage()); 
        } 

	if (msgs.size() != 0) {
	    vms = new ValidationMessage[msgs.size()];
	    msgs.toArray(vms);
	}
	return vms;
    }

    /**
     * Dispatches to the appropriate validation method for the
     * specified element, and calls itself recursively for all
     * children of the element.
     */
    private void validateElement(Element e, String ns, ArrayList msgs) {
	if (ns.equals(e.getNamespace().getPrefix())) {
	    if (e.getName().equals("param")) {
		validateParam(e, ns, msgs);
	    }
	}
	if (e.hasChildren()) {
	    List kids = e.getChildren();
	    Iterator i = kids.iterator();
	    while(i.hasNext()) {
		validateElement((Element) i.next(), ns, msgs);
	    }
	}
    }

    /**
     * Validates that a param element is only used within the body of
     * a forward element. If not, a ValidationMessage is added to the
     * message array.
     */
    private void validateParam(Element e, String ns, ArrayList msgs) {
	Element parent = findParent(e, ns, "forward");
	if (parent == null) {
	    String id = e.getAttributeValue("id", jspNamespace);
	    ValidationMessage vm = new ValidationMessage(id,
		e.getQualifiedName() + " must only be used with 'forward'");
	    msgs.add(vm);
	}
    }

    /**
     * Returns the closest parent element of the specified element that
     * matches the specified namespace and name.
     */
    private Element findParent(Element e, String ns, String name) {
	if (e.getName().equals(name) && 
	    ns.equals(e.getNamespace().getPrefix())) {
	    return e;
	}
	Element parent = e.getParent();
	if (parent != null) {
	    return findParent(parent, ns, name);
	}
	return null;
    }
}
