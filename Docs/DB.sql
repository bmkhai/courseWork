CREATE TABLE "public.student" (
	"id" serial,
	"name" TEXT NOT NULL,
	"group" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	CONSTRAINT "student_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.passing" (
	"id" serial NOT NULL,
	"student_id" serial NOT NULL,
	"test_id" serial NOT NULL,
	CONSTRAINT "passing_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.test" (
	"id" serial NOT NULL,
	"description" serial NOT NULL,
	CONSTRAINT "test_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grade" (
	"id" serial NOT NULL,
	"passing_id" serial NOT NULL,
	"task_id" serial NOT NULL,
	"description" serial NOT NULL,
	CONSTRAINT "grade_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.task" (
	"id" serial NOT NULL,
	"test_id" serial NOT NULL,
	"question" serial NOT NULL,
	"answer" serial NOT NULL,
	"description" serial NOT NULL,
	CONSTRAINT "task_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "passing" ADD CONSTRAINT "passing_fk0" FOREIGN KEY ("student_id") REFERENCES "student"("id");
ALTER TABLE "passing" ADD CONSTRAINT "passing_fk1" FOREIGN KEY ("test_id") REFERENCES "test"("id");


ALTER TABLE "grade" ADD CONSTRAINT "grade_fk0" FOREIGN KEY ("passing_id") REFERENCES "passing"("id");
ALTER TABLE "grade" ADD CONSTRAINT "grade_fk1" FOREIGN KEY ("task_id") REFERENCES "task"("id");

ALTER TABLE "task" ADD CONSTRAINT "task_fk0" FOREIGN KEY ("test_id") REFERENCES "test"("id");






