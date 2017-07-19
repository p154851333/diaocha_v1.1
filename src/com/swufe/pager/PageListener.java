package com.swufe.pager;
 

import java.util.List;

/**
 * <p>类名称	PageListener </p>
* <p>类描述	页面监听</p>
* @author	裴健
* @date		2017年6月9日 下午3:29:02
 */
public interface PageListener
{
  List<?>  doSelect(int recordStart, int sizePage, PageConfig pageConfig);

  int getCount(PageConfig pageConfig);
}