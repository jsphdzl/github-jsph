#!/usr/bin/perl -w
use 5.010;
foreach my $file (glob "*"){#查找当前目录所有文件
my $newFile = $file;
#$newFile = $file.".txt";#添加.txt后缀
$newFile=~s/.lite.sra.fastq$/.fastq/;  #将文件名中特定的字符串替换
if(-e $newFile){#若修改后导致文件重名，则输出警告，不作处理
    warn "Can't rename $file to $newFile. The $newFile exists!\n";
   }else{
    rename $file, $newFile#重命名文件
    or warn "Rename $file to $newFile failed: $!\n"; #如果重命名失败，则输出警告
   }
 }