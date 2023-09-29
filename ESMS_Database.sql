CREATE TABLE lecturer(
	lecturer_ID INT NOT NULL,
	lecturer_name VARCHAR(50) NOT NULL,
	lecturer_email VARCHAR(50) NOT NULL,
	lecturer_phone VARCHAR(50) NOT NULL,
	CONSTRAINT pk_lecturer PRIMARY KEY (lecturerID)
);

CREATE TABLE exam_slot(
	exam_slot_ID INT NOT NULL,
	exam_date DATE NOT NULL,
	exam_time VARCHAR(50) NOT NULL,
	exam_hour VARCHAR(50) NOT NULL,
	CONSTRAINT pk_exam_slot PRIMARY KEY (exam_slot_ID)
);


CREATE TABLE lecturer_exam(
	lecturer_exam_ID INT NOT NULL,
	lecturer_ID INT NOT NULL,
	exam_slot_ID INT NOT NULL,
	CONSTRAINT pk_lecturer_exam PRIMARY KEY (lecturer_exam_ID),
	CONSTRAINT fk_lecturer_ID FOREIGN KEY (lecturer_ID) REFERENCES lecturer(lecturer_ID)
);

CREATE TABLE room(
	room_ID INT NOT NULL,
	CONSTRAINT pk_room PRIMARY KEY (room_ID)
);

CREATE TABLE major(
	major_ID INT NOT NULL,
	major_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_major PRIMARY KEY (major_ID)
);

CREATE TABLE semeter(
	semeter_ID INT NOT NULL,
	semeter_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_semeter PRIMARY KEY (semeter_ID)
);

CREATE TABLE student(
	student_ID INT NOT NULL,
	student_name VARCHAR(50) NOT NULL,
	student_email VARCHAR(50) NOT NULL,
	CONSTRAINT pk_student PRIMARY KEY (student_ID)
);

CREATE TABLE course(
	course_ID VARCHAR(50) NOT NULL,
	course_name VARCHAR(50) NOT NULL,
	major_ID VARCHAR(50) NOT NULL,
	semeter_ID VARCHAR(50) NOT NULL,
	student_ID VARCHAR(50) NOT NULL,
	CONSTRAINT pk_course PRIMARY KEY (course_ID),
	CONSTRAINT fk_major_ID FOREIGN KEY (major_ID) REFERENCES major(major_ID),
	CONSTRAINT fk_semeter_ID FOREIGN KEY (semeter_ID) REFERENCES semeter(semeter_ID),
	CONSTRAINT fk_student_ID FOREIGN KEY (student_ID) REFERENCES student(student_ID)
);

CREATE TABLE exam_schedule(
	exam_schedule_ID INT NOT NULL,
	exam_slot_ID VARCHAR(50) NOT NULL,
	room_ID INT NOT NULL,
	course_ID VARCHAR(50) NOT NULL,
	CONSTRAINT pk_exam_schedule_ID PRIMARY KEY (exam_schedule_ID),
	CONSTRAINT fk_exam_slot_ID FOREIGN KEY (exam_slot_ID) REFERENCES exam_slot(exam_slot_ID),
	CONSTRAINT fk_room_ID FOREIGN KEY (room_ID) REFERENCES room(room_ID),
	CONSTRAINT fk_course_ID FOREIGN KEY (course_ID) REFERENCES course(course_ID)
);








