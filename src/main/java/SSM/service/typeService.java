package SSM.service;

import SSM.pojo.Type;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface typeService {

    List<Type> getAllType();
    PageInfo<Type> getAllType(Integer PageNo);

    PageInfo<Type> getAllTypeBySearch(Integer PageNo, String typeName);

    void AddType(Type type);

    void DeleteType(Integer id);

    void UpdateType(Type type);

    Type getTypeById(Integer id);
}
