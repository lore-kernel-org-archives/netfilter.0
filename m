From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problem with forward and iptables
Date: Wed, 3 Jul 2002 17:20:33 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207031620.g63GKhU29698@vulcan.rissington.net>
References: <20020703155702.95481.qmail@web9904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020703155702.95481.qmail@web9904.mail.yahoo.com>
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
To: netfilter@lists.samba.org

On Wednesday 03 July 2002 4:57 pm, "J=F6rgen" Danielsson wrote:

> This is part of the rules
>
> $PROG  -t nat -A PREROUTING -p tcp -d ooo.ooo.*17.*54
> --dport 25 -j DNAT --to iii.iii.iii.*15:25

Any packets coming in to ooo.oo.*17.*54 TCP port 25 get destination=20
translated to iii.iii.iii.*15 port 25.

> $PROG -A FORWARD -p tcp -d iii.iii.iii.*15 --dport 25
> -j ACCEPT

Any packets for iii.iii.iii.*15 TCP port 25 are allowed through.

> $PROG -A INPUT -p tcp --destination ooo.ooo.*17.*54
> --destination-port 25 -j ACCEPT

I don't think you want this rule - you're not running a mail server on the =

Firewall, are you ?

> both ooo.ooo.ooo.ooo and iii.iii.iii.iii is real class
> c-net (even though iii.iii.iii.iii is being masqed),
> which mean no net is a 192.168.0.0/255.255.0.0 or
> 10.0.0.0/255.0.0.0 or 172.16.0.0/255.255.255.0

This means that ooo.ooo.ooo.ooo is routable across the Internet (and will g=
et=20
translated by your DNAT rule and sent on the iii.iii.iii.iii), and also=20
iii.iii.iii.iii is routable across the Internet, so when it arrives at the =

Firewall it will simply get forwarded through to the server with that addre=
ss.

> The problem:
>
> Telnet from the outside to ooo.ooo.*17.*54 : 25 does
> what its supposed to do, i get a reply from a smtp
> server. But then i noticed that iii.iii.iii.*15 : 25
> gives the same reply. How come ?

Hopefully the above explains why ?

> No other ip on the
> iii.iii.iii.iii net is reachable. Is the forward rule
> opening for access directly to the masqed ip ? and how
> do i stop that ?

Why do you want to stop it ?   If the mail server is accessible from the=20
outside (as ooo.ooo.*17.*54), then why are you bothered about it also being=
=20
accessible as iii.iii.iii.*15 ?   No-one can do any more damage to it on on=
e=20
IP than the other, so there's no loss of security here.

If you don't want its real IP address to be accessible from the outside, wh=
y=20
have you given it a routable IP address at all, instead of a private=20
10.0.0.0, 172.16.0.0 or 192.168.0.0 address ?

=20

Antony.

