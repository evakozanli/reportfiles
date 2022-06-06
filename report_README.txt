DISCLAIMER: these files are available to check what I have done, rather than reproducing it. Unfortunately, the input files can not be shared as they contain sensitive data.


File 1: adding samples to the pre-existing mastertable

Samples from all performed microarrays of sCoVs are added to the mastertable.

important changes:
- samples are ordered based on which timepoint in the study (6m/12m etc.)
- samples are assigned to the correct participants


File 2: prepare data for figures // make figures
names are changed to English

definition of vaccinated: either 1 or 2 of the vaccination titers are available (thouroughly checked before assuming this)
definition of SARS2 pos: if is_any_pos gives a 1 instead of zero

boxplots for each of the analyses - tested for significance

For the six months comparison: Samples are only included if the 6 months sample is taken before the person is vaccinated

For pre and post vaccination comparison: samples are only included if we received both a pre vaccination 2 and after vaccination 2 sample


File 3: pairwise alignment sCoVs
Here we open all sequence files sequentially to seperate them into two files containing a sequence and the reference genome
We align these files in the command line with MUSCLE 
The pairwise alignments are separated into those that did not create gaps/insertions into the reference and those that did
The first are immediately ready for further processing, the second are checked manually to assess usability 


File 4: initial filter
all aligned sequences (correct as well as to be checked) are checked for ambigious sequences. 
If more than 1% of the sequence exists of N and gaps (-), this is a sign to remove them as the quality of the sequences cannot be trusted
The remainder of the sequences is used in downsampling (or firstly, in checking usability)

similar file called initial_filter_correctseq:
this is script for the files that have correctly aligned to the ref, in which case we don't need to change Spike gene location. 
(spike gene sequences as well as full genome sequences use the same file)


File 5: isolate the spike from the sequences
two files are made to isolate the spike when the sequence contains gaps and when not (correctseq)
New files do only contain spike sequences 
These files are then used in multiple sequence alignment (MSA)

File 6: downsampling
The MSA is downsampled based on year with this script.Downsampled sequences are further used for phylogenies or to infer nonsynonymous mutation rates

File 7: mutations from sequences
The downsampled sequences are translated into amino acid sequences. Comparison is made between each of the aa sequences with the reference.Every change added to a list. 
A dataframe is made of the frequencies that mutations on certain locations occur. If the percentage is 50% or higher, this mutation is kept.
These mutations are saved in an excel file and can be used for coloring these mutations in the protein structure. 

File 8: ELISA figures
In this script, the data obtained from our ELISAs is changed to create barplots out of it.


File 9: R file for trees
the file used to produce the image of the generated phylogenies




muscle commands:
muscle is used in alignments of sequences in the command line

MUSCLE.exe -in file.fasta -out file_aligned.fasta -maxiters 2 -diags1


try to align with other aligned sequences (spikes only)
MUSCLE.exe -profile -in1 file1_aligned.fasta -in2 file2.fasta -out file_complete_aligned.fasta


