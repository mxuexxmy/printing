package xyz.mxue.printing.service;

import xyz.mxue.printing.entity.TbUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-08
 */
public interface TbUserService extends IService<TbUser> {

    TbUser getByUsername(String userPhone, String password);
}
