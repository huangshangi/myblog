package com.huangshangi.myblog.mapper;

import com.huangshangi.myblog.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArticleMapper {

    //添加一篇文章
    int insertArticle(Article article);


    //根据文章id获取某篇文章
    Article getArticleById(@Param(value = "articleId") Integer articleId);

    //获取某位用户所有文章
    List<Article>getArticles(@Param(value="id") String id);

    List<Article>getArticlesByPage(@Param(value="id") int id,@Param(value="page")int page,@Param(value="pageSize")int pageSize);

    //更新文章
    int updateArticle(Article article);

    //获取某位用户文章数
    int getArticleCountById(@Param(value= "id" ) int id);

    //获取某位用户游览量
    int getArticleCheckCountById(@Param(value = "id") int id);

    //获取某位用户评论数
    int getArticleCommentCountById(@Param(value = "id") int id);

    //删除单条文章信息
    int deleteArticleById(@Param(value="id") int id);

    //删除多条文章信息
    int deleteArticleByIds(@Param(value="ids")String ids);

    //更新游览量
    int updateArticleCheckCount(@Param(value="articleId") String articleId);

    //更新评论数
    int updateArticleCommentCount(@Param(value="articleId") String articleId);
}
