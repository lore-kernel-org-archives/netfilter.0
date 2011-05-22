From: netfilter@buglecreek.com
Subject: Re: FORWARD chain and Interfaces
Date: Sun, 22 May 2011 13:06:47 -0600
Message-ID: <1306091207.21990.1454736533@webmail.messagingengine.com>
References: <1305958205.10779.1454356989@webmail.messagingengine.com>
 <4DD7A0C5.1040200@plouf.fr.eu.org>
 <1306007342.28169.1454496985@webmail.messagingengine.com>
 <4DD825EB.2080300@plouf.fr.eu.org>
 <1306014018.28595.1454519185@webmail.messagingengine.com>
 <4DD83726.5090604@plouf.fr.eu.org>
 <1306017077.11298.1454526649@webmail.messagingengine.com>
 <4DD8CDE8.505@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:cc:mime-version:content-transfer-encoding:content-type:in-reply-to:references:subject:date; s=smtpout; bh=LdiDr3wyRx+Uqk7yOna1q/EBf/A=; b=tfEP3xqvrbSNJsqyo/ipcx4xEvHgPqb1VD1q1Vlta58oEk5Ah4An1uD+X4pd43fx1jyObf1ZlVTk5DcnbizzVwNdn2XZXikL+PZ8P+vmdzsjBAMmWArfBHKFznlOF16hjkll+H48J39OCHpfhJc3PJlroHbq1KXTzRSlZzdEoBI=
In-Reply-To: <4DD8CDE8.505@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter <netfilter@vger.kernel.org>


On Sun, 22 May 2011 10:48 +0200, "Pascal Hambourg"
<pascal.mail@plouf.fr.eu.org> wrote:
> netfilter@buglecreek.com a =E9crit :
> > On Sun, 22 May 2011 00:05 +0200, "Pascal Hambourg"
> >>
> >> How then do you know which interface of the router is connected to=
 which
> >> network ?
> >=20
> > I'm basing the router connections to the various networks by the IP
> > addresses and network Addresses.
>=20
> That is not enough. The virtualization system (Parallels for you) dea=
ls
> only with the link (ethernet) layer, not the IP layer. You can set up
> multiple IP subnets on the same link but they are not isolated.
>=20
> > Sending a broadcast packet (good idea) from network B I see the pac=
ket
> > show up at network A machine and on both interfaces of the firewall=
=2E  I
> > even see the packets show up on network A when the firewall/router =
is
> > turned off.
>=20
> So all interfaces are connected to the same link, just as I thought.
>=20
> > Both Net A and Net B are assigned IPs on two entirely
> > different networks.  Obviously, this is not the expected behavior.
>=20
> It is expected behaviour when all interfaces are connected to the sam=
e
> link. Think as if all interfaces are connected to the same switch and
> you didn't define separate VLANs.
>=20
> Ideally you need to set up two separate virtual links and define whic=
h
> interface is connected to which link. Other options include :
>=20
> a) Use tagged VLAN interfaces (see vconfig). This requires only one
> ethernet interface on the router. E.g. :
> VLAN 1 for network A, machines use eth0.1
> VLAN 2 for network B, machines use eth0.2
>=20
> b) Set /proc/sys/net/ipv4/all/arp_ignore to 1 on the router so each
> interface replies only to ARP requests for its own address. This way =
the
> other machines will send packets only to the correct interface.
>=20
> Note that these options do not provide the same level of security as
> separate links.
>=20

Good information.  I only use virtualization on a intermittent basis an=
d
then only to test various things when I am not able to use other means.=
=20
Normally what you describe above is not a big issue since I'm usually
not trying to route packets between virtual machines.  I'll look at som=
e
of the solutions you outline above for future test scenarios.=20
Appreciate the help figuring out why I was seeing the "strange"
behavior.
