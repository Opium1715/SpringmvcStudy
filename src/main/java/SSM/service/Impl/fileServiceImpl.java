package SSM.service.Impl;

import SSM.service.fileService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class fileServiceImpl implements fileService {


    @Override
    public String fileUpload(String filePath, MultipartFile source) throws IOException {
        //文件的上传
        String fileName = source.getOriginalFilename();
        //文件重名预处理
        assert fileName !=null;
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUID.randomUUID() + suffixName;
        //获取服务器upload路径
        File file = new File(filePath);
        //判断该文件夹是否存在
        if(!file.exists()){
            file.mkdir();
        }
        String finalPath = filePath + File.separator + fileName;
        //执行上传
        source.transferTo(new File(finalPath));
        return fileName;
    }

    @Override
    public void fileDelete(String filePath, String fileName) {
        if(fileName!=null){
            String finalPath = filePath + File.separator + fileName;
            File file = new File(finalPath);
            if(file.exists()){
                file.delete();
            }
        }
    }
}
