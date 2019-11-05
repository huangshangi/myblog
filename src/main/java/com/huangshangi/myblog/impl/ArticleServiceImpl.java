package com.huangshangi.myblog.impl;

import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.service.ArticleService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {


    @Override
    public List<Integer> getUserSampInfos(String name) {
        return null;
    }

    @Override
    public List<Article> getArticlesByName(String name, int page, int pageSize) {
        return null;
    }

    @Override
    public int deleteArticlesByIds(String ids) {
        return 0;
    }
}
