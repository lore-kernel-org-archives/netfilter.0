From: Jason Opperisano <opie@817west.com>
Subject: Re: how to delete a group of rules
Date: Sat, 27 Nov 2004 13:00:18 -0500
Message-ID: <1101578417.10064.17.camel@hubcap.ljm.dom>
References: <20041127171409.31CE4591@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041127171409.31CE4591@mail.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: alexis@tpys.com.ar

On Sat, 2004-11-27 at 12:17, Alexis wrote:
> Hi all, im coding a frontend for iptables based on php and mysql.
>  
> But i have an issue when i try to delete a group of rules, it cant be done. 
>  
> suppose this
>  
> a chain called "x1"
>  
> delete the chain implies 
>  
> - empty the chain
> - delete all  rules that reference the chain
>  
> the first line is easy to do  with iptables -F x1 , but if (as an example)
> in filter::INPUT i have 2 or more references to this chain, executing
> iptables -D INPUT -j x1 will delete only the first one and not all rules
> that references x1.
>  
> Does exist any way to do this from command line using iptables, or code a
> script to do this is the solution?

make it a part of your script.  an example in perl (which should be
straight-forward to port to PHP):

---BEGIN PERL SCRIPT EXAMPLE---
#!/usr/bin/perl

use strict;

my $iptablescmd = "/usr/local/sbin/iptables";
my $savecmd = "/usr/local/sbin/iptables-save";
my $chain = "mychain";
my $savefile = "/var/tmp/ref.test";
my @references;
my $reference;

system ("$savecmd > $savefile");

open (RULES, "$savefile");

while (<RULES>) {
  if ( /\ \-j\ $chain\ / ) {
    s/\-A\ /-D\ /;
    push (@references, $_);
  }
}

close (RULES);

foreach $reference (@references) {
  print "Executing:  $iptablescmd $reference";
  system ("$iptablescmd $reference");
}

print "Executing:  $iptablescmd -F $chain\n";
system ("$iptablescmd -F $chain");

print "Executing:  $iptablescmd -X $chain\n";
system ("$iptablescmd -X $chain");

system ("rm -f $savefile");
--- END PERL SCRIPT EXAMPLE ---

-j

--
"Facts are meaningless. You could use facts to prove anything that's
 even remotely true!"
	--The Simpsons


