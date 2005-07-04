From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: Re: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 18:54:50 +0200
Message-ID: <45219fb005070409543f229ddd@mail.gmail.com>
References: <45219fb00507040715442f52cf@mail.gmail.com>
	<45219fb005070408323197bfa4@mail.gmail.com>
	<45219fb0050704083253774af5@mail.gmail.com>
	<200507041133.35774.rob0@gmx.co.uk>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507041133.35774.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org

Thanks :) I answer between lines...

On 7/4/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
 > >>=3D"masquerading.multi-eth" (misnamed: it does no masquerading)
Ok. I tried with MASQUERADE, but by now I use SNAT.
>=20
> >>NE1=3D192.168.16.0/28
> >>NE2=3D192.168.17.0/28
>=20
> Let's see, those are .0-.15 on the last quad.
>=20
> >>NLOCAL=3D192.168.0.0/20
>=20
> And this is 0.0 through 15.255 ... IOW, wrong, excluding both $NE1 and
> $NE2. Try 192.168.16.0/23. It would not hurt for you to brush up on
> TCP/IP and subnetting basics.

Oh. Is it wrong? I don't understand what's "IOW". Where should I try
your proposed subnet? why?

>=20
> >> $IPTABLES -t nat -F PREROUTING
> >> $IPTABLES -t nat -F POSTROUTING
> >> $IPTABLES -t nat -F OUTPUT
> >> $IPTABLES -t filter -F INPUT
> >> $IPTABLES -t filter -F FORWARD
> >> $IPTABLES -t filter -F OUTPUT
> >> $IPTABLES -t filter -F keep_state >&/dev/null
> >> $IPTABLES -t filter -X keep_state >&/dev/null
> >> $IPTABLES -t nat -F keep_state >&/dev/null
> >> $IPTABLES -t nat -X keep_state >&/dev/null
>=20
> Could be rewritten as:
> iptables -F ; iptables -X ; iptables -t nat -F ; iptables -t nat -X
Ok :)

>=20
> >> $IPTABLES -t filter -N keep_state
> >> $IPTABLES -t filter -A keep_state -m state \
> >> --state RELATED,ESTABLISHED -j ACCEPT
> >> $IPTABLES -t filter -A keep_state -j RETURN
> >>
> >> $IPTABLES -t nat -N keep_state
> >> $IPTABLES -t nat -A keep_state -m state \
> >> --state RELATED,ESTABLISHED -j ACCEPT
> >> $IPTABLES -t nat -A keep_state -j RETURN
>=20
> 1. IMO it's confusing to give chains the same name in different tables.
I agree... but by now does that matter?
> 2. The RETURN rules are pointless. That's what happens at the end of a
> chain, anyway.
Ok. That's what I thought
> 3. --state in -t nat? Is that possible? Does it work? Does it break
> anything?

It seems it's possible. I get no error from those commands. Anyway,
I've thought that happens double application of that rule, through
filter and nat tables. I've removed everything about 'keep_state' in
the nat table. Everything is still working bad. Even from the computer
itself (local processes). Routing doesn't work, even without any
"NAT"-related chain/rule.

>=20
> > About the 16.x and 17.x addresses... yes, there are other routers,
> > which make NAT (192.168.16.2 and 192.168.17.2) to internet.
>=20
> This seems odd to me. I prefer to use external IP directly, for many
> reasons. It also eliminates other potential points of failure.
I agree :) but it's hard for me to configure the routers, so they give
to me the public addresses. I think that double-NAT should not break
anything. :)
>=20
> It's even more odd considering that you're doing DNAT on the already-
> NAT'ed Linux machine. Why not do the DNAT in the external routers?
> Also, those DNAT rules refer to other RFC 1918 netblocks.
mmm I've never read RFC 1918. :) I'll take a look at it.
Thanks!

- I finish the working time in few minutes. Tomorrow morning I'll keep
on with this.

