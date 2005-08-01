From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Fun with the mangle table + LARTC
Date: Mon, 01 Aug 2005 08:01:38 -0500
Message-ID: <42EE1D32.8010308@gmx.co.uk>
References: <200508010916.37911.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508010916.37911.gdh@acentral.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

Gavin Hamill wrote:
> Hi - this is one of those "not sure if it's netfilter or LARTC" issues,

I'm not sure either, but here's a guess.

> -A POSTROUTING -s 10.0.0.0/255.255.255.0 -o eth1 -j MASQUERADE
> -A POSTROUTING -s 10.0.0.0/255.255.255.0 -o eth2 -j MASQUERADE

Why MASQUERADE? Try using SNAT rules.

> using tcpdump I can see the outgoing and reply packets on eth2 with the 
> correct source address (i.e. the one the ISP on eth2 gives me) set, but 
> tcpdump on eth0 shows only the packets from the MASQ'd host - the replies 
> from the Internet host are not passed through.

Is there anything dropping the packets in FORWARD? Try tracking with 
iptables LOG rules rather than tcpdump.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

