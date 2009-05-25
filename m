From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something
	else?
Date: Mon, 25 May 2009 10:21:36 +0300
Message-ID: <1243236096.4888.3.camel@casper.meteor.dp.ua>
References: <4A19235F.4070306@opendreams.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A19235F.4070306@opendreams.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jesse Molina <jesse@opendreams.net>
Cc: netfilter@vger.kernel.org

=F7 =F7=D3=CB, 24/05/2009 =D7 03:37 -0700, Jesse Molina =D0=C9=DB=C5=D4=
:
> Hello
>=20
> I've googled all over and I don't really see an obvious answer to the=
=20
> question that I have.
>=20
> Here is my situation:  I have a GNU/Linux host performing very typica=
l=20
> firewall duties;  two interfaces, one with an Internet public IP and=20
> another interface on an RFC1918 net.  Hosts on the RFC1918 net have=20
> iptables SNATs to public IPs and then I filter to allow some services=
 in=20
> and others not, with stateful inspection in forwarding.
>=20
> Normally, in order to get the multiple public IPs for these SNAT'ed=20
> hosts to respond to arp requests from the firewall, I simply add them=
 as=20
> secondary IPs on the public interface of the firewall (eth0:1, eth0:2=
,...).
>=20
> The problem with this is that the firewall itself runs some services =
and=20
> they have the potential to use these secondary IPs as their ephemeral=
=20
> source addresses when they reach out to something on the Internet!=20
> That's bad, as those IPs should be exclusively used by only the hosts=
=20
> for which they were designed for.  Assume I have no control over the=20
> applications which bind to a local interface to use for their outboun=
d=20
> session traffic.

Did you try to explicitely SNAT localy generated traffic to the right
address? It seem a solution for your task. You can do this for all or
selectively by -m owner.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

