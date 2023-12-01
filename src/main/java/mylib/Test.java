package mylib;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

   public static void main(String[] args) throws ParseException {
      Date date=new Date();
      System.out.println(date);
      System.out.println(new String(date.toString()));
      
      //Date객체의 날짜는 객체를 생성하여 직접 지정이 안됨
      //아래코드는 오류가 발생
      //Date d2=new Date("2020-01-02");
      
      
      //먼저 날짜 형식을 정함->SimpleDateFormat으로 psarse함수를 사용하여 데이터 형식으로 변경
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
      /* Date d=sdf.parse(date.toString()); */
      Date d=sdf.parse("20220103");
      System.out.println(d.toString()); //Date의 표준형식을 훌력
      System.out.println(sdf.format(d)); //SimpledateFormat을 이용하여 포맷된 날짜로 변경
      
      SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
      String sdata=sdf2.format(d);
      System.out.println(sdata);
      
      SimpleDateFormat sdf3=new SimpleDateFormat("yyyy년MM월dd일");
      System.out.println(sdf3.format(new Date()));
      
   }
}