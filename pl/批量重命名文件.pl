#!/usr/bin/perl -w
use 5.010;
foreach my $file (glob "*"){#���ҵ�ǰĿ¼�����ļ�
my $newFile = $file;
#$newFile = $file.".txt";#���.txt��׺
$newFile=~s/.lite.sra.fastq$/.fastq/;  #���ļ������ض����ַ����滻
if(-e $newFile){#���޸ĺ����ļ���������������棬��������
    warn "Can't rename $file to $newFile. The $newFile exists!\n";
   }else{
    rename $file, $newFile#�������ļ�
    or warn "Rename $file to $newFile failed: $!\n"; #���������ʧ�ܣ����������
   }
 }