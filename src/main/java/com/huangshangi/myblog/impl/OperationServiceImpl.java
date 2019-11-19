package com.huangshangi.myblog.impl;

import com.huangshangi.myblog.entity.Operation;
import com.huangshangi.myblog.mapper.OperationMapper;
import com.huangshangi.myblog.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class OperationServiceImpl implements OperationService {

    @Autowired
    OperationMapper operationMapper;

    @Override
    public int insertOperation(Operation operation) {
        return operationMapper.insertOperation(operation);
    }

    @Override
    public int deleteOperation(int id) {
        return operationMapper.deleteOperation(id);
    }

    @Override
    public List<Operation> getOperations(int userId, int size) {
        return operationMapper.getOperations(userId,size);
    }
}
