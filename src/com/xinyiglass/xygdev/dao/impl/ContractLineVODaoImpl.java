package com.xinyiglass.xygdev.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.ContractLineVODao;
import com.xinyiglass.xygdev.entity.ContractLineVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("ContractLineVODao")
public class ContractLineVODaoImpl extends DevJdbcDaoSupport implements ContractLineVODao{
	
	@Autowired
	ContractLineVODaoImpl(DataSource dataSource) {
		setDataSource(dataSource);
	}
	
	//自动序号递增，每次递增量为addCount
	public Long autoAddSequence(Long headerId) throws Exception{
		String addCount = "1";
		String sql="SELECT MAX(LINE_NUM)+"+addCount+" LINE_NUM FROM XYG_QBORD_CONTRACT_LINES WHERE HEADER_ID = :1";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", headerId);
		Long seq = null;
		try{
			BigDecimal seqBD = (BigDecimal) this.getDevJdbcTemplate().queryForObjSingle(sql, paramMap);
		    seq=seqBD.longValue();
		}catch(NullPointerException NullPointerException) {
			seq = 1L;
		}		
		return seq;
	}	
	
	public PlsqlRetValue getUnitPrice(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.GET_UNIT_PRICE_BY_LIST( "
				+ "  :1"
				+ " ,:2"
				+ " ,SYSDATE"
                + " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:"+PlsqlRetValue.PARAM1
                + " ,:"+PlsqlRetValue.PARAM2
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("inventoryItemId"));
		paramMap.put("2", conditionMap.get("orgId"));
		//paramMap.put("3", "SYSDATE");
		paramMap.put("3", conditionMap.get("currCode"));
		paramMap.put("4", conditionMap.get("priceListId"));
		paramMap.put("5", conditionMap.get("orderQuantity"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.INSERT_CONTRACT_LINE( "
				+ "  :1"
				+ " ,:2"
                + " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:6"
                + " ,:7"
                + " ,:8"
                + " ,:9"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("lineId"));
		paramMap.put("2", conditionMap.get("headerId"));
		paramMap.put("3", conditionMap.get("lineNum"));
		paramMap.put("4", conditionMap.get("inventoryItemId"));
		paramMap.put("5", conditionMap.get("shipFromOrgId"));
		paramMap.put("6", conditionMap.get("orderQuantity"));
		paramMap.put("7", conditionMap.get("currCode"));
		paramMap.put("8", conditionMap.get("priceListId"));
		paramMap.put("9", conditionMap.get("remarks"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue lock(ContractLineVO cl) throws Exception{
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.LOCK_CONTRACT_LINE( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", cl.getLineId());
		paramMap.put("2", cl.getUnitPrice());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue update(ContractLineVO cl) throws Exception{
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.UPDATE_CONTRACT_LINE( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", cl.getLineId());
		paramMap.put("2", cl.getUnitPrice());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue delete(Long lineId) throws Exception{
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.DELETE_CONTRACT_LINE( "
				+ "  :1"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", lineId);
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public ContractLineVO findVOById(Long lineId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBORD_CONTRACT_LINES_V WHERE LINE_ID = :1";
		paramMap.put("1", lineId);
		return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new ContractLineVO());
	}
	
	public SqlResultSet findJSONById(Long lineId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBORD_CONTRACT_LINES_V WHERE LINE_ID = :1";
		paramMap.put("1", lineId);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
}
