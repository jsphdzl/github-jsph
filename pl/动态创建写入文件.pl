#!/usr/bin/perl
use 5.010;
use strict;
use Getopt::Long;

#this script is used to split the 16s data into separate files according to the barcode and primer

my @array = qw /ACGAG ACGCT AGACG AGCAC ATCAG TCGAT CGTGT CTCGC TCTCT TGATA CATAG CGAGA ATACG TCACG CGTCT TCTAC TGTAC ACGAC CGTAG TACGA TACTC TAGAG TCGTC ACATA TACAC CACGC TACAG CAGTA AGCGT AGTAC ATAGA TAGTG TCGCA ACGCG AGACT ACTGT/;

#open IN,"t.txt";
#my @fh;
my %fh;
open IN,"zdr.16s.D1311005-047.fastq";
foreach (@array){
          open $fh{$_},">${_}.new.fastq"||die"Can not open file:$!.";
          #push @fh,$fh{$_};
          }
my %hash;
while(<IN>){
       my $id = $_;
       chomp($id);
       my $seq = <IN>;
       chomp($seq);
       my $pos = index($seq,'GATGTGCCAGC');
       my $epos = index($seq,'GTAGTCC');
       <IN>;
       my $qv = <IN>;
       if ($epos > 17){
            if($pos > 4 && length($seq) > 70){
                my $bc = substr($seq,$pos-5,5);
                my $len = $epos + 6 - $pos + 1;
                my $nseq = substr($seq,$pos,$len);
                my $nqv = substr($qv,$pos,$len);
                my $t= $fh{$bc};
                print $t "$id\n$nseq\n+\n$nqv\n" if defined $t;
            }
       }
       if ($epos == -1){
            if(length($seq) > 200 && $pos > 4){
                my $bc = substr($seq,$pos-5,5);
                my $nseq = substr($seq,$pos);
                my $nqv = substr($qv,$pos);
                my $t= $fh{$bc};
                print $t "$id\n$nseq\n+\n$nqv\n" if defined $t;
            }
       }
}
close IN;
foreach (@array){
          close $_;
}

open POS,">pos.txt";
foreach my $key(sort{$a<=>$b} keys %hash){
        print POS "$key\t$hash{$key}\n";
}
close POS;