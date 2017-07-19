package com.ec.survey.dao;

import com.ec.survey.dto.Config;

public interface ConfigDAO {

	boolean updateConfig(Config config);
	Config findConfig();
}
