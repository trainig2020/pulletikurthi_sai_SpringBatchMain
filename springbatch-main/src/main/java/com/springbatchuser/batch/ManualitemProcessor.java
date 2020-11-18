package com.springbatchuser.batch;

import java.util.HashMap;
import java.util.Map;

import org.springframework.batch.item.ItemProcessor;
import org.springframework.stereotype.Component;

import com.springbatchuser.model.User;
@Component
public class ManualitemProcessor implements ItemProcessor<User, User> {
	 private static final Map<String, String> DEPT_NAMES =
	            new HashMap<>();

	    @Override
	    public User process(User user) throws Exception {	
	        String deptCode = user.getDept();
	        String dept = DEPT_NAMES.get(deptCode);
	        user.setDept(dept);
	        System.out.println(String.format("Manual Processor Converted from [%s] to [%s]", deptCode, dept));
	        return user;
	    }
}
