package com.llk.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.llk.service.IPaperService;
import com.llk.service.impl.PaperServiceImpl;
import com.llk.util.Json;
import com.llk.vo.Paper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PaperAction extends ActionSupport implements ModelDriven<Paper>{
	private Paper paper = new Paper();
	private IPaperService paperService = new PaperServiceImpl();
	@Override
	public Paper getModel() {
		// TODO Auto-generated method stub
		return paper;
	}
	public String showJavaTestView(){
		ServletActionContext.getRequest().getSession().setAttribute("paperType", 0);
		return "showTestView";
	}
	public String showJsTestView(){
		
		ServletActionContext.getRequest().getSession().setAttribute("paperType", 1);
		return "showTestView";
	}
	public String showSavePaperView(){
		return "showSavePaperView";
	}
	public String savePaper() throws IOException{
		Boolean success = paperService.savePaper(paper);
		System.out.println(success);
		if(success){
			/*ServletActionContext.getRequest().getSession().setAttribute("paperIsSaved", "true");*/
			HttpServletResponse resp = ServletActionContext.getResponse();
			resp.getWriter().print("true");
			
		}else{
			HttpServletResponse resp = ServletActionContext.getResponse();
			resp.getWriter().print("false");
		}
		return NONE;
	}
	public String searchPaper(){
		int paperType = (Integer) ServletActionContext.getRequest().getSession().getAttribute("paperType");
		Json result = paperService.searchPaper(paperType);
		String resultStr = new Gson().toJson(result);
		if(result.isSuccess()){
			try {
				ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
				ServletActionContext.getResponse().getWriter().println(resultStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return NONE;
	}
	public String getPaperList(){
		HttpServletRequest req = ServletActionContext.getRequest();
		String paperTypes = req.getParameter("paperTypes");
		int paperType1 = Integer.parseInt(paperTypes.substring(0, 1));
		int paperType2 = Integer.parseInt(paperTypes.substring(2));
		Json result1 = paperService.getPaperList(paperType1);
		Json result2 = paperService.getPaperList(paperType2);
		List<Json> json = new ArrayList<Json>();
		json.add(result1);
		json.add(result2);
		String resultStr = new Gson().toJson(json);
		System.out.println(resultStr);
		if(result1.isSuccess() == true&&result2.isSuccess() == true){
			HttpServletResponse resp = ServletActionContext.getResponse();
			try {
				resp.setContentType("text/json;charset=UTF-8");
				resp.getWriter().print(resultStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return NONE;
	}
}
