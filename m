From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: lots of tcp port 445 traffic
Date: 09 Dec 2004 22:17:42 +0100
Message-ID: <1102622745.16437.6.camel@nostromo.bgsecm.com>
References: <41B48EB0.3030307@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B48EB0.3030307@phreaker.net>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 06 de 12 de 2004 a las 17:54, ro0ot escribi=C3=B3:
> Hi,
>=20
> I get lots of tcp port 445 traffic when I do a tcpdump -n port 445,=20
> could it be an attack?
>=20
> I check on the syslog files at /var/log/syslog, it shows this as below:=
 -
>=20
> Dec  7 00:36:40 fw01 kernel: Neighbour table overflow.
> Dec  7 00:36:46 fw01 kernel: NET: 32 messages suppressed.
> Dec  7 00:36:46 fw01 kernel: Neighbour table overflow.
> Dec  7 00:36:51 fw01 kernel: NET: 27 messages suppressed.
> Dec  7 00:36:51 fw01 kernel: Neighbour table overflow.
> Dec  7 00:38:14 fw01 kernel: NET: 6 messages suppressed.
> Dec  7 00:38:14 fw01 kernel: Neighbour table overflow.
>=20
> When I try to ping my router IP address, I get this message below: -
>=20
> connect: No buffer space available
>=20
> I did tried running the below command and it seems not helping much: -
>=20
> iptables -I cus2jarwan -p tcp --dport 445 -j REJECT --reject-with tcp-r=
eset
>=20
> or
>=20
> iptables -I cus2jarwan -p tcp --dport 445 -j DROP
>=20
> How can I stop this tcp port 445 traffic?  Or how can I prevent it?
>=20
> Regards,
> ro0ot
>=20

I also receive tons of this kind of traffic, like anyone else,
I suppose. The way you stop them it's correct, maybe you don't
have the rule in the correct chain, because it works ok for me.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


