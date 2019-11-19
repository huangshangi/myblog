package com.huangshangi.myblog.mapper;


import com.huangshangi.myblog.entity.Operation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OperationMapper {


    //为用户添加一条日志
    int insertOperation(Operation operation);

    //为用户删除一条日志 (日志id)
    int deleteOperation(@Param(value = "id") int id);

    //查询出用户部分日志
    List<Operation> getOperations(@Param(value = "userId")int userId,@Param(value = "size")int size);

}
