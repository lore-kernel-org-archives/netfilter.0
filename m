From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: ECN and ipitables: a political issue
Date: Fri, 06 Dec 2002 19:38:27 +0100
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <3DF0EEA3.5010404@istitutocolli.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-admin@mailman.ds9a.nl>
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

Hi there!

I recently  discovered that the linux kernel support Explicit Congestion 
Notification and that a fully ecn enabled network would have virtually 
no dropped packets.
Enabling that feature is a way to respect the infrastructure we use, and 
servers, routers or firewalls not complying with regularly approved 
standard like rfc 793 and 3168 are dammaging all of us, in a way not 
very different from that of spammers.
Being able to discriminate between good and bad guys it is possible 
through a filtering rule,

iptables -A POSTROUTING -t mangle -p tcp -d bad.guy.com -j ECN 
--ecn-tcp-remove.

Many thanks to the guys who wrote the kernel support and the target!

This is not a solution of the problem, but at least gives you the power 
to send an email the the system/network administrators and put that rule 
in our ILLEGAL_HOST_AND_NETS_VIOLATING_RFC793 chain. Many of those hosts 
simply do not have access to their routers' or firewalls' configuration.

Now, the problem is the rule seems not to be working and I cannot 
connect to those hosts unless turning ecn off (echo 0 > 
/proc/sys/net/ipv4/tcp_ecn), the wrong solution. I suspect I'm getting 
something wrong.

Miciej Soltysiak had a similar probelm with an illegal box in his 
network. Did you find a solution?

Please help. If I will solve this problem I promise that I will submit a 
patch proposal to the LARTC's mantainers. That's the best I can do to 
make people aware of this issue.

Thanks a lot.
Andrea

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
