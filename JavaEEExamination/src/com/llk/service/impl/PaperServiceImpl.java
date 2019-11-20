package com.llk.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import llk.math.random.RandomNumber;
import llk.math.random.exception.RandomNumberException;

import com.llk.dao.IPaperDao;
import com.llk.dao.impl.PaperDaoImpl;
import com.llk.service.IPaperService;
import com.llk.util.Json;
import com.llk.util.PaperJson;
import com.llk.vo.Paper;

public class PaperServiceImpl implements IPaperService{
	private IPaperDao paperDao = new PaperDaoImpl();
	@Override
	public Boolean savePaper(Paper paper) {
		// TODO Auto-generated method stub
		return paperDao.savePaper(paper);
	}
	@Override
	//用来得到考试页面所需的试题
	public Json searchPaper(int paperType) {
		//创建Json对象用以存储查询结果
		Json result = new Json();
		//获的从dao层取得的试题数据集合
		List<Paper> paperList= paperDao.searchPaper(paperType);
		//设置随机数用以获取不同试题
		int randomIndexes [] = null;
		try {
			//调用RandomNumber类获得0到集合长度的5个不同的随机数
		  randomIndexes = new RandomNumber().getDftIntNumber(0, paperList.size()-1, 5);
		} catch (RandomNumberException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//定义set集合用以存储从list集合中取得的5个不同试题
		Set<PaperJson> paperSet = new HashSet<PaperJson>();
		System.out.println(paperList.size());
		for(int i = 0;i<randomIndexes.length;i++){
			PaperJson paperJson = new PaperJson();
			Paper paper = paperList.get(randomIndexes[i]);
			paperJson.setQuestion(paper.getQuestionName());
			paperJson.setCorrectAnswer(paper.getCorrectAnswer());
			String answers[] = new String[4];
			answers[0] = paper.getAnswerA();
			answers[1] = paper.getAnswerB();
			answers[2] = paper.getAnswerC();
			answers[3] = paper.getAnswerD();
			paperJson.setAnswers(answers);
			paperSet.add(paperJson);
			
		}
		/*for(int i = 0;i<paperList.size();i++){
			if(paperNum>4){
				
				break;
			}else{
				PaperJson paperJson = new PaperJson();
				Paper paper = paperList.get(i);
				paperJson.setQuestion(paper.getQuestionName());
				paperJson.setCorrectAnswer(paper.getCorrectAnswer());
				String answers[] = new String[4];
				answers[0] = paper.getAnswerA();
				answers[1] = paper.getAnswerB();
				answers[2] = paper.getAnswerC();
				answers[3] = paper.getAnswerD();
				paperJson.setAnswers(answers);
				paperSet.add(paperJson);
				paperNum++;
			}
		}*/
		result.setObj(paperSet);
		result.setSuccess(true);
		
	
		return result;
	}
	@Override
	//用以试题页面展示试题列表
	public Json getPaperList(int paperType) {
		Json result = new Json();
		
		List<Paper> paperList= paperDao.searchPaper(paperType);
		result.setSuccess(true);
		result.setObj(paperList);
		return result;
	}
}


	