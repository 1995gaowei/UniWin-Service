package productManage.service.material.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.lhj.BomDao;
import productManage.dao.lhj.MaterialDao;
import productManage.dao.tms.DesignDAO;
import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.tms.Design;
import productManage.service.PageService;
import productManage.service.material.BomService;
import productManage.util.DateFormat;
import productManage.vo.PageBean;
import productManage.vo.technique.TechniqueConstants;

@Service
public class BomServiceImpl implements BomService{

	@Autowired
	private MaterialDao materialdao;
	@Autowired
	private DesignDAO designdao;
	@Autowired
	private BomDao bomdao;
	@Autowired
	private PageService pageservice;
	@Override
	public PageBean queryDesign1(int pageSize, int page,
			Map<String, Object> params,int f) {
		String designCode = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[0]);
		String designPutawayDate = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[1]);
        String techShellType = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[2]);
        String designName = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[3]);
        String designTechProcedure = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[4]);
        if(designTechProcedure.equals("未指定"))
        	designTechProcedure="";
        String hql=new String();   
        if(f==1)
            hql="select de from Design de,Technique t ";
         else 
            hql="select t from Design de,Technique t ";
            hql+=" where ";
            hql+=" t.design.designID=de.designID ";
            if(!(designCode.equals(""))){
				hql += " and ";
			hql+=" de.designCode like '%"+designCode+"%' ";
		}
            if(!(designPutawayDate.equals(""))){
				hql += " and ";
			hql+=" de.designPutawayDate like '%"+designPutawayDate+"%' ";
		}		
            if(!(designName.equals(""))){
				hql += " and ";
			hql+=" de.designName like '%"+designName+"%' ";
		}
			if(!(designTechProcedure.equals(""))){
					hql += " and ";
				hql+=" de.designTechProcedure like '%"+designTechProcedure+"%' ";
			}
			if(!(techShellType.equals(""))){
				hql += " and ";
				hql+=" t.techShellType like '%"+techShellType+"%' ";	
			}           
	    System.out.println(hql);
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		
		return pageBean;
	}
	
	@Override
	public void addDesign(Design design) {
		// TODO Auto-generated method stub
		designdao.addDesign(design);
	}
	
	public void quitDesign(String designId){
		designdao.quitDesign(designId);
	}
	
	@Override
	public void addBom(Bom bom) {
		// TODO Auto-generated method stub
		bomdao.addBom(bom);
	}
	
	public void deleteBom(Material m,Design d){
		bomdao.deleteBom(m, d);
	}
	
	@Override
	public Design getDesignById(String id){
		return designdao.findById(id);
	}

	@Override
	public PageBean queryDesign(int pageSize, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select d from Design d where 1=1";
		String designCode = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[0]);
		String putawayDate = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[1]);
		String designName = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[3]);
		String designTechProcedure = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[4]);
		if(!(designCode==null || designCode.equals("") )){
			hql+=" and d.designCode like '%"+designCode+"%'";
		}
		if(!(putawayDate==null || putawayDate.equals(""))){
			hql+=" and d.designPutawayDate like '%"+putawayDate+"%'";
		}
		if(!(designName==null || designName.equals("")))
		{
			hql +=" and d.designName like '%"+designName+"%'";
		}
		if(!(designTechProcedure==null || designTechProcedure.equals("")))
		{
			hql +=" and d.designName like '%"+designTechProcedure+"%'";
		}
		
			
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		return pageBean;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Design> getAllDesign() {
		// TODO Auto-generated method stub
		List<Design> list = pageservice.query("select design from Design as design order by designCode desc");
		return list;
	}
}
