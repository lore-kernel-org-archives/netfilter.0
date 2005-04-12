From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Mon, 11 Apr 2005 21:32:52 -0500
Message-ID: <425B3354.2030807@riverviewtech.net>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>	<425AF2B7.2050402@riverviewtech.net>
	<1113266214.2111.46.camel@grendel>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113266214.2111.46.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: gtaylor+reply@riverviewtech.net, netfilter <netfilter@lists.netfilter.org>

> <semi-rant>
> Actually, this is incorrect. Consider the following:
> Port is open = SYN/ACK returned
> Port is closed = RST/ACK returned
> System down = ICMP type 3, code 1 returned
> Net down = ICMP type 3, code 0 returned
> Packet blocked = ICMP type 3, code 13 returned
> Firewall with drop rule = nothing comes back
> 
> Note the *only* time you will see nothing coming back consistently is
> when a firewall is in the way. So by dropping packets, you are
> confirming the existence of a firewall. As an example, run nmap against
> a firewall with a drop policy. It will actually report that a firewall
> is in the way when nothing comes back. No head scratching required. ;-)
> 
> If you are looking to go stealthy, host unreachables (ICMP type 3, code
> 1) are a better choice. Now your firewall looks like a simple up stream
> router with no filtering in place.
> 
> Now, a drop policy does have some benefits. For example it will slow
> down a port scanner as the scanner tries to determine if its packets are
> getting lost or if there is a firewall in the way. However a default
> drop policy also has its drawbacks in that it returns nothing makes the
> address space far more appealing to an attacker to spoof as part of a
> TCP SYN flood attack (no response from your network allows them to tie
> up the connection pool for a longer period of time on the victim's
> system). So by implementing a default drop rule you are actually helping
> the attacker perform a successful flood. This one of the reasons why the
> RFC's define dropping packets as "A Bad Idea" (TM). See RFC 1812 for
> more details.
> </semi-rant>

Hmm, I will probably have to modify my firewall scripts to send back ICMP 3/1 (-j REJECT --reject-with icmp-host-unreacahbel) Responses in this case.

One reason that some institutions decide to DROP verses REJECT is so that someone can not spoof their source IP while performing some sort of attack on the institutions system expecting the REJECT to go to the spoofed source IP thus becoming part of what I think is considered a reflected attack.  Some people / institutions say yes to dropping and no to rejecting while others say no to dropping and yes to rejecting.

These issues and many more like them are some of the things that I would like to spend some more time reading about and gaining a better understanding than I presently have.  But alas I don't have the time for it unless I make it and at the moment other thing(s) (Asterisk) are higher on my priority list.  Though now that you have said something I may have to go do some RFC reading while I'm on the thinking stool.



Grant. . . .

