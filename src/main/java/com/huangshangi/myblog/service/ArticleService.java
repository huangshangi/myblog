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

    //批量删除信息(json 数据)
    int deleteArticlesByIds(ArrayList<Integer> ids);

    //删除一条文章信息
    int deleteArticleById(int id);

    //提交文章
    int submitArticle(Article article);

}
