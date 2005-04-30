From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: ICMP types
Date: Sat, 30 Apr 2005 17:55:49 -0500
Message-ID: <42740CF5.9070705@riverviewtech.net>
References: <8a79f08aaeef.8aaeef8a79f0@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8a79f08aaeef.8aaeef8a79f0@vsnl.net>
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
To: netfilter@lists.netfilter.org

varun_saa@vsnl.net wrote:
> Hello,
>       As I understand there are more one 
> type of ICMP ping.

Yes, there are a LOT of different types ICMP packets.  It looks like there are ~28 of them in use (see http://www.iana.org/assignments/icmp-parameters).  You really don't want to just blindly drop ICMP packets as they are used to help control the internet or let you know when problems were encountered out on the wild surf of the net.  A common practice is to allow limited numbers of ICMP packets per a time period.  Usually this is system wide and not per destination IP.  Rather than doing this I would like to see some sort of limit per source IP.  A common accepted practice is to allow 1 ICMP (echo request and echo reply) packet per second as quite a few monitoring systems will ping (ICMP echo) a system expecting a response (ICMP echo reply) to see if a system is up and functioning.  (IMHO) Only in very rare / limited situation should ICMP be completely dropped.  Granted I have set up fi
 rewalls / servers in the past to do this but that was when I was just starting.  Some peop
le / institutions have made political decisions to DROP ICMP traffic in an attempt to not become part of a reflected ICMP DDoS attack on someone.  Rather than doing this I would be more tempted to rate limit the number of ICMP packets that could come from (and reply to) any given source.  There are obviously certain situations where certain types if ICMP packets are absolutely wrong, i.e. you should *NEVER* receive an ICMP error (Echo Reply (0), Destination Unreachable (3), Source Quench (4), Alternate Host Address (6), Time Exceeded (11), Parameter Problem (12), Timestamp Reply (14)*, Information Reply (16)*, Address Mask Reply (18)*, Datagram Conversion Error (31), Mobile Host Redirect (32), IPv6 I-Am-Here (34), Mobile Registration Reply (36), Domain Name Reply (38), etx.) from a system that you are not presently communicating.  Rule sets can be built to trap such things using the rece
 nt and / or set match extensions, but are rather complex and lengthy.  I personally have n
ot built such a rule set but see no problem doing so.  If you want help in this let me know and I'd be glad to do it, if for nothing else but the geek factor.  :)

* = This ICMP type is not an error, but same is the idea.



Grant. . . .
> What are these types and should they
> all be allowed in iptables rules ?


