From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Displaying Active NAT Connections with iptables
Date: Sun, 16 Jun 2002 09:20:01 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000a01c214c3$2c683400$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

oops ,

here it is,

is it possible just to show the current Active NaT connections with IPTables
??

i have found a Perl Script which will show you the state of Past & Current
connections

but i only need current, although im happy with this for now .. :D

here is the script i found

/etc/tracker.pl
---------------Start Copy Below the Line----------------

#!/usr/bin/perl -w
#
# Purpose:
#
#  Quick jobber to do some parsing of the iptables connection
#  tracking from /proc and print it out a little nicer.
#  (and to make Godot quit bugging me, of course )
#
# Options:
#   -P    This enables port lookups (translating ports -> services [Should
be fast])
#   -p    This disables port lookups
#
#  You can set the defaults for both of these below, 1 == lookup,
#  0 == don't. The commandline switches override defaults.
#
# Author:
#
#  Brian Poole, http://www.cerias.purdue.edu/homes/rajak/
#
# LICENSE:
#
#  This is licensed under the BSD license, in other words
#  do what you will, I don't care, just don't blame me.
#  I assume no liability for any incompetent usage of this
#  script, nor of any poor coding (though of course there
#  none of THAT!).

$PORT_LOOKUPS = 1;

if (defined @ARGV and $#ARGV != 0){
  &usage;
} elsif (defined @ARGV){
  if ($ARGV[0] eq "-p"){
    $PORT_LOOKUPS = 0;
  } elsif ($ARGV[0] eq "-P"){
    $PORT_LOOKUPS = 1;
  } else {
    &usage;
  }
}


# Hey! Who told you that you could read my code! GET OUTTA HERE!#%^!@#

# First lets grab the data from the proc entry..

open INPUT, "</proc/net/ip_conntrack" or die "Unable to read input: $!\n";

while (<INPUT>){
  push @{ $records{(split " ")[0]} }, $_;
}

close INPUT;

if (defined %records){

  print "               Current connections being tracked by
netfilter\n\nProt       Src IP      Src Port      State          Dst IP
Dst Port\n\n";

  foreach $key (keys %records) {

    $proto = uc $key;

    for $i (0 .. $#{ $records{$key} } ){

      # Assigning that bad boy into a variable because I don't like having
to type all that every time ;)

      my $log = $records{$key}[$i];

      # Zero out the port vars (we can't guarantee we have replaces to match
them since some protocols (ICMP))
      # don't have ports. Then do a match and shove the vars into place as
appropriate.

      ($dport, $sport ) = ("","");

      if( $log =~ /^.*?src=(.*?) dst=(.*?) (?:sport=(\d{1,5})
dport=(\d{1,5}) )?/) {
 ($srcip, $dstip) = ($1,$2);
        ($sport, $dport) = ($3,$4) if (defined $3 and defined $4);
      } else {
        report($log);
      }

      # This is detection of what ip_conntrack state the particular item is
in, base is <--NORM--> (just regular)
      # the others are done as detected. I have a special check that if more
than one []'s found to die and
      # report just because I'm not completely sure if this is impossible
and I need to know if not.

      $state = "<--NORM-->";
      if ( $log =~ /\[ASSURED\]/ ){
         $state = "<==ASRD==>";
      }
      if ( $log =~ /\[UNREPLIED\]/ ){
         report($log) if $state ne "<--NORM-->";
         $state = " --UNRE-->";
      }
      if ( $log =~ /\[UNCONFIRMED\]/ ){
         report($log) if $state ne "<--NORM-->";
         $state = "<--UNCO-- ";
      }

      if ($PORT_LOOKUPS and $sport ne "" and $dport ne ""){
        my $name = (getservbyport $sport, $key)[0];
        $sport = $name if defined $name;
        undef $name;

        $name = (getservbyport $dport, $key)[0];
        $dport = $name if defined $name;
      }

      write;

    }

    print "\n";
  }
} else {
  # No tracked connections.. weird.
  print "\nNo connections currently being tracked.\n";
}

exit;

# All of those -- err, that one subroutine
#  -- Make that TWO! I'm all about efficiency baby.

sub usage {
   die "IP connection tracker\n",
         "Written by Brian Poole <raj\@cerias.purdue.edu>\n",
         "\nUsage: $0 [-Pp]\n",
         "\n-P enables port -> service mappings\n",
         "-p disables port -> service mappings\n\n";
}

sub report {
   die "Please mail the following log entry to raj\@cerias.purdue.edu for
debugging purposes.\n\n$_[0]\n";
}

# The format.. duh.

format STDOUT =
@<<< @>>>>>>>>>>>>>> @|||||||||||| @<<<<<<<<< @>>>>>>>>>>>>>> @||||||||||||
$proto, $srcip,         $sport,     $state, $dstip,         $dport
.

---------End Copy Before This Line------------------------


