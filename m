From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Exposing an internal server through an iptables firewall
Date: Fri, 15 Aug 2003 10:37:36 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308151025340.31438-100000@localhost>
References: <DB7AEF327F702A4FA4D6E130C51BE756245A48@mainserver.amfeslan.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DB7AEF327F702A4FA4D6E130C51BE756245A48@mainserver.amfeslan.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel L. Miller" <dmiller@amfes.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

Hi Daniel,

> Postfix is running on the gateway server - works fine.
> 
> What do I need to set on the firewall/gateway to make my Postfix server
> available to the internet?  I've tried:
> 
> iptables -t nat -A PREROUTING -p tcp --dport 25 -i eth1 -j DNAT --to
> 192.168.69.2:25

This looks wrong to me:

[Firewall]
> Chain PREROUTING (policy ACCEPT 68 packets, 4258 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     2   120 DNAT       tcp  --  eth1   *       0.0.0.0/0
> 67.106.235.126     tcp dpt:25 to:192.168.0.2:25

Isn't your Postfix server on 192.168.69.2 port 25? If so, then change the 
PREROUTING rule to DNAT to that address instead. If not, then change this 
one:

[Firewall]
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
[...]
>     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
> 192.168.69.2       tcp dpt:25

Otherwise, the rules look OK to me.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


