From: uniplex <uniplex@maximum-linux.net>
Subject: Re: question on rating SYN packets
Date: Fri, 07 Feb 2003 19:48:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E440D73.6010107@maximum-linux.net>
References: <002b01c2cef4$74f9b860$3201a8c0@ESTACAO>
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
>     Hello Guys,
>=20
>     I'm trying to modify my script firewalls for not allowing a LOT of
> connections being established on a specific port in a very small period=
 of
> time. I know I could easily do this using a rule like:
>=20
> iptables -A INPUT -p tcp --dport XX -m state --state NEW -m limit --lim=
it
> Y/s -j ACCEPT
>=20
>=20
>     Altough, with this rule, I would be globally limiting connections f=
or
> that specific port in Y connections per second. I would like to know if=
 it's
> possible building a rule that would allow, for example, 1 SYN packet pe=
r
> second PER host. In this case, I wouldnt have a 'global' limit of SYN
> packets. In fact, I would have a SYN limitation for EACH host.
>=20
>     Question: is it possible for building a rule like this ? Is there a=
ny
> filter on patch-o-matic tree that would allow this kind of rule ?
>=20
>=20
>     Sincerily,
>     Leonardo Rodrigues
>     Solu=E7=F5es IP
>=20
>=20
>=20
>=20

this doesn't do rate limiting but it does limit the number of parallel=20
connections from any one IP address. This example limits parallel=20
connections to 10 per IP.

iptables -A INPUT -i eth0 -p tcp --syn --dport XX -m iplimit=20
-iplimit-above 10 -j DROP



