This is the git page for the LKE Symposium Website + workshop project

Branches :

There are two branches:
  -The lke2024 branch must contain the latest version of the lke 2024 website, as a zip file, named html.zip
  -The database branch contains every file currently related to the database, this includes the scripts, as well as db.sql, used to launch those scripts

For the main branch, there are four main parts currently :

LearningAux is the latest functionning version of the CloudFormation template, this file should be used when generating a Stack on CloudFormation.

the Database files and db files are the same as in the database branch.

lke_bckup_v5 & v6 are the two latest versions of the lke website.

user data is the user data needeed to get an ec2-instance to run the website, already used in the cloudformation template.
