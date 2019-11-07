package com.huangshangi.myblog.entity;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable {

    private int articleId;

    private int articleUserId;

    private String articleTitle;

    private String articleContent;

    private int articleCommentCount;

    private int articleCheckCount;

    private Date articleCreateTime;

    private Date articleUpdateTime;

    private String articleSummary;

    private int articleStatus;

    public Article() {
    }

    public Article(int articleId, int articleUserId, String articleTitle, String articleContent, int articleCommentCount, int articleCheckCount,
                   Date articleCreateTime, Date articleUpdateTime, String articleSummary,int articleStatus) {
        this.articleId = articleId;
        this.articleUserId = articleUserId;
        this.articleTitle = articleTitle;
        this.articleContent = articleContent;
        this.articleCommentCount = articleCommentCount;
        this.articleCheckCount = articleCheckCount;
        this.articleCreateTime = articleCreateTime;
        this.articleUpdateTime = articleUpdateTime;
        this.articleSummary = articleSummary;
        this.articleStatus=articleStatus;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getArticleUserId() {
        return articleUserId;
    }

    public void setArticleUserId(int articleUserId) {
        this.articleUserId = articleUserId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public int getArticleCommentCount() {
        return articleCommentCount;
    }

    public void setArticleCommentCount(int articleCommentCount) {
        this.articleCommentCount = articleCommentCount;
    }

    public int getArticleCheckCount() {
        return articleCheckCount;
    }

    public void setArticleCheckCount(int articleCheckCount) {
        this.articleCheckCount = articleCheckCount;
    }

    public Date getArticleCreateTime() {
        return articleCreateTime;
    }

    public void setArticleCreateTime(Date articleCreateTime) {
        this.articleCreateTime = articleCreateTime;
    }

    public Date getArticleUpdateTime() {
        return articleUpdateTime;
    }

    public void setArticleUpdateTime(Date articleUpdateTime) {
        this.articleUpdateTime = articleUpdateTime;
    }

    public String getArticleSummary() {
        return articleSummary;
    }

    public void setArticleSummary(String articleSummary) {
        this.articleSummary = articleSummary;
    }

    public int getArticleStatus() {
        return articleStatus;
    }

    public void setArticleStatus(int articleStatus) {
        this.articleStatus = articleStatus;
    }
}
