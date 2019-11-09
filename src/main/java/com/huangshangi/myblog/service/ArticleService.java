package com.huangshangi.myblog.service;

import com.huangshangi.myblog.entity.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public interface ArticleService {

    //获取用户简略信息(文章数 游览量）
    List<Integer> getUserSampInfos(int id);

    //根据用户id获取某个用户文章信息
    List<Article>getArticlesByName(int id,int page,int pageSize);

    //根据文章id获取某篇文章
    Article getArticleById(int id);

    //根据关键词查询有关的文章
    List<Article>getArticlesBySign(@Param(value = "id")int id,@Param(value = "sign")int sign,@Param(value = "key")String key);

    //批量删除信息(json 数据)
    int deleteArticlesByIds(ArrayList<Integer> ids);

    //删除一条文章信息
    int deleteArticleById(int id);

    //提交文章
    int submitArticle(Article article);

    //获取上一篇文章(若)
    Article getPreArticle(int id);


    //获取下一篇文章
    Article getNextArticle(int id);

    //获取文章排行信息(根据文章游览量进行排行)
    List<Article>getRankList();

    //获取文章推荐信息(根据文章like推荐)
    List<Article>getRecommendList();

    //获取本栏推荐内容(随机推荐)
    List<Article>getHeadRecommendList(int id);

    //随便看看
    List<Article>getRandomList(int count);


}
