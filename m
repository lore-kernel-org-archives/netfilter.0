From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Reverse SNAT routes out wrong interface
Date: Fri, 21 Feb 2003 01:36:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302210136.35536.netfilter@newkirk.us>
References: <1045773286.2306.77.camel@thizzy>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045773286.2306.77.camel@thizzy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Del Winiecki <delw@wildapache.net>, netfilter@lists.netfilter.org

On Thursday 20 February 2003 03:34 pm, Del Winiecki wrote:
> Ok, another challenge.
>
> SNAT works fine, but I need the outside WAN address to look as if it
> came from an address on the eth1 network, not the Upstream WAN
> network. My linux router ports:
>
> eth4 192.168.1.0/24 ------------ (local offices, admin net)
>
> eth1 209.x.x.x/24 -------- (downstream WAN)
>
> WAN1 64.x.x.x/30 ---------  (upstream provider)
>
> all traffic from 192.168.1.0/24 must look like its from 209.x.x.13
>
> traffic flowing into WAN1 with a destination address of 209.x.x.13
> somehow needs to get routed out the eth4 interface and "un-natted"
> instead of routing out eth1.
>
> I have:
> iptables -t nat -A POSTROUTING -o WAN1 -j SNAT --to 209.x.x.13
>
> Is there some way to use DNAT to fool the kernel routing into properly
> routing this?

Since you only want traffic from the 192.168.1.x network to be SNATted,=20
you should construct your rule with that requirement:

iptables -t nat -A POSTROUTING -i 192.168.1.0/24 -o WAN1 -j SNAT --to=20
209.x.x.13

Netfilter will then reverse SNAT those packets correctly. (the rule you=20
have above will make ALL traffic going out WAN1 appear from that single=20
IP)=20

If you want NEW traffic addressed to 209.x.x.13 to be DNATted into the=20
192.168.1.x network that isn't a problem, but you have to specify a=20
precise destination (or destinations) for the traffic in one or more=20
DNAT rules.

j

> Thanks,
> Del W.


