From: Jason Opperisano <opie@817west.com>
Subject: RE: How to flush the connection state in the linux
Date: Wed, 29 Dec 2004 14:52:15 -0500
Message-ID: <1104349935.7318.49.camel@hubcap.ljm.dom>
References: <004b01c4ed4c$19e25fe0$aa0ba8c0@l7.com.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004b01c4ed4c$19e25fe0$aa0ba8c0@l7.com.tw>
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

On Tue, 2004-12-28 at 21:14, Vincent wrote:
> Can I remove ip_conntrack in one command? If it can be, how to do it?
> I try the command "modprobe -r ip_conntrack", but it seems not worked.
> 
> Besides, I tried to remove ip_conntrack and its dependency module
> manually.
> But the forbidden packet is still pass through. Is there any other
> solution??
> Thanks for your assistance
> 
> Vincent

in order to remove ip_conntrack--you must first remove all the modules
that depend on it (the list on the right-hand-side in the lsmod
output).  in order to remove all those modules; you must also flush any
rules that use those modules (ipt_state is a good example of this).

the "easiest" way to do this would be to flush out all your rules,
remove all modules, reload modules, reload rules; and then you would be
starting fresh.  something like:

  iptables-save > ipt.save
  for t in mangle nat filter; do iptables -t $t -F; done
  for t in mangle nat filter; do iptables -t $t -X; done
  rmmod-r.pl 	([1] See below)
  iptables-restore ipt.save

HTH...

-j

[1] rmmod-r.pl

---BEGIN PERL SCRIPT---
#!/usr/bin/perl -w

use strict;

my $lsmodCmd = "/sbin/lsmod";
my $modprobeCmd = "/sbin/modprobe";
my $unameCmd = `which uname 2>/dev/null`;
chomp $unameCmd;
my ($kernelVer, $modReg, $modSep, @depMods, $mod);

if (-x $unameCmd) {
  $kernelVer = `$unameCmd -r`;
  $kernelVer = substr($kernelVer,2,1);
}

if ($kernelVer != 4 && $kernelVer != 6) {
  die "Unsupported Kernel Version\n";
}

unless (-x $lsmodCmd) {die "Command not found:  $lsmodCmd\n";}
unless (-x $modprobeCmd) {die "Command not found:  $modprobeCmd\n";}

if ($kernelVer == 4) {
  $modReg = qr/^.*\[(.*)\]$/iox;
  $modSep = " ";
}

if ($kernelVer == 6) {
  $modReg = qr/^.*\s\s\d+\s(.*)$/iox;
  $modSep = ",";
}

open (MODLIST, "$lsmodCmd | ");

while (<MODLIST>) {
  chomp;
  if (/^ip_conntrack\s/) {
    s/$modReg//;
    @depMods = split(/$modSep/,$1);
  }
}

foreach $mod (@depMods) {
  system("$modprobeCmd -rv $mod");
}

close (MODLIST);
--- END PERL SCRIPT ---

--
"If I wanted smoke blown up my ass, I'd be at home with a pack of
 cigarettes and a short length of hose."
	--The Simpsons


