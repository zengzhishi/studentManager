package test;

import java.util.ArrayList;
import java.util.Iterator;

public class test {

	public static void main(String[] args) {
		 ArrayList a1 = new ArrayList();
	     a1.add("java");
	     a1.add("php");//List�����е�Ԫ�ؿ����ظ�
	     a1.add(".net");
	     System.out.println("ԭ���ϣ�"+a1);
	     a1.add(1, "Flash");
	     a1.add(0, "ps");    
	     System.out.println(a1);

	     Iterator it = a1.iterator();
	     while(it.hasNext()){
	    	 Object obj = it.next();
	    	 if (obj.equals("Flash"))
	    		 it.remove();//��java02�����ôӼ�����ɾ����
	    	 System.out.println("obj:"+obj);
	     }
	     
	}
}
