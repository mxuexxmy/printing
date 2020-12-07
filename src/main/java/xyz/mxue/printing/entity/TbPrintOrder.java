package xyz.mxue.printing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 打印订单
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TbPrintOrder implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 打印人的名字
     */
    private String userName;

    /**
     * 打印人的QQ
     */
    private String userQq;

    /**
     * 打印人的微信
     */
    private String userWxchat;

    /**
     * 打印人的电话
     */
    private String userPhone;

    /**
     * 打印的文件名
     */
    private String printFileName;

    /**
     * 打印的份数
     */
    private Integer prinfNumber;

    /**
     * 打印的页数
     */
    private Integer paperNumber;

    /**
     * 价格
     */
    private Double amount;

    /**
     * 总的价格
     */
    private Double totalAmount;

    /**
     * 备注
     */
    private String note;

    /**
     * 地点
     */
    private String address;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;


}
