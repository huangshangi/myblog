package com.huangshangi.myblog.service;

import com.huangshangi.myblog.entity.Operation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OperationService {

    //添加一条日志
    int insertOperation(Operation operation);

    //删除一条日志
    int deleteOperation(int id);


    //查询日志
    List<Operation> getOperations(int userId,int size);
}
