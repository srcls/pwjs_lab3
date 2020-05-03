#if (!defined $ARGV[0]){
#    print "Usage: perl lab3.pl file_directory";
#    exit;
#}
$file = <STDIN>;

#$file = $ARGV[0];
open($fh, $file) or die $!;

$result = "name, score\n";
while($line = <$fh>){
    while ( $line =~ /(<tr class='problemrow'>.*?<\/tr>)/g ){
        $tr = $1;
        if ( $tr =~ /<a href='\/WIPING.*\/users\/.*?'>(.*)<\/a>/ ) {
            $name = $1;
        }
        if ( $tr =~ /<td class='mini'>(\d*\.\d*)<\/td><\/tr>/ ) {
            $score = $1;
        }
        $result .= "$name,$score\n";
    }
}
$output_filename = substr($file, 0, -5)."csv";
open STDOUT, '>', $output_filename;
print STDOUT $result;