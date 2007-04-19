From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT Issue
Date: Fri, 20 Apr 2007 00:24:07 +0200
Message-ID: <4627EC07.5040207@plouf.fr.eu.org>
References: <46273FCA.4020200@embeddedinfotech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46273FCA.4020200@embeddedinfotech.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Kiran Murari a =E9crit :
>=20
> My setup is as shown below.
> PC--------Router---------ISP
>=20
> I established a connection with the ISP (PPP link) and I am pinging=20
> google.com from LAN side host.
> Now if I disable WAN

What do you mean exactly ?

> (leave the ping running) and then enable it, the=20
> session does not resume.

What session ?

> The SNAT rules are in place.
> # iptables -t nat -L POSTROUTING -n -v
> Chain POSTROUTING (policy ACCEPT 13927 packets, 458K bytes)
> pkts bytes target     prot opt in     out      source           destina=
tion
>    0     0   SNAT     all  --  *      ppp0     0.0.0.0/0       =20
> 0.0.0.0/0      to:xx:xx:xx:xx

Is the public address fixed or can it change at each PPP connection ?

> # cat /proc/net/ip_conntrack | grep icmp
> icmp     1 29 src=3Dyy:yy:yy:yy dst=3D64.233.167.99 type=3D8 code=3D0 i=
d=3D16446=20
> packets=3D575 bytes=3D48300 [UNREPLIED]
> src=3Dyy:yy:yy:yy dst=3D192.168.10.100 type=3D0 code=3D0 id=3D16446 pac=
kets=3D0=20
> bytes=3D0 mark=3D0 use=3D1
> yy:yy:yy:yy being the IP address of the LAN host.

I doubt that the source address of the expected reply is the LAN host=20
address. What is 192.168.10.100 ?

