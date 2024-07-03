package moe.scarlet.library.mapper

import com.baomidou.mybatisplus.core.mapper.BaseMapper
import moe.scarlet.library.entity.*
import org.apache.ibatis.annotations.Mapper

@Mapper
interface UserMapper : BaseMapper<User>

@Mapper
interface RoleMapper : BaseMapper<Role>

@Mapper
interface PermissionMapper : BaseMapper<Permission>

@Mapper
interface BookMapper : BaseMapper<Book>

@Mapper
interface LabelMapper : BaseMapper<Label>

@Mapper
interface Book2LabelMapper : BaseMapper<Book2Label>

@Mapper
interface NoticeMapper : BaseMapper<Notice>

@Mapper
interface BorrowInfoMapper : BaseMapper<BorrowInfo>
