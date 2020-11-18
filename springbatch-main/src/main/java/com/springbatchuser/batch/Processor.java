package com.springbatchuser.batch;

import com.springbatchuser.config.SpringBatchConfig;
import com.springbatchuser.model.User;

import org.springframework.batch.item.ItemProcessor;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class Processor implements ItemProcessor<User, User> {

	private SpringBatchConfig spvk;
    private static final Map<String, String> DEPT_NAMES =
            new HashMap<>();

    @Override
    public User process(User user) throws Exception {
    	
    //	System.out.println(spvk.itemReader().toString());
    	
        String deptCode = user.getDept();
        String dept = DEPT_NAMES.get(deptCode);
        user.setDept(dept);
       // user.setTime(new Date());
        System.out.println(String.format("Converted from [%s] to [%s]", deptCode, dept));
        return user;
    }
}
