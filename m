From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: howto stop this packet
Date: 14 Jan 2005 22:38:30 +0100
Message-ID: <1105729040.25584.66.camel@nostromo.bgsecm.com>
References: <20050114052219.9CEDF73D@smtp-01.piensasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114052219.9CEDF73D@smtp-01.piensasolutions.com>
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

El vie, 14 de 01 de 2005 a las 06:22, jqb@markor.net escribi=C3=B3:
> netfilter=EF=BC=81
>     howto stop this packet on iptables firewall;
> tcpdump capture packet example:
> 10:35:31.881722 IP 218.6.45.6.51755 > 228.71.74.201.7777: S 1432831257:=
1432831257(0) win 16384 <mss 1460,nop,nop,sackOK>
>=20
> 10:35:36.214120 IP 219.147.192.18.1272 > 228.71.74.201.7777: S 490321:4=
90321(0) win 6400 <mss 1460,nop,nop,sackOK>

You can stop them with the destination port: 7777

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


