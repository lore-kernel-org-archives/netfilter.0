From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: dumb question...route from local eth1 to eth2 and vice versa
Date: Thu, 1 Dec 2005 09:49:17 +0100 (CET)
Message-ID: <54466.193.173.147.3.1133426957.squirrel@webmail.sterenborg.info>
References: <000001c5f642$ab8b8890$0101000a@sterenborg.info>
	<438E9F59.9030007@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438E9F59.9030007@wildcash.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, December 1, 2005 07:59, Rudi Starcevic wrote:
> Hi,
>
> I have two scripts I use to do something similar to this.

...

> Any feedback much appreciated.

This is about ip_a_route_1.sh and ip_b_firewall_1._b.sh from your last
post.

I think ip_a_route_1.sh is way too difficult for this setup. I didn't
even read it all through (saw something about tables, rules and
prio)..
This can simply be done using the old "ifconfig" and "route" commands
(although the new "ip" command seems to be preferred by some people).

ifconfig eth0 192.168.3.10 netmask 255.255.255.0 up
ifconfig eth1 192.168.1.1 netmask 255.255.255.0 up
route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.168.3.254

The two ifconfig rules should already add the routes for these
interfaces. Only need to add the default route.

=3D=3D=3D=3D=3D=3D=3D=3D

Disable forwarding in the top of your script.
Enable forwarding when you finished the FORWARD chain, when you know
all rules are in place.

=3D=3D=3D=3D=3D=3D=3D=3D

You did not set the policy of FORWARD to DROP. It will DROP nothing.

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

Maybe some things stop work after this, which means you need
additional rules to allow what you need.

=3D=3D=3D=3D=3D=3D=3D=3D

You did not set the policy of OUTPUT to DROP. The OUTPUT rules are
useless because everything will be accepted, even without these rules.

=3D=3D=3D=3D=3D=3D=3D=3D

Actually, I started commenting both scripts, and then I realised you
were trying to answer the OP's question instead of asking your own.
(Or it's too early for me and I don't understand what this post is
about).

The OP was asking about letting packets be routed between to LAN
interfaces, not LAN to internet (NAT). He just needs to allow
forwarding between these to interfcaes and let routing do the rest.
Your scripts are doing something different.


Gr,
Rob



