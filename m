From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forwarding Problem
Date: Tue, 12 Dec 2006 20:45:10 -0600
Message-ID: <457F6936.5070900@riverviewtech.net>
References: <b06b831a0612120453r8e1169fg8cad7f88d4c5c7d0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b06b831a0612120453r8e1169fg8cad7f88d4c5c7d0@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

(Cross post of my answer on the LARTC mailing list.)

On 12/12/06 06:53, Javier A Toledano wrote:
 > Routing Problem

<snip>

 > The problem is that forwarding is enabled but when I try to probe
 > connectivity from a host in the 10.0.0.0 net , eg 10.0.0.1 making an
 > echo request
 > to a host in 192.168.10.0 net , eg 192.168.10.49 the icmp packets
 > arrive to the linux box (interface eth0) but don't traverset it.
 > After I iniate an echo request from 192.168.10.49 to 10.0.0.1, the
 > packets iniatated in 10.0.0.0 net starts to traverse the router
 > magically.
 > It seems that It needs a packet from the 192.168.10.0 to start working.
 >
 > I would appreciate any idea.

I'm not a CentOS user so I can not say for sure.  However I would expect 
that (despite what you say) that there is some sort of IPTables stateful 
packet inspection going on from your 10/ network to your 192.168/ 
network.  If this is indeed the case and the rule is a basic state of 
ESTABLISHED, RELATED, then any traffic from 10/ to 192.168/ AFTER you 
sent traffic from 192.168/ to 10/ would be considered RELATED and thus 
allowed through.

However, if as you say, there are no IPTables rules in play at all 
something else is interfering with your traffic, what it would be, I'm 
not sure.

Try running iptables-save to make sure that there are absolutely no 
rules in effect any where.



Grant. . . .

