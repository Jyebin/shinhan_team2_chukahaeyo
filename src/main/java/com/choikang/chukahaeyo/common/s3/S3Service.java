package com.choikang.chukahaeyo.common.s3;

import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class S3Service {

    @Value("${local.file.storage.path}") // application.properties 또는 application.yml에서 설정
    private String storagePath;

    // 파일 유효성 검사
    private String getFileExtension(String fileName) {
        if (fileName.length() == 0) {
            throw new CustomException(ErrorCode.NOT_FOUND_IMAGE_EXCEPTION, ErrorCode.NOT_FOUND_IMAGE_EXCEPTION.getMessage());
        }
        ArrayList<String> fileValidate = new ArrayList<>();
        fileValidate.add(".jpg");
        fileValidate.add(".JPG");
        fileValidate.add(".jpeg");
        fileValidate.add(".JPEG");
        fileValidate.add(".png");
        fileValidate.add(".PNG");
        fileValidate.add(".webp");
        fileValidate.add(".WebP");
        fileValidate.add(".heif");
        fileValidate.add(".HEIF");
        fileValidate.add(".heic");
        fileValidate.add(".HEIC");
        fileValidate.add(".svg");
        fileValidate.add(".SVG");
        String idxFileName = fileName.substring(fileName.lastIndexOf("."));
        if (!fileValidate.contains(idxFileName)) {
            throw new CustomException(ErrorCode.VALIDATION_IMAGE_REQUEST_FAILED, ErrorCode.VALIDATION_IMAGE_REQUEST_FAILED.getMessage());
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }

    // 파일을 로컬 디렉토리에 저장
    public String saveFile(MultipartFile file) {
        String fileName = createFileName(file.getOriginalFilename());
        Path filePath = Paths.get(storagePath, fileName);

        try (FileOutputStream fos = new FileOutputStream(new File(filePath.toString()))) {
            fos.write(file.getBytes());
        } catch (IOException e) {
            throw new CustomException(ErrorCode.NOT_FOUND_IMAGE_EXCEPTION, "파일을 로컬에 저장하는 중 문제가 발생하였습니다.");
        }

        return filePath.toString(); // 로컬에 저장된 파일 경로 반환
    }

    // 파일 이름 중복 방지를 위한 파일명 생성
    private String createFileName(String fileName) {
        return UUID.randomUUID().toString().concat(getFileExtension(fileName));
    }

    // 파일 삭제
    public void deleteFile(String fileName) {
        Path filePath = Paths.get(storagePath, fileName);
        try {
            Files.deleteIfExists(filePath);
        } catch (IOException e) {
            throw new CustomException(ErrorCode.NOT_FOUND_IMAGE_EXCEPTION, "파일 삭제 중 문제가 발생하였습니다.");
        }
    }
}
