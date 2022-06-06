library(ggtree)
tree <- read.tree("RIVM/project_main/genomic_analyses/SEQ/MSA/229E_spike_tree_try.newick")
ggtree(tree, color='#807dba', size=1) +  geom_tippoint(size=2, alpha=.9, color="#3f007d") + geom_treescale()



