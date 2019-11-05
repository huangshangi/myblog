package com.huangshangi.myblog.service;

import com.huangshangi.myblog.entity.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ArticleService {
    //获取用户简略信息(文章数 游览量）
    List<Integer> getUserSampInfos(String name);

    //根据用户name获取某个用户文章信息
    List<Article>getArticlesByName(String name,int page,int pageSize);

    //批量删除信息(json 数据)
    int deleteArticlesByIds(String ids);

}
