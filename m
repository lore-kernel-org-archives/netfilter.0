From: Julien Vehent <julien@linuxwall.info>
Subject: Re: tc and traffic established,related
Date: Tue, 21 Jul 2009 17:48:05 +0200
Message-ID: <81f25297b8a23e5779e4d983332f41bc@localhost>
References: <4A65DB14.2000602@duet.it> <4A65DC4D.1030402@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65DC4D.1030402@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Tue, 21 Jul 2009 17:18:37 +0200, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>=20
> Fabio Marcone a =C3=A9crit :
>>=20
>> I have a linux router and I mark packets from lan to wan and I use a=
 tc=20
>> class to limit datarate (selecting packets by mark).
>> but how can I recognize answer packets? How can I know is a packet i=
s=20
>> about a connection previously established?
>=20
> See the CONNMARK target and the connmark match.
>=20
>=20

When you mark a packet, you can propagate this mark to the connexion th=
e
packet is from using the rule:

iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark

And then, the mark will appear in /proc/net/ip_conntrack and all the
packets of this connexion will be marked.

--=20
julien
http://jve.linuxwall.info/blog

