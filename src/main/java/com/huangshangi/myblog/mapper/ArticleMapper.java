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

    //获取前一篇文章
    Article getPreArticle(@Param(value = "articleId")int articleId);

    //获取后一篇文章
    Article getNextArticle(@Param(value = "articleId")int articleId);

    //获取文章排行
    List<Article> getRankArticles();

    //获取优质好文
    List<Article>getGoodArticles();

    //获取本栏推荐
    List<Article>getHeadRecommendArticles(@Param(value="id") int id);

    //获取随便看看
    List<Article>getRandomArticles(@Param("count")int count);

    //获取某位用户所有文章
    List<Article>getArticles(@Param(value="id") String id);

    List<Article>getArticlesByPage(@Param(value="id") int id,@Param(value="page")int page,@Param(value="pageSize")int pageSize);

    //根据文章类别获取文章列表
    List<Article>getArticlesByCategory(@Param(value="status")int status,@Param(value="num")int num,@Param(value="limitCount")int limitCount);

    //根据关键词搜索文章
    List<Article>getArticlesBySign(@Param(value = "id")int id,@Param(value = "sign")int sign,@Param(value = "key")String key);

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

    //获取某一类别文章数
    int getArticleCountByCategory(@Param(value = "category")int category);


}
