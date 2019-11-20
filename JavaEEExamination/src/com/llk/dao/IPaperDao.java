package com.llk.dao;

import java.util.List;
import com.llk.vo.Paper;

public interface IPaperDao {
	Boolean savePaper(Paper paper);
	List<Paper> searchPaper(int paperType);
}
