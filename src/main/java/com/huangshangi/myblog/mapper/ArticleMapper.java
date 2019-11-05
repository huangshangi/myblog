package com.huangshangi.myblog.mapper;

import com.huangshangi.myblog.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {

    //添加一篇文章
    int insertArticle(Article article);


    //根据文章id获取某篇文章
    Article getArticleById(@Param(value = "id") Integer id);

    //获取某位用户所有文章
    List<Article>getArticles(@Param(value="user") String user);

    //更新文章
    int updateArticle(Article article);

    //获取某位用户文章数
    int getArticleCountById(@Param(value= "name" ) String name);

    //获取某位用户游览量
    int getArticleCheckCountById(@Param(value = "name") String name);

    //获取某位用户评论数
    int getArticleCommentCountById(@Param(value = "name") String name);

    //更新游览量
    int updateArticleCheckCount(@Param(value="articleId") String articleId);

    //更新评论数
    int updateArticleCommentCount(@Param(value="articleId") String articleId);
}
