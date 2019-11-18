package com.huangshangi.myblog.mapper;

import com.huangshangi.myblog.entity.ContactMessage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ContactMapper {

    //增加一条留言
    int insertMessage(ContactMessage message);


    //删除一条留言
    int deleteMessage(@Param(value = "id") int id);

    //查询一系列留言(分页 )根据发布时间倒序
    List<ContactMessage> getMessages(@Param(value = "start")int start,@Param(value = "size")int size);


}
