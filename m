From: Miguel Angel Amador L <amador@puc.cl>
Subject: Re: Max Concurrent Session
Date: Wed, 15 Dec 2004 17:33:38 -0300
Message-ID: <1103142818.4123.7.camel@JOKER.INFOWORLD.CL>
References: <1102705899.4516.50.camel@JOKER.INFOWORLD.CL>
	<074d01c4e2b9$a90aa210$b000a8c0@cybergeneration.com>
Reply-To: amador@puc.cl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <074d01c4e2b9$a90aa210$b000a8c0@cybergeneration.com>
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
To: Maxime Ducharme <mducharme@cybergeneration.com>
Cc: NetFilter Users <netfilter@lists.netfilter.org>

El mi=C3=A9, 15-12-2004 a las 12:20, Maxime Ducharme escribi=C3=B3:
> Hi Miguel
>     we run iptables 1.2.9 on a Dell PowerEdge 750.
>=20
> It protects 128 IPs adresses which host many Internet
> services (www, mail, ftp, ssl, ssh, ...).
>=20
> Current connections are above 2000 :
> [root@Cerberux root]# cat /proc/net/ip_conntrack |wc -l
>    2168
>=20
> Current load :
> [root@Cerberux root]# uptime
>  10:10:24  up 156 days, 21:54,  1 user,  load average: 0.00, 0.00, 0.00
>=20
> About 250 mos of RAM is used.
>=20
> Maximum connections is set here :
> [root@Cerberux root]# cat /proc/sys/net/ipv4/ip_conntrack_max
> 16368
>=20
>=20
> This value may be set higher but ensure you have enough RAM.
>=20
> The higher value I ever seen is 5000 (happens when many worms
> scan our network concurrently), and we didnt noticed any network
> slowdown.
>=20
> Have a nice day
>=20
> Maxime Ducharme
> Programmeur / Sp=C3=A9cialiste en s=C3=A9curit=C3=A9 r=C3=A9seau
>=20
> ----- Original Message -----=20
> From: "Miguel Angel Amador L" <amador@puc.cl>
> To: "NetFilter Users" <netfilter@lists.netfilter.org>
> Sent: Friday, December 10, 2004 2:11 PM
> Subject: Max Concurrent Session
[... Mi last comments...]

Thanks, I needed another opinion and  I am secure now.

(PD:Is because some comercial firewall have limits for concurrent
session , and I needed compare this )

__
Miguel Angel Amador L         =20
  fono: +562  204 8611 #231
  fax:    +562  204 8603
e-mail: miguel.amador@infoworld.cl



