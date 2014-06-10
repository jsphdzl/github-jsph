#!/usr/bin/perl -w
use 5.010;

#open IN,"C:\\Users\\lei\\Desktop\\tnb\\tnb_data.txt";
open IN,"tnb_data.txt";
my %hash;

<IN>;
while(<IN>){
       chomp;
       my $bah = (split /\s/)[3];
       if(!$hash{$bah}){
          $hash{$bah} = 1;
       }
       else{
            say "$bah has occurred!";
            #break;
       }
}

close IN;