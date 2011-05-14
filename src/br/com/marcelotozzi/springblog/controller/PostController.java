package br.com.marcelotozzi.springblog.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.marcelotozzi.springblog.dao.CommentDAO;
import br.com.marcelotozzi.springblog.dao.PostDAO;
import br.com.marcelotozzi.springblog.domain.Comment;
import br.com.marcelotozzi.springblog.domain.Post;

@Controller
@RequestMapping("/posts/**")
public class PostController {
	@Autowired
	private PostDAO postDao;
	@Autowired
	private CommentDAO commentDao;

	@RequestMapping(value = "/posts/{id}", method = RequestMethod.GET)
	public String show(@PathVariable Long id, ModelMap modelMap) {
		modelMap.addAttribute("post", postDao.find(id));
		modelMap.addAttribute("comments", commentDao.findAllFromPost(id));
		modelMap.addAttribute("comment", new Comment());
		return "posts/show";
	}

	@RequestMapping(value = "/posts", method = RequestMethod.GET)
	public String list(ModelMap modelMap) {
		modelMap.addAttribute("posts", postDao.findAll());
		return "posts/list";
	}

	@RequestMapping(value = "/posts/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		this.postDao.remove(postDao.find(id));
		return "redirect:/posts";
	}

	@RequestMapping(value = "/posts/form", method = RequestMethod.GET)
	public String form(ModelMap modelMap) {
		modelMap.addAttribute("post", new Post());
		return "posts/create";
	}

	@RequestMapping(value = "/posts", method = RequestMethod.POST)
	public String create(@Valid Post post, BindingResult result) {
		if (result.hasErrors()) {
			return "posts/create";
		}
		postDao.persist(post);
		return "redirect:/posts";
	}

	@RequestMapping(value = "/posts/{id}/form", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
		System.out.println(id);
		modelMap.addAttribute("post", postDao.find(id));
		return "posts/update";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String update(@Valid Post post, BindingResult result) {
		if (result.hasErrors()) {
			return "posts/update";
		}
		postDao.merge(post);
		return "redirect:/posts";
	}

	@RequestMapping(value = "/posts/{id}", method = RequestMethod.POST)
	public String createComment(@Valid Comment comment, BindingResult result,
			@PathVariable("id") Long id) {
		Post post = postDao.find(id);
		if (result.hasErrors()) {
			return "posts/" + id;
		}
		comment.setPost(post);
		commentDao.persist(comment);
		return "redirect:/posts/" + id;
	}
}