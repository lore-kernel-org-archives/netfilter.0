From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: nmap protection rules
Date: 01 Jan 2005 23:08:25 +0100
Message-ID: <1104616912.18651.4.camel@nostromo.bgsecm.com>
References: <41D2F4DE.11586.29F761B5@localhost>
	<1104409107.2011.119.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104409107.2011.119.camel@grendel>
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
To: netfilter <netfilter@lists.netfilter.org>

El jue, 30 de 12 de 2004 a las 13:18, Chris Brenton escribi=C3=B3:
> On Wed, 2004-12-29 at 18:18, Jorge Agrelo wrote:
> > Does anyone can help me to write iptables rules to?:
> >=20
> > * block IP protocol scans (nmap -sO)
>=20
> When performing a protocol scan, nmap sends an IP packet with no
> transport header. So for example to check for AH support, byte 9 in the
> IP header is set to "51" but no AH header is included in the packet. Th=
e
> concept is a system which supports AH will ignore the packet and not
> respond. A system that does not support AH will return an ICMP type 3
> code 2 (protocol unreachable).
>=20
> So, provided your iptables default policy is "deny all", you should be
> fine.
>=20

Unless someone does a completely normal connection to maybe port
80 of your server and uses something like p0f. That's much more
effective that the nmap -s0 command. I agree with all the rest.

I also use this rules to drop some kind of strange tcp flags that
indicates you are having a portscan:

iptables -A PORTSCANDROPLAN -o ppp0 -p tcp --tcp-flags ALL FIN,URG,PSH
-j DROP
ptables -A PORTSCANDROPLAN -o ppp0 -p tcp --tcp-flags SYN,RST SYN,RST -j
DROP
iptables -A PORTSCANDROPLAN -o ppp0 -p tcp --tcp-flags SYN,FIN SYN,FIN
-j DROP
iptables -A PORTSCANDROPLAN -o ppp0 -p tcp --tcp-flags ALL FIN -j DROP
iptables -A PORTSCANDROPLAN -o ppp0 -p tcp --tcp-flags ALL ALL -j DROP

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


