From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: question about port forwarding using dnat
Date: Thu, 07 Mar 2013 21:56:16 +0100
Message-ID: <5138FEF0.8070608@plouf.fr.eu.org>
References: <1362661333.71899.YahooMailClassic@web142706.mail.bf1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1362661333.71899.YahooMailClassic@web142706.mail.bf1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hamed Afshar <hamed_afshar@yahoo.com>
Cc: netfilter@vger.kernel.org

Hello,

Hamed Afshar a =E9crit :
> Hi,
> I need to manipulate all output requests for an IP range and change t=
he destination port.
> For a specific IP, the following rule works for me:
>=20
> iptables -t nat -A OUTPUT -p tcp -d 1.2.3.4 --dport 22 -j DNAT --to-d=
estination 1.2.3.4:555
>=20
> which is changing the destination port to 555 on all outgoing request=
s for port 22 for IP 1.2.3.4.
> But I need to apply this to an IP range.
> something like this:
>=20
> iptables -t nat -A OUTPUT -p tcp -d 1.2.3.0/24 --dport 22 -j DNAT --t=
o-destination 1.2.3.0/24:555
>=20
> to do the following:
> 1.2.3.1:22 =3D> 1.2.3.1:555
> 1.2.3.2:22 =3D> 1.2.3.2:555
> 1.2.3.3:22 =3D> 1.2.3.3:555
> etc
>=20
> iptables accepts IP range with "-d" switch. but as for "--to-destinat=
ion", it doesn't accept IP range.

Yes it does. The DNAT section in the iptables man page states :

 --to-destination [ipaddr][-ipaddr][:port[-port]]
        which can specify a single new destination IP address, an inclu=
-
        sive range of IP addresses, and optionally, a port range  (whic=
h
        is  only valid if the rule also specifies -p tcp or -p udp).

But address range do not act as a 1:1 mapping, rather as a round-robin
or random mapping.

> Does anyone have any idea how should I do this?

The man page gives the answer in the following lines :

        If
        no port range is specified, then the destination port will neve=
r
        be  modified. If no IP address is specified then only the desti=
-
        nation port will be modified.

