package com.huucuong.TimeHub.service.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.huucuong.TimeHub.service.IUploadService;
import jakarta.servlet.ServletContext;

@Service
public class UploadService implements IUploadService {

    private final ServletContext servletContext;

    public UploadService(
            ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Override
    public String handleSaveFile(MultipartFile file, String targetFolder) {
        if (file.isEmpty()) {
            return "";
        }
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();

            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server

            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return finalName;
    }

}
