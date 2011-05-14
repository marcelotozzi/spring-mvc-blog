package br.com.marcelotozzi.springblog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import br.com.marcelotozzi.springblog.domain.Comment;

public class CommentDAO {
	protected EntityManager entityManager;

	public CommentDAO() {
	}

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Transactional
	public Comment find(Long id) {
		return entityManager.find(Comment.class, id);
	}

	@Transactional
	public void persist(Comment comment) {
		this.entityManager.persist(comment);
	}

	@Transactional
	public void merge(Comment comment) {
		this.entityManager.merge(comment);
	}

	@Transactional
	public void remove(Comment comment) {
		entityManager.remove(comment);
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> findAll(){
		return this.entityManager.createQuery("SELECT c FROM Comment c").getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Comment> findAllFromPost(Long id) {
		return this.entityManager
				.createQuery("SELECT c FROM Comment c WHERE c.post.id=:id")
				.setParameter("id", id).getResultList();
	}
}