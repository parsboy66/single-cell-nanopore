$fa=shift;
$alen=shift;
$blen=shift;
$ulen=shift;
$gene=shift;
$ablen=$blen+$alen;
$bulen=$blen+$ulen;
$barcode='N'x$blen;
$umi='N'x$ulen;

while(<>){
$h{"$2$3"}="$1\t$2\t$3" if /GN:Z:(\S+).*CB:Z:([ACGT]+).*UB:Z:([ACGT]+)/
}

open(F,"<$gene");
$gene=<F>;
close F;
chomp $gene;

open(F,"<$fa");
while(<F>){chomp;
if (/^>(\w+):/){$s=$1
}else{
$barcode=substr($_,$alen,$blen);
$umi=substr($_,$ablen,$ulen);
$d = defined $h{substr($_,$alen,$bulen)} ? $h{substr($_,$alen,$bulen)} : "$gene\t$barcode\t$umi";
print "$1\t$d\n"}
}
close F
