From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: Re: problem with forward and iptables (added one more prob in here)
Date: Wed, 3 Jul 2002 09:39:07 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703163907.99011.qmail@web9904.mail.yahoo.com>
References: <200207031620.g63GKhU29698@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207031620.g63GKhU29698@vulcan.rissington.net>
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
Content-Transfer-Encoding: quoted-printable
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Thanks for the reply

I asked the company earlier why they don't put it on
the 172 net they have aswell, the explanation will be
abit too long to get here, but the answer is that they
must have a real c-net behind the firewall since they
are connected to another net aswell that requires real
ips (short version).

And they don't want the iii.iii.iii.iii net to be
accessible from the outside, thats why i am stuck.

Checking a little more and we hava similair rule for
port 80 and 443, and just noticed that other hosts on
the iii.iii.iii.iii net is now accessible from the
outside on port 80, not just iii.iii.iii.*15, even
though i added the destination part for that one
aswell, isn't that even more weird.


--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Wednesday 03 July 2002 4:57 pm, "J=F6rgen"
> Danielsson wrote:
>=20
> > This is part of the rules
> >
> > $PROG  -t nat -A PREROUTING -p tcp -d
> ooo.ooo.*17.*54
> > --dport 25 -j DNAT --to iii.iii.iii.*15:25
>=20
> Any packets coming in to ooo.oo.*17.*54 TCP port 25
> get destination=20
> translated to iii.iii.iii.*15 port 25.
>=20
> > $PROG -A FORWARD -p tcp -d iii.iii.iii.*15 --dport
> 25
> > -j ACCEPT
>=20
> Any packets for iii.iii.iii.*15 TCP port 25 are
> allowed through.
>=20
> > $PROG -A INPUT -p tcp --destination
> ooo.ooo.*17.*54
> > --destination-port 25 -j ACCEPT
>=20
> I don't think you want this rule - you're not
> running a mail server on the=20
> Firewall, are you ?
>=20
> > both ooo.ooo.ooo.ooo and iii.iii.iii.iii is real
> class
> > c-net (even though iii.iii.iii.iii is being
> masqed),
> > which mean no net is a 192.168.0.0/255.255.0.0 or
> > 10.0.0.0/255.0.0.0 or 172.16.0.0/255.255.255.0
>=20
> This means that ooo.ooo.ooo.ooo is routable across
> the Internet (and will get=20
> translated by your DNAT rule and sent on the
> iii.iii.iii.iii), and also=20
> iii.iii.iii.iii is routable across the Internet, so
> when it arrives at the=20
> Firewall it will simply get forwarded through to the
> server with that address.
>=20
> > The problem:
> >
> > Telnet from the outside to ooo.ooo.*17.*54 : 25
> does
> > what its supposed to do, i get a reply from a smtp
> > server. But then i noticed that iii.iii.iii.*15 :
> 25
> > gives the same reply. How come ?
>=20
> Hopefully the above explains why ?
>=20
> > No other ip on the
> > iii.iii.iii.iii net is reachable. Is the forward
> rule
> > opening for access directly to the masqed ip ? and
> how
> > do i stop that ?
>=20
> Why do you want to stop it ?   If the mail server is
> accessible from the=20
> outside (as ooo.ooo.*17.*54), then why are you
> bothered about it also being=20
> accessible as iii.iii.iii.*15 ?   No-one can do any
> more damage to it on one=20
> IP than the other, so there's no loss of security
> here.
>=20
> If you don't want its real IP address to be
> accessible from the outside, why=20
> have you given it a routable IP address at all,
> instead of a private=20
> 10.0.0.0, 172.16.0.0 or 192.168.0.0 address ?
>=20
> =20
>=20
> Antony.
>=20


__________________________________________________
Do You Yahoo!?
Sign up for SBC Yahoo! Dial - First Month Free
http://sbc.yahoo.com

