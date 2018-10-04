@files = <*.bvh>;
foreach $file (@files) {
  		open  (OLD, $file) || die "Couldn´t open $file: $!\n";
		open  (NEW, ">$file.bvh") || die "Couldn´t open $file.bvh: $!\n";
			while (<OLD>) {
				$line = $_;
				if (/Normal/) { while (<OLD>) { last if /}/; } $line => ""; }
				if (/normalIndex/) { while(<OLD>) { last if /[]]/; } $line = ""; }
				$line  =~  s/[-+]?[0-9]\.[0-9]+e[+-][0-9]+/0/g;
				$line  =~  s/([-+]?[0-9]+\.[0-9]{2})[0-9]+/$1/g;
				$line =~ s/0\.00/0/g;
				$line =~ s/[ ]+/ /g;
				$line =~ s/[\t]+/ /g;
				$line =~ s/^ //g;
				print NEW $line;
					
			}
			close OLD;
			unlink ($file);
			close NEW;			
			}
			
			


			
						


