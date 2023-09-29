package com.haconghieu.inputstudenttodatabase.reponsitory;

import com.haconghieu.inputstudenttodatabase.student.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.lang.Iterable;
public interface StudentRepository extends JpaRepository<Student, Long> {

}
