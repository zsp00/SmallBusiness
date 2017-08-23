/*
 * Copyright© 2003-2016 浙江汇信科技有限公司, All Rights Reserved. 
 */
package com.icinfo.cs.sccheck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icinfo.cs.common.utils.StringUtil;
import com.icinfo.cs.sccheck.dto.PubScWorkPlanDto;
import com.icinfo.cs.sccheck.mapper.PubScWorkPlanMapper;
import com.icinfo.cs.sccheck.model.PubScWorkPlan;
import com.icinfo.cs.sccheck.service.IPubScWorkPlanService;
import com.icinfo.framework.core.service.support.MyBatisServiceSupport;
import com.icinfo.framework.mybatis.mapper.entity.Example;
import com.icinfo.framework.mybatis.pagehelper.PageHelper;
import com.icinfo.framework.mybatis.pagehelper.datatables.PageRequest;

/**
 * 描述:    cs_pub_scwork_plan 对应的Service接口实现类.<br>
 *
 * @author framework generator
 * @date 2017年05月17日
 */
@Service
public class PubScWorkPlanServiceImpl extends MyBatisServiceSupport implements IPubScWorkPlanService {

	@Autowired
	private PubScWorkPlanMapper pubScWorkPlanMapper;
	/**
	 * 
	 * 描述   保存
	 * @author  赵祥江
	 * @date 2017年5月17日 上午9:47:49 
	 * @param  
	 * @throws
	 */
	@Override
	public int insertPubScWorkPlan(PubScWorkPlan pubScWorkPlan)
			throws Exception {
		if(pubScWorkPlan!=null){
			return pubScWorkPlanMapper.insert(pubScWorkPlan);
		}
		return 0;
	}

	/**
	 * 
	 * 描述   根据uid查询
	 * @author  赵祥江
	 * @date 2017年5月17日 上午9:47:59 
	 * @param  
	 * @throws
	 */
	@Override
	public PubScWorkPlan selectPubScWorkPlanByUid(String uid) throws Exception {
		if(StringUtil.isNotBlank(uid)){
			PubScWorkPlan pubScWorkPlan=new PubScWorkPlan();
			pubScWorkPlan.setUid(uid);
			return pubScWorkPlanMapper.selectOne(pubScWorkPlan);
		}
		return null;
	}

	/**
	 * 
	 * 描述   根据uid更新
	 * @author  赵祥江
	 * @date 2017年5月17日 上午9:48:14 
	 * @param  
	 * @throws
	 */
	@Override
	public int updatePubScWorkPlanByUid(PubScWorkPlan pubScWorkPlan)
			throws Exception {
		if(pubScWorkPlan!=null&&StringUtil.isNotBlank(pubScWorkPlan.getUid())){
			Example example = new Example(PubScWorkPlan.class);
			example.createCriteria()
			.andEqualTo("uid", pubScWorkPlan.getUid()); 
			return pubScWorkPlanMapper.updateByExampleSelective(pubScWorkPlan, example);
		}
		return 0;
	}

	/**
	 * 
	 * 描述   根据uid删除
	 * @author  赵祥江
	 * @date 2017年5月17日 上午9:48:37 
	 * @param  
	 * @throws
	 */
	@Override
	public int deletePubScWorkPlanByUid(String uid) throws Exception {
		if(StringUtil.isNotBlank(uid)){
			PubScWorkPlan pubScWorkPlan=new PubScWorkPlan();
			pubScWorkPlan.setUid(uid);
			return pubScWorkPlanMapper.delete(pubScWorkPlan);
		}
		return 0;
	}

	/**
	 * 
	 * 描述   分页查询
	 * @author  赵祥江
	 * @date 2017年5月17日 上午9:48:48 
	 * @param  
	 * @throws
	 */
	@Override
	public List<PubScWorkPlanDto> queryPubScWorkPlanListJSON(PageRequest request)
			throws Exception {
		PageHelper.startPage(request.getPageNum(), request.getLength());
		return pubScWorkPlanMapper.selectPubScWorkPlanList(request.getParams());
	}

	/**
	 * 
	 * 描述   TODO
	 * @author  赵祥江
	 * @date 2017年5月17日 下午3:44:49 
	 * @param  
	 * @throws
	 */
	@Override
	public List<PubScWorkPlan> selectPubScWorkPlanByPlanName(String planName)
			throws Exception {
		PubScWorkPlan pubScWorkPlan=new PubScWorkPlan();
		pubScWorkPlan.setPlanName(planName);
		return pubScWorkPlanMapper.select(pubScWorkPlan);
	}
}