package com.sinosoft.framework.datasource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 数据源切换处理
 * 
 * @author davehandong
 */
public class DynamicDataSourceContextHolder
{
    public static final Logger log = LoggerFactory.getLogger(DynamicDataSourceContextHolder.class);

    private static final ThreadLocal<String> CONTEXT_HOLDER = new ThreadLocal<>();

    public static void setDateSoureType(String dsType)
    {
        log.info("切换到{}数据源", dsType);
        CONTEXT_HOLDER.set(dsType);
    }

    public static String getDateSoureType()
    {
        return CONTEXT_HOLDER.get();
    }

    public static void clearDateSoureType()
    {
        CONTEXT_HOLDER.remove();
    }
}
