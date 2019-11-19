package com.huangshangi.myblog.entity;

public class Operation {

    private int operationId;//日志id

    private int operationUserId;//操作人id

    private String operationName;//操作名称

    private String operationIp;//操作者ip

    private String operationPath;//操作路径

    private String operationTime;//日志时间

    public Operation() {
    }

    public Operation(int operationId, int operationUserId, String operationName, String operationIp, String operationPath, String operationTime) {
        this.operationId = operationId;
        this.operationUserId = operationUserId;
        this.operationName = operationName;
        this.operationIp = operationIp;
        this.operationPath = operationPath;
        this.operationTime = operationTime;
    }


    public int getOperationId() {
        return operationId;
    }

    public void setOperationId(int operationId) {
        this.operationId = operationId;
    }

    public int getOperationUserId() {
        return operationUserId;
    }

    public void setOperationUserId(int operationUserId) {
        this.operationUserId = operationUserId;
    }

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName;
    }

    public String getOperationIp() {
        return operationIp;
    }

    public void setOperationIp(String operationIp) {
        this.operationIp = operationIp;
    }

    public String getOperationPath() {
        return operationPath;
    }

    public void setOperationPath(String operationPath) {
        this.operationPath = operationPath;
    }

    public String getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(String operationTime) {
        this.operationTime = operationTime;
    }
}
