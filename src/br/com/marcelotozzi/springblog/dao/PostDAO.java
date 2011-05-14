package br.com.marcelotozzi.springblog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import br.com.marcelotozzi.springblog.domain.Post;

public class PostDAO {
	protected EntityManager entityManager;

	public PostDAO() {
	}
	
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager){
		this.entityManager = entityManager;
	}
	
	public Post find(Long id){
		System.out.println(id);
		return entityManager.find(Post.class, id);
	}
	
	@Transactional
	public void persist(Post post){
		entityManager.persist(post);
	}
	
	@Transactional
	public void merge(Post post){
		entityManager.merge(post);
	}
	
	@Transactional
	public void remove(Post post){
		entityManager.remove(post);
	}
	
	@SuppressWarnings("unchecked")
	public List<Post> findAll(){
		return entityManager.createQuery("SELECT p FROM Post p").getResultList();
	}
}