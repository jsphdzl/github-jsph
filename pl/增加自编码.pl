#!/usr/bin/perl -w
use strict;
use 5.010;

my %hash;
open IN,"ҽ���Ա������.txt";
<IN>;
while(<IN>){
       chomp;
       my($ybzxbm,$zbm) = split /\s+/;
       $hash{$ybzxbm} = $zbm;
}
close IN;

my $t = 0;
my $nt = 0;
open A,"ҽ��ʡƽ̨����.txt";
open OUT,">ҽ��ʡƽ̨�Ա���.txt";
print OUT "ҽ�����ı���\tʡƽ̨����\t�Ա���\tҩƷ����\n";
<A>;
while(<A>){
       chomp;
       my($ybzx,$spt,$name) = split/\s+/;
       if ($hash{$ybzx}){
            print OUT "$ybzx\t$spt\t$hash{$ybzx}\t$name\n";
            $nt++;
       }
       else{
            print OUT "$ybzx\t$spt\t\t$name\n";
            $t++;
       }
}
my $tn = $nt + $t;
say "һ����$tn����¼�����Ա������Ŀ��$t����û���Ա������Ŀ��$nt��";
close A;
close OUT;