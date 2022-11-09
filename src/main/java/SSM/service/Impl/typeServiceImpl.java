package SSM.service.Impl;

import SSM.mapper.TypeMapper;
import SSM.pojo.Type;
import SSM.service.typeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class typeServiceImpl implements typeService {
    @Autowired
    private TypeMapper typeMapper;


    @Override
    public List<Type> getAllType() {
        return typeMapper.selectAll(null);
    }

    @Override
    public PageInfo<Type> getAllType(Integer PageNo) {
        PageHelper.startPage(PageNo,10);
        List<Type> typeList =  typeMapper.selectAll(null);
        return new PageInfo<>(typeList);
    }

    @Override
    public PageInfo<Type> getAllTypeBySearch(Integer PageNo, String typeName) {
        PageHelper.startPage(PageNo,10);
        List<Type> typeList =  typeMapper.selectAll(typeName);
        return new PageInfo<>(typeList);
    }

    @Override
    public void AddType(Type type) {
         typeMapper.insert(type);
    }

    @Override
    public void DeleteType(Integer id) {
        typeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void UpdateType(Type type) {
        typeMapper.updateByPrimaryKey(type);
    }

    @Override
    public Type getTypeById(Integer id) {
        return typeMapper.selectByPrimaryKey(id);
    }
}
