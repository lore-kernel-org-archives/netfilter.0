From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: PCAnywhere and netfilter
Date: Fri, 27 Jun 2003 10:46:32 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0306271042140.28942-100000@localhost>
References: <3EFC0CBC.4000207@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFC0CBC.4000207@kdtc.net>
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
To: cc <cc@kdtc.net>
Cc: netfilter@lists.netfilter.org

Hi Edmund,

> I am having some troubles figuring out how to get a remote
> PCAnywhere station log onto a local pcanywhere station.
[...]
> Here's my attempt at a netfilter script for this:
> 
> iptables -A INPUT -i eth0 -d 192.168.5.31 -p tcp --dport "5631:5632" -j
> ACCEPT
> iptables -A INPUT -i eth0 -d 192.168.5.31 -p udp --dport "5631:5632" -j
> ACCEPT

I think this is wrong. You need to put the rules in FORWARD, since having 
been DNAT'ed, the packet is no longer destined for the local host, and 
will be routed by the machine. The rules you need are:

iptables -A FORWARD -i eth0 -d 192.168.5.31 -p tcp --dport "5631:5632" \
	-j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.5.31 -p udp --dport "5631:5632" \
	-j ACCEPT

In fact you can make this tighter as well, since pcAnywhere uses only UDP 
port 5632 and TCP port 5631:

iptables -A FORWARD -i eth0 -d 192.168.5.31 -p tcp --dport 5631 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.5.31 -p udp --dport 5632 -j ACCEPT

> iptables -t nat -A PREROUTING -i eth0 -d a.b.c.d -p tcp --dport
> "5631:5632" -j DNAT --to 192.168.5.31
> iptables -t nat -A PREROUTING -i eth0 -d a.b.c.d -p udp --dport
> "5631:5632" -j DNAT --to 192.168.5.31

These rules are correct, although you can tighten them up in the same way 
as above.

> I actually got this off the net and am still trying to disect it.
> Am I supposed to have Output, or just forward chains since in essence
> I'm just forwarding the PCA packets to a different station?

Just FORWARD. The packets will never go into INPUT nor will the replies go 
out of OUTPUT.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |



