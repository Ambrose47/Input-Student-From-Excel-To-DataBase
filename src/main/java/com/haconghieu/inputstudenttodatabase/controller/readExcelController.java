package com.haconghieu.inputstudenttodatabase.controller;

import com.haconghieu.inputstudenttodatabase.reponsitory.StudentRepository;
import com.haconghieu.inputstudenttodatabase.student.Student;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class readExcelController {
    @GetMapping("")
    public String uploadForm() {
        return "upload";
    }
    @Autowired
    private StudentRepository studentRepository;



    @PostMapping("/upload")
    public String uploadExcelFile(@RequestParam("file") MultipartFile file, Model model) {
        try {
            InputStream inputStream = file.getInputStream();
            Workbook workbook = new XSSFWorkbook(inputStream);

            // Đọc dữ liệu từ file Excel
            List<Student> studentList = new ArrayList<>();
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();



            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                // Đọc dữ liệu từ từng cột của hàng và tạo đối tượng User
                String student_ID = row.getCell(0).getStringCellValue();
                String student_name = row.getCell(1).getStringCellValue();
                String student_email = row.getCell(2).getStringCellValue();
                Student student = new Student(student_ID, student_name, student_email);
                studentList.add(student);

            }


            // Lưu danh sách người dùng vào cơ sở dữ liệu
            studentRepository.saveAll(studentList);



            workbook.close();

            // Đưa dữ liệu vào model để hiển thị trên giao diện
            model.addAttribute("data", studentList);

            return "upload";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/?error=" + e.getMessage();
        }

    }



}
