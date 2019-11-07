package com.huangshangi.myblog.enums;

public enum ArticleEnum {

    DRAFT(0),CONTENT(1);//0->草稿 1->正文

    private Integer status;

    ArticleEnum(int status){
        this.status=status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
