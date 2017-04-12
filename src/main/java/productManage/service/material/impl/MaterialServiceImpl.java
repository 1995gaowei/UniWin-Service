package productManage.service.material.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.BaseDao;
import productManage.dao.lhj.MaterialDao;
import productManage.dao.lhj.SupplyDao;
import productManage.dao.lhj.WarehouseDao;
import productManage.dao.wjx.StoreDao;
import productManage.model.cs.Processor;
import productManage.model.lhj.Material;
import productManage.model.lhj.Materialapply;
import productManage.model.lhj.Supply;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.Store;
import productManage.service.PageService;
import productManage.service.material.MaterialService;
import productManage.vo.PageBean;
import productManage.vo.material.ApplyConstants;
import productManage.vo.material.MaterialConstants;
import productManage.vo.process.ProcessConstants;
import productManage.vo.technique.TechniqueConstants;
///////////第二次修改001////////////////////
import productManage.dao.lhj.MaterialapplyDao;

///////////第二次修改001///////////////////
@Service
public class MaterialServiceImpl implements MaterialService{

	@Autowired
	private MaterialDao materialdao;
	@Autowired
	private WarehouseDao warehousedao;
	@Autowired
	private BaseDao basedao;
	@Autowired
	private PageService pageservice;
	@Autowired
	private SupplyDao supplydao;
///////////第二次修改001////////////////////
	@Autowired
	private MaterialapplyDao materialapplydao;	
///////////第二次修改001////////////////////
	
	@Override
	public void addMaterial(Material material) {
		// TODO Auto-generated method stub
		materialdao.add(material);
	}
	

	@Override
	public void addSupply(Supply supply) {
		// TODO Auto-generated method stub
		basedao.save(supply);
	}

	@Override
	public void addStore(Store store) {
		// TODO Auto-generated method stub
		basedao.save(store);
	}

	@Override
	public PageBean queryMaterial(int pageSize, int page, Map<String, Object> params) {
		// TODO Auto-generated method stub
//第二次修改String hql="select distinct(supply) from Material as material ,Store as store, Supply as supply,Vendor as vendor ";
		//////////第二次修改001//////////////////////////////////////
		String hql="select material.materialCode,material.materialName,material.materialType,vendor.vendorName,store.remainVol ,store.warehouse.location,material.colorDescription,material.materialIngredient,store.warehouse.warehouseid from Material as material,Store as store, Supply as supply,Vendor as vendor ";
	
		//////////第二次修改001/////////////////////////////////////
		String materialName = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[0]);
		String materialCode = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[1]);
		String materialType = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[2]);
		String vendorName = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[3]);
            hql += "where ";
            hql +=" material.materialCode=store.material.materialCode and material.materialCode=supply.material.materialCode and vendor.vendorId=supply.vendor.vendorId ";
		//System.out.println(materialCode);
		if(materialName!=null&&!(materialName.equals(""))){
			hql += "and ";
			hql += " material.materialName like '%" + materialName + "%' ";
			System.out.println(1);
		}
        if(materialCode!=null&&!(materialCode.equals(""))){     
			hql += "and  ";
			hql += " material.materialCode like '%" + materialCode + "%' ";
			//hql += " and supply.material.materialCode like '%" + materialCode + "%' ";
			//hql += " and store.material.materialCode like '%" + materialCode + "%' ";
			System.out.println(2);
        }
         if(materialType!=null&&!(materialType.equals(""))){ 
			hql += "and ";
			hql += " material.materialType like '%" + materialType + "%' ";
			System.out.println(3);
        } 
       if(vendorName!=null&&!(vendorName.equals(""))){ 
			hql += "and ";         
			hql += " vendor.vendorName like '%" + vendorName + "%' ";
			System.out.println(4);
        }
        System.out.println(hql);
        
		PageBean pageBean = pageservice.queryForPage(hql,pageSize,page);
		List<Material> materialList = pageBean.getList();
		pageBean.setList(materialList);
		return pageBean;
	}
	
	@Override
	public PageBean queryMaterialByCND(int pageSize, int page, Map<String, Object> params) {	
		String materialName = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[0]);
		String materialCode = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[1]);		
		String designCode = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[4]);
		String hql="select distinct(s) from Store as s,WareHouse as w,Material as m "; 
		if(designCode!=null&&!(designCode.equals(""))){
			hql += ",Design as d,Bom as b ";
		}
		hql += " where ";
          
		int flag=0;
		//System.out.println(materialCode);
		if(materialName!=null&&!(materialName.equals(""))){
			if(flag ==1 ){
				hql += " and ";
			}
			hql += " m.materialName like '%" + materialName + "%' ";
			flag=1;    
		}
        if(materialCode!=null&&!(materialCode.equals(""))){     
        	if(flag ==1 ){
				hql += " and ";
        	}
			hql += " m.materialCode like '%" + materialCode + "%' ";
			//hql += " and b.material.materialCode like '%" + materialCode + "%' ";
			//hql += " and s.material.materialCode like '%" + materialCode + "%' ";
			flag=1;
        }
         if(designCode!=null&&!(designCode.equals(""))){ 
        	if(flag ==1 )
				hql += " and ";
			hql += " d.designCode like '%" + designCode + "%' ";
			hql += " and b.material.materialCode=m.materialCode and b.design.designID=d.designID";
			flag=1;
        }	
        if(flag ==1 )
			hql += " and ";
            hql +=" m.materialCode=s.material.materialCode  and s.warehouse.warehouseid=w.warehouseid ";     
        System.out.println(hql);
		PageBean pageBean = pageservice.queryForPage(hql,pageSize,page);
		List<Material> materialList = pageBean.getList();
		pageBean.setList(materialList);
		return pageBean;
	}
	
	public Material getMaterialByCode(String materialCode){
		return materialdao.getMaterialByMaterialCode(materialCode);
	}
	
	public List<Material> getMaterialByKey(String key){
		return materialdao.getMaterialByKey(key);
	}

	@Override
	public void updateMaterial(Material material) {
		// TODO Auto-generated method stub
		materialdao.update(material);
	}

	@Override
	public PageBean queryApply(int pageSize, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select apply from Materialapply as apply";
		String materialApplyCode = (String)params.get(ApplyConstants.SEARCH_APPLY_PARAMS[0]);
		String materialApplyDate = (String)params.get(ApplyConstants.SEARCH_APPLY_PARAMS[1]);

		if((!(materialApplyCode.equals("")))&&(!(materialApplyDate.equals("")))){
			hql+=" where ";
			hql+="apply.materialApplyCode like '%"+materialApplyCode+"%'"+" and apply.matrialApplyDate like '%"+materialApplyDate+"%'";
		}
		else{
			if(!(materialApplyCode.equals(""))){
				hql+=" where ";
				hql+="apply.materialApplyCode like '%"+materialApplyCode+"%'";
			}
			if(!(materialApplyDate.equals(""))){
				hql+=" where ";
				hql+="apply.matrialApplyDate like '%"+materialApplyDate+"%'";
			}
		}
			
		hql += " order by apply.matrialApplyDate desc";
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		return pageBean;
	}

	@Override
	public List<Material> getMaterialList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select material from Material as material ";
		String materialName = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[0]);
		if (materialName != null) {
			hql += "where ";
			hql += "material.materialName like '%" + materialName + "%' ";
		}
		hql += " order by modificationDate desc";
		List<Material> materialList = materialdao.getMaterialList(hql);
		System.out.println(materialList.size());
		return materialList;
	}


	@Override
	public WareHouse getWarehouseByLocation(String location) {
		// TODO Auto-generated method stub
		WareHouse warehouse = warehousedao.getWarehouseByLocation(location);
		return warehouse;
	}


	@Override
	public List<WareHouse> getWareHouseList() {
		// TODO Auto-generated method stub
		List<WareHouse> list = warehousedao.getWarehouseList();
		return list;
	}


	@Override
	public List<Material> getFuliaoMaterial() {
		// TODO Auto-generated method stub
		String hql="select material from Material as material where material.materialType='辅料'";
		return materialdao.getMaterialList(hql);
	}


	@Override
	public List<Supply> getSupplyListByMaterialCode(String MaterialCode) {
		// TODO Auto-generated method stub
		 List<Supply> list = supplydao.getSupplyByMaterial(MaterialCode);
			return list;
	}


	@Override
	public List<Material> getMaterialListByAll(Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select material from Material as material ";
		String materialName = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[0]);
		String materialCode = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[1]);
		String materialType = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[2]);
		String colorCode = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[5]);
		int f = 0 ;
		if (!materialName.equals("")&&materialName!=null) {
			if(f == 0)
			hql += "where ";
			else
			hql += "and ";
			hql += "material.materialName like '%" + materialName + "%' ";			
			f=1;
			System.out.println("1");
		}
		if (!materialCode.equals("")&&materialCode!=null) {
			if(f == 0)
			hql += "where ";
			if(f == 1)
			hql += "and ";
			hql += "material.materialCode like '%" + materialCode + "%' ";		
			f=1;
			System.out.println("2");
		}
		if (!materialType.equals("")&&materialType!=null) {
			if(f == 0)
			hql += "where ";
			if(f == 1)
			hql += "and ";
			hql += "material.materialType like '%" + materialType + "%' ";	
			f=1;
			System.out.println("3");
		}
		if (!colorCode.equals("")&&colorCode!=null) {
			if(f == 0)
			hql += "where ";
			if(f == 1)
			hql += "and ";
			hql += "material.colorCode like '%" + colorCode + "%' ";
			f=1;
			System.out.println("4");
		}
		System.out.println(hql);
		
		List<Material> materialList = materialdao.getMaterialList(hql);
		return materialList;
	}


	@Override
	public PageBean queryMaterialVendorByCode(int pageSize, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql = "from supply as material,Vendor as vendor,Supply as supply ";
	       hql += "where ";
	       hql += "material.materialCode=supply.material.materialCode and supply.vendor.vendorId=vendor.vendorId ";
	String materialCode = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[1]);
	if (materialCode != null&&!(materialCode.equals(""))) {
		hql += "and ";
		hql += " material.materialName like '%" + materialCode + "%' ";
	}
	
	PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
	return pageBean;
	}


	@Override
	public void addMaterialApply(Materialapply materialapply) {
		// TODO Auto-generated method stub
		basedao.save(materialapply);
	}
	
	////////////////第二次修改////////////////////////////////////
	@Override
	public Materialapply getMaterialApplyList(String materialapplycode){
		
		return materialapplydao.getMaterialApplyByCode(materialapplycode);
	}
	////////////////第二次修改////////////////////////////////////


	

}
