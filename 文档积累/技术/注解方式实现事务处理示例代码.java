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

	//1,����ع�
	@Transactional
	public void saveUser1() {
		studentDao.saveStudent();
		teacherDao.saveTeacher();
	}
	
	//2,try-catch���񲻻ع�
	@Transactional
	public void saveUser2() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
		}
		
	}
	
	//3��try-catch�׳�����ʱ�쳣������ع�
	@Transactional
	public void saveUser3() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
			throw new RuntimeException("�׳��쳣");
		}
	}
	
	//4,try-catch ���׳�����ʱ�쳣���ֶ��ع�
	@Transactional
	public void saveUser4() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	//try-catch-finally,�з���ֵ��finallyִ�к����������׳�����ʱ�쳣��ִ�У����񲻻ع�
	@Transactional
	public int saveUser5() {
		try{
			studentDao.saveStudent();
			teacherDao.saveTeacher();
		} catch(Exception e){
			throw new RuntimeException("�׳��쳣");
		}finally {
			return 1;
		}
	}
	
	
	//6,try-catch-finally,�з���ֵ��finallyִ��֮ǰ���ֶ��ع�����
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
