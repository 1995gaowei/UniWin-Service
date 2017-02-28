package productManage.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;

@Repository
public class BaseDaoImpl implements BaseDao {
	/** * Autowired �Զ�װ�� �൱��get() set() */
	@Autowired
	protected SessionFactory sessionFactory;

	/** * gerCurrentSession ���Զ��ر�session��ʹ�õ��ǵ�ǰ��session���� * * @return */
	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/** * openSession ��Ҫ�ֶ��ر�session ��˼�Ǵ�һ���µ�session * * @return */
	@Override
	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	@Override
	public void flush() {
		getSession().flush();
	}

	@Override
	public void clear() {
		getSession().clear();
	}

	/** * ��� id ��ѯ��Ϣ * * @param id * @return */
	@Override
	@SuppressWarnings("rawtypes")
	public Object load(Class c, String id) {
		Session session = getSession();
		return session.get(c, id);
	}
	
	//һ�������д�ķ������Լ��ӵ� 
	@Override
	@SuppressWarnings("rawtypes")
	public Object load(Class c, int id) {
		Session session = getSession();
		return session.get(c, id);
	}


	/** * ��ȡ������Ϣ * * @param c * * @return */

	@Override
	public List getAllList(Class c) {
		String hql = "from " + c.getName();
		Session session = getSession();
		return session.createQuery(hql).list();

	}

	/** * ��ȡ������ * * @param c * @return */

	@Override
	public Long getTotalCount(Class c) {
		Session session = getNewSession();
		String hql = "select count(*) from " + c.getName();
		Long count = (Long) session.createQuery(hql).uniqueResult();
		session.close();
		return count != null ? count.longValue() : 0;
	}

	/** * ���� * * @param bean * */
	@Override
	public void save(Object bean) {
	
			Session session = getSession();
			session.save(bean);
			session.flush();
			session.clear();
	
	}

	/** * ���� * * @param bean * */
	@Override
	public void update(Object bean) {////////修改处/////////////////////////////////删去了try,catch
		
			Session session = getSession();
			session.update(bean);
			session.flush();
			session.clear();
		
		
	}

	/** * ɾ�� * * @param bean * */
	@Override
	public void delete(Object bean) {

		Session session = getSession();
		session.delete(bean);
		session.flush();
		session.clear();
	}

	/** * ���IDɾ�� * * @param c �� * * @param id ID * */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public void delete(Class c, String id) {
		Session session = getNewSession();
		Object obj = session.get(c, id);
		session.delete(obj);
		session.flush();
		session.clear();
		session.close();
	}

	/** * ����ɾ�� * * @param c �� * * @param ids ID ���� * */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public void delete(Class c, String[] ids) {
		for (String id : ids) {
			Object obj = getSession().get(c, id);
			if (obj != null) {
				getSession().delete(obj);
			}
		}
	}

	@Override
	public List queryForPage(final String hql, final int offset, final int length) {
		Query query = getSession().createQuery(hql);
		query.setFirstResult(offset);  
		query.setMaxResults(length);  
		List list = query.list();  
		return list;  
	}

	@Override
	public int getAllRowCount(String hql) {
		Session session = getNewSession();
		List list =  session.createQuery(hql).list();
		session.close();
		return  (list != null ? list.size() : 0);
	}
	
	 


}
