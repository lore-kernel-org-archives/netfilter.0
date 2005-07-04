From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 13:06:08 -0500
Message-ID: <200507041306.08626.rob0@gmx.co.uk>
References: <45219fb00507040715442f52cf@mail.gmail.com>
	<200507041133.35774.rob0@gmx.co.uk>
	<45219fb005070409543f229ddd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45219fb005070409543f229ddd@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: NetFilter <netfilter@lists.netfilter.org>

On Monday 04 July 2005 11:54, Llu=EDs Batlle wrote:
> Thanks :) I answer between lines...

Thank you.

> On 7/4/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
>  > >>=3D"masquerading.multi-eth" (misnamed: it does no masquerading)
>
> Ok. I tried with MASQUERADE, but by now I use SNAT.

Right. MASQUERADE will not work with multiple routing.

> > >>NE1=3D192.168.16.0/28
> > >>NE2=3D192.168.17.0/28
> >
> > Let's see, those are .0-.15 on the last quad.
> >
> > >>NLOCAL=3D192.168.0.0/20
> >
> > And this is 0.0 through 15.255 ... IOW, wrong, excluding both $NE1
> > and $NE2. Try 192.168.16.0/23. It would not hurt for you to brush
> > up on TCP/IP and subnetting basics.
>
> Oh. Is it wrong? I don't understand what's "IOW". Where should I try
> your proposed subnet? why?

IOW=3D"in other words", a common Internet shorthand.

192.168.0.0/20, set as $NLOCAL in your iptables script, excludes your
IP addresses and networks. No packet hitting the rules which refer to=20
that value will match, so the rules are ignored.

The rules to which I am referring:
$IPTABLES -t nat -A POSTROUTING -o eth1 -s $NLOCAL -j SNAT --to $IPE1
$IPTABLES -t nat -A POSTROUTING -o eth2 -s $NLOCAL -j SNAT --to $IPE2
Your SNAT rules.

Change "NLOCAL=3D192.168.0.0/20" to "NLOCAL=3D192.168.0.0/16", or as=20
previously suggested, "NLOCAL=3D192.168.16.0/23". I suppose you could=20
even omit the source specification altogether:
$IPTABLES -t nat -A POSTROUTING -o eth1 -j SNAT --to $IPE1
$IPTABLES -t nat -A POSTROUTING -o eth2 -j SNAT --to $IPE2

> > 1. IMO it's confusing to give chains the same name in different
> > tables.
>
> I agree... but by now does that matter?

Simply a point of style. You can give chains any names you wish, no=20
matter how confusing they might be in context:

###  Kids, don't try this at home. Professional stunt driver on a
###  closed track.
iptables -N InputLogDrop
iptables -N ForwardAllow
iptables -A InputLogDrop -j ACCEPT
iptables -A FORWARD -j InputLogDrop
iptables -A ForwardAllow -j LOG
iptables -A ForwardAllow -p tcp -j REJECT
iptables -A ForwardAllow -j DROP
iptables -A INPUT -j ForwardAllow
###  For my next trick, I will campaign to be elected Prime Minister.
###  Thank you for your support in the polls.

> > 3. --state in -t nat? Is that possible? Does it work? Does it break
> > anything?
>
> It seems it's possible. I get no error from those commands. Anyway,

Perhaps it doesn't break anything, but I have read here that only=20
packets of --state NEW hit the -t nat PREROUTING chain. I don't know=20
about the relationship between connection tracking and NAT.

> I've thought that happens double application of that rule, through
> filter and nat tables. I've removed everything about 'keep_state' in
> the nat table. Everything is still working bad. Even from the

Likely because of NLOCAL in your script. If that's not the case it's=20
beyond my limited understanding, and once again I'll suggest you take=20
it to LARTC. Some people in LARTC know more about this than I do.

> > already-NAT'ed Linux machine. Why not do the DNAT in the external
> > routers? Also, those DNAT rules refer to other RFC 1918 netblocks.
>
> mmm I've never read RFC 1918. :) I'll take a look at it.

"RFC 1918 netblocks" is simply another form of shorthand to refer to=20
IPv4 ranges which are reserved for private use, namely 10.0.0.0/8,=20
172.16.0.0/12, and 192.168.0.0/16. I rarely read RFC's myself (but I=20
must confess to a fondness for RFC 1149. :) )
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

