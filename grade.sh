CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cp -r lib student-submission

cp TestListExamples.java student-submission

cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo "Student Submission found"
else 
    echo "Need file submission"
    exit 1
fi

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java

if [[ $? -eq 0 ]]
then
    echo "Compile success" 
else
    echo "Not successful"
    exit 1
fi

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples

