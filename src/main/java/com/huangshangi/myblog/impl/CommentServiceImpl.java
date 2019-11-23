package com.huangshangi.myblog.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.CommentTree;
import com.huangshangi.myblog.mapper.ArticleMapper;
import com.huangshangi.myblog.mapper.CommentMapper;
import com.huangshangi.myblog.mapper.UserMapper;
import com.huangshangi.myblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {


    @Autowired
    CommentMapper commentMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    ArticleMapper articleMapper;

    @Override
    public int insertComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public int deleteCommentById(int id) {
        return commentMapper.deleteCommentById(id);
    }


    @Override
    public List<CommentTree> getCommentList(int articleId) {
        return commentMapper.getCommentTree(articleId);
    }

    @Override
    public String getCommentListJson(int articleId) {

        List<CommentTree>list=getCommentList(articleId);

        JSONArray jsonArray=addCommentItem(list);

        return jsonArray.toString();
    }

    //一个工具类 用来递归填写commentListJson
    JSONArray addCommentItem(List<CommentTree>list){
        //对本文章的每一条评论
        JSONArray jsonArray=new JSONArray();
        for(CommentTree commentTree:list){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("id",commentTree.getId());
            jsonObject.put("img",commentTree.getUser().getUserImage());
            jsonObject.put("replyName",commentTree.getUser().getUserName());

            if (commentTree.getParentId()!=0)
                jsonObject.put("beReplyName",userMapper.getUserById(commentTree.getUid()).getUserName());
            else
                jsonObject.put("beReplyName","");
            jsonObject.put("content",commentTree.getContent());
            jsonObject.put("time",commentTree.getCreateTime());
            jsonObject.put("address","");
            jsonObject.put("osname","");
            jsonObject.put("browse","");
            if(commentTree.getList()!=null&&commentTree.getList().size()!=0)
                jsonObject.put("replyBody",addCommentItem(commentTree.getList()));
            else
                jsonObject.put("replyBody",new JSONArray());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }


    @Override
    public JSONArray getCommentsJSON(int uid,int page,int size) {

        List<Comment>list=getCommentsList(uid,page,size);
        JSONArray jsonArray=new JSONArray();
        for(int i=0;i<list.size();i++){
            JSONObject jsonObject=new JSONObject();

            Comment comment=list.get(i);

            jsonObject.put("commentId",comment.getId());
            jsonObject.put("articleTitle",articleMapper.getArticleById(comment.getArticleId()).getArticleTitle());
            jsonObject.put("content",comment.getContent());
            jsonObject.put("time",comment.getCreateTime());
            jsonObject.put("commentUser",userMapper.getUserById(comment.getUid()));
            jsonArray.add(jsonObject);
        }
        return  jsonArray;

    }

    @Override
    public int deleteCommentsById(List<Integer> ids) {
        for(int i=0;i<ids.size();i++)
            deleteCommentById(ids.get(i));
        return 1;
    }

    @Override
    public List<Comment> getCommentsList(int uid,int page,int size) {

        int start=(page-1)*size,end=page*size;

        int temp=0;

        boolean flag=false;
        //获取用户所有文章
        List<Article>articleList=articleMapper.getArticles(uid);

        //起止 (page-1)*size->page*size
        List<Comment>resList=new ArrayList<>();
        for(int i=0;i<articleList.size();i++){

            if(temp<start)
                temp+=articleList.get(i).getArticleCommentCount();
            else {
                if(!flag){
                    resList.addAll(commentMapper.getComments(articleList.get(i).getArticleId(),temp-start+1,1));
                }else{
                    resList.addAll(commentMapper.getComments(articleList.get(i).getArticleId(),end-temp+1,0));
                    break;
                }
            }
        }

        return resList;
    }
}
