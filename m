From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables-restore help
Date: Mon, 29 Sep 2003 06:43:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064832220.1896.12.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

	Did you remember to redirect the output of iptables-restore to
/etc/sysconfig/iptables? Otherwise it just dumps it to stdout.
	If you use only a small number of rules, it may be easier to rewrite
the scripts as suggested in another response and use the regular
iptables syntax.  However, if you use large numbers of rules, you will
face a very serious degradation in the time it takes to load iptables. 
On slow machines, I can see a noticeable difference even with only a
handful of rules.  If you have an installation that involves thousands
or tens of thousands of rules, the device may become nearly unusable.
	We have rewritten the scripts for our ISCS project but still use the
iptables-restore command and syntax to load our rules.  There is
painfully little documentation on the iptables-restore syntax.  If you
need more information about it, let me know and I'll post some of our
engineering documents about using it.
	The following is an excerpt from an e-mail to our engineering team to
describe the problem.  lotsarules is a script we used to generate
meaningless rules for testing the rule load times and proto-PEP is a
test hardware appliance for use with the ISCS project
(http://iscs.sourceforge.net):

 My crude benchmarks show that iptables can load a small number (few
thousand) of rules very quickly but has trouble handling large numbers
of rules. It is not a linear increase. That is, large numbers of rules
not only take longer because there are more rules but the rate at which
rules can be added seems to slow in proportion to the number of existing
rules.
    Here are the actual tests and results:
My laptop - PIII 750 w/256 MB RAM
ran lotsarules for 30 minutes and added 19,533 rules = 651/minute = 11/s

I thought that the problem may be all the calls to disk to run iptables
so I ran lotsarules on the RAM based Proto-PEP for 30 minutes and added 
14807 rules = 493/minutes = 8/second!

    That seems awfully slow so I ran some more test on my laptop. When I
ran lotsarules for only one minute, I added 3584 rules - quite a bit
more than 651 per minute.
    I then flushed those rules and ran lotsarules on my laptop for 15
minutes. I added 13789 rules = 919/minute.
    I wasn't sure if the problem was running the same script constantly
from memory or the sheer number of rules. So I next ran lotsarules for
one more minute WITHOUT first flushing the existing 13789 rules. In one
minute I added only 445 more rules. It appears that the problem is the
raw number of rules.
    Thus, increasing the number of rules by a factor of say three, does
more than make the box three times slower to boot. It will have some
kind of exponential impact.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


