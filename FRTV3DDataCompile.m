%dir_1="C:\Users\NeuRRo Lab\Desktop\Katie\Elastic Brace\New Processing 10.2\Kinematics";
dir_1="C:\Users\ice_q\Desktop\research\data_output";
%Subject=["EB","EC"];
Subject=["EB2","002"];
%Session=[1,2,3];
Session=[1,2,3];
Session_name=["ECB","ElasticBrace","HIP KNEE"];
TrialNumber=14;

size_of_Subject=size(Subject);
size_of_Session=size(Session);

%first line
%title=["SUBJECT ID","SESSION","TRIAL","LEG","JOINT","VARIABLE"];
subjectid=["SUBJECT ID"];
session=["SESSION"];
trial=["TRIAL"];
leg=["LEG"];
joint=["JOINT"];
variable=["VARIABLE"];
item=[0:100];


for i=1:size_of_Subject(2) %read each subject id
    this_subject_name=Subject(i);
    subject_table=[this_subject_name;this_subject_name;this_subject_name;this_subject_name;this_subject_name;this_subject_name;this_subject_name;this_subject_name;this_subject_name];
    this_subject_dir=strcat(dir_1,"\",this_subject_name);
    for j=1:size_of_Session(2) %read each session name
        this_session_name=Session_name(Session(j));
        session_table=[this_session_name;this_session_name;this_session_name;this_session_name;this_session_name;this_session_name;this_session_name;this_session_name;this_session_name];
        this_session_dir=strcat(this_subject_dir,"\",this_session_name,"\");
        for k=1:TrialNumber %read each trial file
            leg_left=["Left";"Left";"Left";"Left";"Left";"Left";"Left";"Left";"Left"];
            leg_right=["Right";"Right";"Right";"Right";"Right";"Right";"Right";"Right";"Right"];
            joint_table=["Ankle";"Ankle";"Ankle";"Hip";"Hip";"Hip";"Knee";"Knee";"Knee"];
            variable_table=["Angle";"Moment";"Power";"Angle";"Moment";"Power";"Angle";"Moment";"Power";];
            this_trial_name=num2str(k);
            trial_table=[this_trial_name;this_trial_name;this_trial_name;this_trial_name;this_trial_name;this_trial_name;this_trial_name;this_trial_name;this_trial_name];
            %this should be modified
            this_file_dir=strcat(this_session_dir,"EB_",num2str(k)," Kinematics.txt");
            file=importdata(this_file_dir);
            data_left=file.data(1:101,2:2:19)';
            data_right=file.data(1:101,20:2:37)';
            %output left data
            subjectid=[subjectid;subject_table];
            session=[session;session_table];
            trial=[trial;trial_table];
            leg=[leg;leg_left];
            joint=[joint;joint_table];
            variable=[variable;variable_table];
            item=[item;data_left];
            %output right data
            subjectid=[subjectid;subject_table];
            session=[session;session_table];
            trial=[trial;trial_table];
            leg=[leg;leg_right];
            joint=[joint;joint_table];
            variable=[variable;variable_table];
            item=[item;data_right];
        end
    end
end
Table=table(subjectid,session,trial,leg,joint,variable,item);
writetable(Table,'C:\Users\ice_q\Desktop\try.txt','Delimiter','\t');