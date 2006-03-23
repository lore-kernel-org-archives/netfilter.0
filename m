From: "Jeremy Elson" <jelson@gmail.com>
Subject: Re: Per-client routing, plus masquerading -- possible?
Date: Thu, 23 Mar 2006 01:35:20 -0800
Message-ID: <51e5f6120603230135s75fbaeffx6f7e873185be28b3@mail.gmail.com>
References: <51e5f6120603221910j3a7d3827oddb2b3bdcacaa818@mail.gmail.com>
	<44224FB7.3020502@netboxblue.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44224FB7.3020502@netboxblue.com>
Content-Disposition: inline
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
To: Menno Smits <menno@netboxblue.com>
Cc: Netfilter Mailing list <netfilter@lists.netfilter.org>

On 3/22/06, Menno Smits <menno@netboxblue.com> wrote:
> > Could someone please point me in the right direction?  Or is this not p=
ossible?
>
> What you want to do is possible but you'll need to employ source policy
> routing using the "ip" command.

Thank you; this worked beautifully!

I have one more quick question: is there some way to get iptables -L
to show full rules?  It seems that there are some aspects of the rules
that exist but are not printed, such as the interface selected.  In
other words:  when I type a command like:

 iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

... and then later check my work with iptables -t nat -L, it doesn't
show "tap0" anywhere.   I actually mistyped this as "eth" (without the
0) -- the original iptables command did not give me an error
(non-existant interface!), and the -L command didn't show me the error
:-(.

But, overall it works great.  Just for other people's reference: I
solved this using a combination of source policy routing using
iproute2 (the IP command), plus masquerading using iptables.=20
Specifically:

Step 1 -- Give my gateway an inside address (GW_INSIDE) and an outside
address (GW_OUTSIDE)

Step 2 -- Give an inside client, with ip CLIENT1_IP, a default router
of GW_INSIDE

Step 3 --  ip rule add from CLIENT_IP table CLIENT1 prio 100

(CLIENT1 is the name of a routing table added to /etc/iproute2/rt_tables)

Step 4 -- ip route replace default table CLIENT1 via DESIRED_GATEWAY

In this case DESIRED_GATEWAY is the IP of the gateway I want CLIENT1
to use -- one of the real internet routers that's on the same network
as GW_OUTSIDE.

This almost works, except that DESIRED_GATEWAY ends up receiving
packets that have CLIENT_IP as a source IP, and the gateway has never
heard of that network.  So as the final piece, add masquerading using
iptables:

Step 5 --  iptables -t nat -A POSTROUTING -o outside0 -j MASQUERADE

where outside0 is the name of the outside interface, i.e. the one with
GW_OUTSIDE and DESIRED_GATEWAY on it.

Thanks.

Jeremy

