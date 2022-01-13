import 'dart:io';

class BranchElectives {
    int year = -1;
    String Branch = ' ';
    String CourseName = ' ';
    String CourseCode = ' ';
    Map BranchElectivesList = Map();

    void setCourseName(String C_name) {
       this.CourseName = C_name;
    }

    void setCourseCode(String C_code) {
      this.CourseCode = C_code;
    }

    void addToList() {
        if (this.BranchElectivesList["$year $Branch"] == null) {
          this.BranchElectivesList["$year $Branch"] = [[this.CourseCode, this.CourseName]];
        }
        else {
          this.BranchElectivesList["$year $Branch"].add([this.CourseCode, this.CourseName]);
        }

        print("The course $CourseName with $CourseCode has been added successfully");
    }

    void printAvaialbleCourses(String branch, int year) {
        if (this.BranchElectivesList["$year $Branch"] == null) {
          print("There is no courses avaialble for $year year $branch branch");
          return;
        }

        List BranchCources = this.BranchElectivesList["$year $Branch"];

        print("List of Branch Electives of year $year branch $branch");

        for (int i = 0; i < BranchCources.length; i++) {
            print("${i + 1} ${BranchCources[i][0]}   ${BranchCources[i][1]} ");
        }

    }

    void addToCourses() {
        String course;
        String Code;

        int Year;
        String branch;

        print("Enter the details of the course you want to add");

        print("Enter the year");
        Year = int.parse(stdin.readLineSync()!);

        print("Enter the branch");
        branch = stdin.readLineSync()!;

        print("Enter the Course Code");
        Code = stdin.readLineSync()!;

        print("Enter the Course Name");
        course = stdin.readLineSync()!;

        this.year = Year;
        this.Branch = branch;

        this.setCourseCode(Code);
        this.setCourseName(course);

        this.addToList();
    }
}

class OpenElectives {
    String CourseName = ' ';
    String CourseCode = ' ';
    List <List> OpenElectiveList = [];

    void setCourseName(String C_name) {
       this.CourseName = C_name;
    }

    void setCourseCode(String C_code) {
      this.CourseCode = C_code;
    }

    void addToList() {
      
        this.OpenElectiveList.add([this.CourseCode, this.CourseName]);

        print("The course $CourseName with $CourseCode has been added successfully");
    }

    void printAvaialbleCourses() {
        if (this.OpenElectiveList.isEmpty) {
          print("There is no open electives courses avaialble");
          return;
        }

        List Cources = this.OpenElectiveList;

        print("List of Open Electives");

        for (int i = 0; i < Cources.length; i++) {
            print("${i + 1} ${Cources[i][0]}   ${Cources[i][1]} ");
        }

    }

    void addToCourses() {
        String course;
        String Code;

        print("Enter the details of the course you want to add");

        print("Enter the Course Code");
        Code = stdin.readLineSync()!;

        print("Enter the Course Name");
        course = stdin.readLineSync()!;

        this.setCourseCode(Code);
        this.setCourseName(course);

        this.addToList();
    }
}

void main() {
    try {
        bool wantToAdd = false;
        BranchElectives branchElective = BranchElectives();
        OpenElectives openElective = OpenElectives();

        do {
           wantToAdd = false;
           print("Enter the typer of User:");
           print("1. Admin");
           print("2. Student");

           int user = int.parse(stdin.readLineSync()!);

           if (user == 1) {
              print("Which type of Course you like to add?");
              print("1. Branch Elective");
              print("2. Open Elective");

              int electiveType = int.parse(stdin.readLineSync()!);

              if (electiveType == 1) {
                  branchElective.addToCourses();
              }
              else if (electiveType == 2) {
                openElective.addToCourses();
              }
              else {
                print("Invalid Choice");
              }
           }
           else if (user == 2) {
               print("Enter the year");
               int yr = int.parse(stdin.readLineSync()!);
               print("Enter the Branch");
               String brnch = stdin.readLineSync()!;
               branchElective.printAvaialbleCourses(brnch, yr);
               openElective.printAvaialbleCourses();
           }
           else {
                print("Invalid Choice");
           }

           print("Do you want to add more courses or view courses?(Y/N)");

           String choice = stdin.readLineSync()!;

           if (choice == 'y' || choice == 'yes' || choice == 'Yes' || choice == 'Y') {
              wantToAdd = true;
          }
        }while (wantToAdd);

    } catch (e) {
    print("Exception Occured!!!!");
    print("Exception : $e");
  }
}