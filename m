From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: Packets that should have been DNATted appearing in INPUT table
Date: Thu, 6 Jan 2005 17:49:04 +0100
Message-ID: <008001c4f40f$a6fde380$4206a8c0@loki>
References: <000901c4f350$7b3d1370$4206a8c0@loki>
	<20050106155557.GA28339@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

On Thursday, January 06, 2005 4:55 PM,
Jason Opperisano wrote:

> does your DNAT work or not?

Thats what I find most weird: For about 95% of the packets it indeed does 
work, but some of the packets seem to be ignored by the DNAT rule added to 
PREROUTING. The relevant parts of iptables' rules list output are:

Chain INPUT (policy ACCEPT 1 packets, 40 bytes)
 pkts bytes target     prot opt in     out     source 
destination
  178 17537 ACCEPT     all  --  lo     any     anywhere             anywhere
 1012 63664 DROP       tcp  --  ppp0   any     anywhere             anywhere 
tcp dpt:4664
[...]

and

Chain PREROUTING (policy ACCEPT 333K packets, 17M bytes)
 pkts bytes target     prot opt in     out     source 
destination
26615 1336K DNAT       tcp  --  ppp0   any     anywhere             anywhere 
tcp dpt:4664 to:192.168.6.10
[...]

So from the users point of view I would not have even noticed it, as 
applications work as expected. So the user would say, my DNAT does work. But 
looking at the packet counters I would like to understand what is happening, 
because my aim was to have every single packet going to specific ports being 
redirected to another box. As already mentioned, I believe the packet 
counter of the above drop rule should be zero, because all packets matching 
this rule should already have matched DNAT in PREROUTING and therefore never 
enter INPUT. From that point of view (at least for some packets) I have to 
say, that DNAT does not work.

If there is more information I can provide to narrow down the problem, 
please let me know. And thanks again for your help,

Marius 


