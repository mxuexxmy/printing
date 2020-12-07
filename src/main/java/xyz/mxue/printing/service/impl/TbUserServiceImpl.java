package xyz.mxue.printing.service.impl;

import xyz.mxue.printing.entity.TbUser;
import xyz.mxue.printing.mapper.TbUserMapper;
import xyz.mxue.printing.service.TbUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-08
 */
@Service
public class TbUserServiceImpl extends ServiceImpl<TbUserMapper, TbUser> implements TbUserService {

}
