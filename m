From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Saving IPTable rules..oops
Date: Wed, 29 Dec 2004 10:03:10 -0800
Message-ID: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Morning.

Well, spent a better part of the night playing with IPTables. Tried out 
some rules, tweaked this, broke that. Was a lot of fun.

Anyway, as I am getting ready to make one of my servers go live, I realized 
something that I completely overlooked. Very important thing I might add.

Basically, once you put all your rules into IPTables via the command line, 
how do you save your rules? I saw a command, iptables-save, but that just 
outputs the rules in a readable format.

I started thinking and came up with the following:

1) Does iptables read the init script in /etc/init.d/ upon bootup of a 
server/box and use those rules for the system?

or

2) Does it read a plain text file some where an use those rules instead?

wasn't quite sure and since im going on 22 hours without sleep, im positive 
I missed it some where.

With that in mind, was hoping someone could fill in the details.

IF it is the case the the system reads the iptables init script upon 
bootup/restart, that means I need to work on my scripting. :)

Anyways, hoping for a little clarity here.

Cheers,


Jason


