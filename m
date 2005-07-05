From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: Re: Problem with routing decisions, and multihop
Date: Tue, 5 Jul 2005 07:52:52 +0200
Message-ID: <45219fb00507042252343deced@mail.gmail.com>
References: <45219fb00507040715442f52cf@mail.gmail.com>
	<200507041133.35774.rob0@gmx.co.uk>
	<45219fb005070409543f229ddd@mail.gmail.com>
	<200507041306.08626.rob0@gmx.co.uk>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507041306.08626.rob0@gmx.co.uk>
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
To: netfilter@lists.netfilter.org

Again between lines...
On 7/4/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Monday 04 July 2005 11:54, Llu=EDs Batlle wrote:
> > > >>NE1=3D192.168.16.0/28
> > > >>NE2=3D192.168.17.0/28
> > >
> > > Let's see, those are .0-.15 on the last quad.
> > >
> > > >>NLOCAL=3D192.168.0.0/20
> > >
> > > And this is 0.0 through 15.255 ... IOW, wrong, excluding both $NE1
> > > and $NE2. Try 192.168.16.0/23. It would not hurt for you to brush
> > > up on TCP/IP and subnetting basics.
> >
> > Oh. Is it wrong? I don't understand what's "IOW". Where should I try
> > your proposed subnet? why?
>=20
> IOW=3D"in other words", a common Internet shorthand.
>=20
> 192.168.0.0/20, set as $NLOCAL in your iptables script, excludes your
> IP addresses and networks. No packet hitting the rules which refer to
> that value will match, so the rules are ignored.
Why? in the LAN (eth0, 192.168.0.0/20) there are many computers... if
I change it to 192.168.0.0/16, eth1 and eth2 _won't_ be appart
subnetworks! It's important to them to be excluded.
IOW, there must be no intersection between the networks of the different NI=
Cs.
>=20
> The rules to which I am referring:
> $IPTABLES -t nat -A POSTROUTING -o eth1 -s $NLOCAL -j SNAT --to $IPE1
> $IPTABLES -t nat -A POSTROUTING -o eth2 -s $NLOCAL -j SNAT --to $IPE2
> Your SNAT rules.
>=20
> Change "NLOCAL=3D192.168.0.0/20" to "NLOCAL=3D192.168.0.0/16", or as
> previously suggested, "NLOCAL=3D192.168.16.0/23". I suppose you could
> even omit the source specification altogether:
> $IPTABLES -t nat -A POSTROUTING -o eth1 -j SNAT --to $IPE1
> $IPTABLES -t nat -A POSTROUTING -o eth2 -j SNAT --to $IPE2
Will, that way, the kernel maintain connection-tables for SNAT even
for local connections?
> ###  Kids, don't try this at home. Professional stunt driver on a
> ###  closed track.
> iptables -N InputLogDrop
> iptables -N ForwardAllow
> iptables -A InputLogDrop -j ACCEPT
> iptables -A FORWARD -j InputLogDrop
> iptables -A ForwardAllow -j LOG
> iptables -A ForwardAllow -p tcp -j REJECT
> iptables -A ForwardAllow -j DROP
> iptables -A INPUT -j ForwardAllow
> ###  For my next trick, I will campaign to be elected Prime Minister.
> ###  Thank you for your support in the polls.
:)))
> Perhaps it doesn't break anything, but I have read here that only
> packets of --state NEW hit the -t nat PREROUTING chain. I don't know
> about the relationship between connection tracking and NAT.
Can you give a link about that?
>=20
> "RFC 1918 netblocks" is simply another form of shorthand to refer to
> IPv4 ranges which are reserved for private use, namely 10.0.0.0/8,
> 172.16.0.0/12, and 192.168.0.0/16. I rarely read RFC's myself (but I
> must confess to a fondness for RFC 1149. :) )
Hahaha :)

