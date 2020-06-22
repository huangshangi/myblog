package com.huangshangi.myblog.utils;

import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.OperationService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

@Component
@Aspect
public class OpearationAop {

    @Autowired
    OperationService opeartionService;

    @Pointcut("execution(* com.huangshangi.myblog.controller.*.*(..))")
    public void method(){

    }

    @AfterReturning("method()")
    public void afterReturning(JoinPoint joinPoint){
        // 1:在切面方法里面获取一个request，
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 2:通过springAOP切面JoinPoint类对象，获取该类，或者该方法，或者该方法的参数
        Class<? extends Object> clazz =  joinPoint.getTarget().getClass();
        String controllerOperation = clazz.getName();
        if(clazz.isAnnotationPresent(OperationAnnoation.class)){
            // 当前controller操作的名称
            controllerOperation = clazz.getAnnotation(OperationAnnoation.class).name();
        }
        // 获取当前方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        // clazz类下的所有方法
        Method[] methods = clazz.getDeclaredMethods();
        String methodOperation = "";
        for (Method m : methods) {
            if(m.equals(method)){
                methodOperation = m.getName();
                if(m.isAnnotationPresent(OperationAnnoation.class)){
                    methodOperation = m.getAnnotation(OperationAnnoation.class).name();
                }
            }
        }
        User user=(User)request.getSession().getAttribute("user");
        if(user==null)return;
        //进行数据组装
        com.huangshangi.myblog.entity.Operation operation=new com.huangshangi.myblog.entity.Operation();
        operation.setOperationIp(util.getIpAddr(request));
        operation.setOperationName(methodOperation);
        operation.setOperationPath(request.getMethod()+" "+request.getRequestURI());
        operation.setOperationUserId(user.getUserId());
        operation.setOperationTime(util.getTime());

        opeartionService.insertOperation(operation);

//        if(username != null){
//            logger.info(username + " 执行了 " + controllerOperation + " 下的  " + methodOperation + " 操作！ ip地址为"
//                    + request.getRemoteHost());
//        }else{
//            logger.info("未知用户 执行了 " + controllerOperation + " 下的  " + methodOperation + " 操作！ ip地址为"
//                    + request.getRemoteHost());
//        }

    }


}
