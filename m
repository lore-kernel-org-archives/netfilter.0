From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 15:57:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207101457.g6AEvw812845@vulcan.rissington.net>
References: <001601c22819$406b6a30$0300a8c0@W2KP01> <200207101422.g6AEMi812683@vulcan.rissington.net> <273150000.1026311894@wookie.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <273150000.1026311894@wookie.shorewall.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Wednesday 10 July 2002 3:38 pm, Tom Eastep wrote:

> <Antony@Soft-Solutions.co.uk> wrote:
> > This one looks a bit odd to me, even though I've written it myself, but=
 I
> > think it should do the trick:
> >
> > $IPTABLES -t nat -A POSTROUTING -o $INTIF -i $INTIF -j MASQUERADE
>
> "-i" can't be used in the POSTROUTING hook.

Oh.   I knew you couldn't use -o in PREROUTING, because the routing hasn't =

been done yet, but I would have thought that POSTROUTING would remember whe=
re=20
the packet came in from ?

Ho Hum.

> > $IPTABLES -t nat -A POSTROUTING -o $INTIF -s a.b.c.d/n -j MASQUERADE
> >
> > where a.b.c.d/n is your internal network range.
>
> That's better -- since the internal interface usually has a static addres=
s,
> the following is preferable:
>
> $IPTABLES -t nat -A POSTROUTING -o $INTIF -s a.b.c.d/n -j SNAT --to-source
> $INTIP

Yes, agreed.   SNAT is much more efficient than MASQUERADE, on each packet =

going through the machine.

By the way, since I made my last posting on this, I noticed that Mark's=20
PREROUTING DNAT rule specified the input interface, which should be changed=
=20
to match the IP address instead, to enable translation of packets which com=
e=20
in from the other interface as well:

$IPTABLES -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j=A0DNAT --to =

192.168.0.3

where a.b.c.d is the ext IP of the firewall.

=20

Antony.

