package SSM.controller;

import SSM.pojo.Book;
import SSM.pojo.Type;
import SSM.service.typeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class typeController {
    @Autowired
    private typeService typeService;

    @GetMapping("/typeList")
    public ModelAndView TypeDisplay(
            @RequestParam(defaultValue = "1") Integer PageNo,
            Integer id){
        Map<String,Object> map = new HashMap<>();
        //说明需要编辑
        if(id!=null){
            //编辑标识符
            map.put("opo","edit");
            map.put("type",typeService.getTypeById(id));
        }
        PageInfo<Type> typePageInfo = typeService.getAllType(PageNo);
        map.put("pageInfo",typePageInfo);
        return new ModelAndView("typelist",map);
    }

    @GetMapping("typeListSearch")
    public ModelAndView TypeSearchDisplay(@RequestParam(defaultValue = "1") Integer PageNo,String typeName){
        PageInfo<Type> typePageInfo = typeService.getAllTypeBySearch(PageNo,typeName);
        return new ModelAndView("typelist","pageInfo",typePageInfo);
    }

    @PostMapping("/typeUpdate")
    public ModelAndView Update(Type type){
        typeService.UpdateType(type);
        return new ModelAndView("redirect:typeList");
    }

    @PostMapping("/typeSave")
    public ModelAndView Add(Type type){
        typeService.AddType(type);
        return new ModelAndView("redirect:typeList");
    }

    @DeleteMapping("/typeDelete")
    public ModelAndView Delete(Integer id){
       typeService.DeleteType(id);
        return new ModelAndView("redirect:typeList");
    }

}
