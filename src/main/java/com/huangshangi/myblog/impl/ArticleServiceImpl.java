package com.huangshangi.myblog.impl;

import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.mapper.ArticleMapper;
import com.huangshangi.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    ArticleMapper articleMapper;

    @Override
    public List<Integer> getUserSampInfos(int id) {
        List<Integer>list=new ArrayList<>();
        list.add(articleMapper.getArticleCountById(id));
        list.add(articleMapper.getArticleCheckCountById(id));
        list.add(articleMapper.getArticleCommentCountById(id));

        return list;
    }

    @Override
    public List<Article> getArticlesByName(int id, int page, int pageSize) {

        List<Article>list=articleMapper.getArticlesByPage(id,page,pageSize);
        return list;
    }

    @Override
    public int deleteArticlesByIds(ArrayList<Integer> ids) {
        String data="(";
        for(int i=0;i<ids.size()-1;i++)
            data+=ids.get(i);
        data+=ids.get(ids.size()-1)+")";

        articleMapper.deleteArticleByIds(data);
        return 0;
    }

    @Override
    public int deleteArticleById(int id) {
        articleMapper.deleteArticleById(id);
        return 0;
    }

    @Override
    public int submitArticle(Article article) {
        articleMapper.insertArticle(article);
        return 0;
    }

    @Override
    public Article getArticleById(int id) {

        Article article=articleMapper.getArticleById(id);
        return article;
    }

    @Override
    public List<Article> getArticlesBySign(int id, int sign, String key) {
        return null;
    }

    @Override
    public Article getPreArticle(int id) {
        return articleMapper.getPreArticle(id);
    }

    @Override
    public Article getNextArticle(int id) {
        return articleMapper.getNextArticle(id);
    }

    @Override
    public List<Article> getRankList() {
        return null;
    }

    @Override
    public List<Article> getRecommendList() {
        return null;
    }

    @Override
    public List<Article> getHeadRecommendList() {
        return null;
    }

    @Override
    public List<Article> getRandomList() {
        return null;
    }

    @Override
    public String getCommentList(int id) {
        return null;
    }
}
