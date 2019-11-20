package com.llk.service;

import com.llk.util.Json;
import com.llk.vo.Paper;



public interface IPaperService {
	Boolean savePaper(Paper paper);
	Json searchPaper(int paperType);
	Json getPaperList(int paperTypes);
}
