From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: DNAT from an IP address that does not exist to another that
 exists
Date: Fri, 1 Aug 2003 16:13:04 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308011600260.31382-100000@localhost>
References: <018f01c35647$f68f9ea0$200aa8c0@thorin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <018f01c35647$f68f9ea0$200aa8c0@thorin>
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
To: Carlo Florendo <carlo@astra.ph>
Cc: netfilter@lists.netfilter.org

Hi Carlo,

> The gateway address is 192.168.30.1
> The non-existent address which I want to DNAT to another machine 
> within the network is 192.168.40.40
> The existent IP address where I want 192.168.40.40 to be forwarded to, 
> is 192.168.30.11

This is a case of what I call "bermuda triangle" routing, and is
definitely a FAQ. The problem is that the replies to your connection go
_directly_ back from 192.168.30.11 to 192.168.30.x, without going through
the firewall, and as a result they don't get un-masqueraded, and
192.168.30.x ignores them, since it's expecting to see packets from
192.168.40.40 instead of 192.168.30.11.

The only solution that I know is to masquerade the DNAT'ed packets, so 
that they will always go back through the firewall. For example, in your 
case:

  iptables -t nat -I POSTROUTING -s 192.168.30.0/24 -d 192.168.30.11 \
	-j MASQUERADE

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |



