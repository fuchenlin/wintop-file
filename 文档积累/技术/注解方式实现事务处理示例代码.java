package com.example.impl;

import javax.annotation.Resource;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.example.dao.StudentDao;
import com.example.dao.TeacherDao;
import com.example.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private StudentDao studentDao;
	@Resource
	private TeacherDao teacherDao;
	
	@Resource
    private DataSourceTransactionManager transactionManager;

	//1,事务回滚
	@Transactional
	public void saveUser1() {
		studentDao.saveStudent();
		teacherDao.saveTeacher();
	}
	
	//2,try-catch事务不回滚
	@Transactional
	public void saveUser2() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
		}
		
	}
	
	//3，try-catch抛出运行时异常，事务回滚
	@Transactional
	public void saveUser3() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
			throw new RuntimeException("抛出异常");
		}
	}
	
	//4,try-catch 不抛出运行时异常，手动回滚
	@Transactional
	public void saveUser4() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	//try-catch-finally,有返回值，finally执行后程序结束，抛出运行时异常不执行，事务不回滚
	@Transactional
	public int saveUser5() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
			throw new RuntimeException("抛出异常");
		}finally {
			return 1;
		}
	}
	
	
	//6,try-catch-finally,有返回值，finally执行之前，手动回滚事务
	@Transactional
	public int saveUser6() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}finally {
			return 1;
		}
	}

}
