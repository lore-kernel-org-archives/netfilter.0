From: uniplex <uniplex@maximum-linux.net>
Subject: Re: question on rating SYN packets
Date: Sat, 08 Feb 2003 18:44:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E454FF0.4050803@maximum-linux.net>
References: <002b01c2cef4$74f9b860$3201a8c0@ESTACAO> <3E440D73.6010107@maximum-linux.net> <009501c2cfa7$95624a50$3201a8c0@ESTACAO>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Cc: netfilter ML <netfilter@lists.samba.org>

Leonardo Rodrigues Magalh=E3es wrote:
>     I already do limit of parallel connections. But I'd also like to li=
mit
> the number of NEW connections from EACH host.
>=20
>     Let's suppose I'll allow 10 parallel connections per host per port.=

> That's easy with iplimit. But I'd also like to limit 1 new connection p=
er
> second. So a single host wouldnt establish 10 new connections in 1 seco=
nd,
> for example. I'd like to allow 10 connections in parallel ( iplimit doe=
s
> this ) and 1 new connection per second PER host ( this I dont know how =
to
> do ).
>=20
>     Is this possible, somehow, with iptables ?
>=20
>     Sincerily,
>     Leonardo Rodrigues

iptables -N synlimit
iptables -A INPUT -i eth0 -p tcp --dport 80 -j synlimit
iptables -A synlimit -m recent --rcheck --seconds 1 --name onesec -j DROP=

iptables -A synlimit -m iplimit --iplimit-above 10 -j DROP
iptables -A synlimit -m recent --update --name onesec -j ACCEPT

I don't know if this would work, but it's my best guess.. gl.


