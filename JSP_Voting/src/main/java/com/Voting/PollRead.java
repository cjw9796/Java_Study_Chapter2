package com.Voting;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class PollRead {
	// 텍스트 파일의 내용을 읽어서 Arraylist에 저장해서 리턴하는 메서드 
	
	//메서드 호출 시 파일이 있는 경로를 넘겨준다. 
	public static ArrayList<String> pollRead(String filepath){
	
		//텍스트 파일에서 내용을 저장해서 리턴시키는 객체를 선언한다. 
		ArrayList<String> poll = null;		
		Scanner scanner = null;
		
		try {
			scanner = new Scanner(new File(filepath));
			poll = new ArrayList<>();
			
			//파일의 끝까지(더 이상 읽을 줄이 없을 때 까지) 반복하며 텍스트 파일을 읽어서 Arraylist에 저장한다.
			// 이 때 사용되는 메서드 : hasNextLine()
			
			while(scanner.hasNextLine()) {
				String str = scanner.nextLine().trim();
				//읽어온 줄이 빈 줄이 아니면 Arraylist에 저장한다. 
				if(str.length() > 0) {
					poll.add(str);
				}
			}
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("디스크에 파일이 존재하지 않습니다!");
			e.printStackTrace();
		}
		
		
		
		return poll;
	}
	

}
