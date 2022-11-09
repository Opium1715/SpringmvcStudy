package SSM.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface fileService {

    String fileUpload(String filePath, MultipartFile source) throws IOException;


    void fileDelete(String filePath, String fileName);
}
