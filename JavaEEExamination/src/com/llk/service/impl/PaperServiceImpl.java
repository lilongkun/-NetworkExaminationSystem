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
	//�����õ�����ҳ�����������
	public Json searchPaper(int paperType) {
		//����Json�������Դ洢��ѯ���
		Json result = new Json();
		//��Ĵ�dao��ȡ�õ��������ݼ���
		List<Paper> paperList= paperDao.searchPaper(paperType);
		//������������Ի�ȡ��ͬ����
		int randomIndexes [] = null;
		try {
			//����RandomNumber����0�����ϳ��ȵ�5����ͬ�������
		  randomIndexes = new RandomNumber().getDftIntNumber(0, paperList.size()-1, 5);
		} catch (RandomNumberException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//����set�������Դ洢��list������ȡ�õ�5����ͬ����
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
	//��������ҳ��չʾ�����б�
	public Json getPaperList(int paperType) {
		Json result = new Json();
		
		List<Paper> paperList= paperDao.searchPaper(paperType);
		result.setSuccess(true);
		result.setObj(paperList);
		return result;
	}
}


	