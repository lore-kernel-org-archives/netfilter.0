From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 17:33:14 +0200
Message-ID: <4A5CA53A.40703@plouf.fr.eu.org>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>	 <1247494451.25529.52.camel@enterprise.ims-firmen.de> <1247558286.7214.16.camel@TestField.intranet.bem.md>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1247558286.7214.16.camel@TestField.intranet.bem.md>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Simion Onea a =E9crit :
>=20
> I tried these rules but it seems that packets to not pass the first
> rule. To test this I put two LOG targets before and after the PREROUT=
ING
> rule like this:
>=20
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 -j LOG
> --log-tcp-options --log-prefix PREROUTING_before:
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 -j DNAT
> --to-destination 172.20.1.254:25
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j LOG
> --log-tcp-options --log-prefix PREROUTING_after:
> iptables -t nat -A POSTROUTING -o eth0 -p tcp -d 172.20.1.254 --dport=
 25
> -j SNAT --to-source 172.20.1.245
>=20
> As a result I received in the log three messages with
> "PREROUTING_before" -- these were SYN packets. And no message with
> "PREROUTING_after" :-(
>=20
> What could be wrong ?

man iptables
DNAT is a terminal target, so after a match the next rules in the chain=
=20
are not examined.


