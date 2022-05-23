#!/usr/bin/env python
# coding: utf-8

# In[2]:


import Bio
from io import StringIO
from Bio import AlignIO
from Bio import SeqIO
import subprocess
import re
path_folder=r"C://Users//kozanlie//Documents//RIVM//project_main//genomic_analyses//"
# base= r"C://Users//kozanlie//"
#changes per dataset:
scovlist=['SARS2', '229E', 'HKU1', 'NL63', 'OC43']

for scov in scovlist: 
    input_sequences = str(scov)+"_full.fasta" # can also be changed to S only if spike only sequences
    define_Name=str(scov)+"_seq_"





    ref_Seq_file= SeqIO.read(path_folder+ str(scov)+'_ref.fasta','fasta')
    ref_Seq= ">" + ref_Seq_file.id +"\n" + ref_Seq_file.seq +"\n"
        # print (ref_Seq)
        # create a fasta file
    count_seq=0

        #for every seq in the file formulate as fasta and add this to a file with ref and seq
    with open(path_folder+input_sequences) as fasta_file: 
        for seq_record in SeqIO.parse(fasta_file, 'fasta'):
                file= path_folder+"//SEQ//"+str(define_Name)+str(count_seq)+".fasta"
                file_New_Fasta = open(file, "a")
                seq_Separate= ">"+seq_record.description +"\n"+seq_record.seq+"\n"
                new_Fasta_In=str(ref_Seq+"\n"+seq_Separate)
            #         save new file containing the ref and seq and count for next file to be generated
                file_for_Al=file_New_Fasta.write(new_Fasta_In)
            #         run MUSCLE in commandline
                pathOut = path_folder+ "//SEQ//"+str(define_Name) + str(count_seq) + "_Aligned.fasta"
                subprocess.run(["MUSCLE.exe",'-in',file, '-out', pathOut, "-maxiters", "2", "-diags1" ], shell = True) 
                    
                    
            #         Checking whether Ref sequence contain any gaps
                file_Not_OK= path_folder+"//SEQ//"+str(scov)+"check_Sequences.fasta"
                file_Check_It = open(file_Not_OK, "a")
                file_Not_OK2= path_folder+"//SEQ//"+str(scov)+"check_Sequences2.fasta"
                file_Check_It2 = open(file_Not_OK2, "a")
                file_OK= path_folder+"//SEQ//"+str(scov)+"correct_Sequences.fasta"
                file_Checked = open(file_OK, "a")
                for alignment in AlignIO.parse(pathOut, 'fasta'):
                    Ref_Al=alignment[0].seq
                    count_Ins_Base=0
                    Seq_Al=">"+alignment[1].description +"\n"+alignment[1].seq+"\n"
                    Ref_Al_fasta=">" +alignment[0].description +"\n"+alignment[0].seq+"\n"
                    #if Ref has gap: safe in Seq_check_it otherwise seq is checked and correct
                    align_Faulty= re.search(r'(\-)', str(Ref_Al))
                    if align_Faulty:
                            file_Check_It.write(str(Seq_Al))
                            file_Check_It2.write(str(Ref_Al_fasta)+str(Seq_Al))
                #                 print("Ref aligned faulty")
                            count_Ins_Base+=1
                    else:
                            file_Checked.write(str(Seq_Al))
                #                print("Ref correct, no check needed")
                    file_Checked.close()
                    file_Check_It.close()
                    file_Check_It2.close()

                #         count up for new files
                    count_seq+= 1
                        
                #         print (seq_Separate, count_seq)
                #         print (file)

                    file_New_Fasta.close()

    

