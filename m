From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: cbq.init and iptables NAT routing
Date: 04 Oct 2002 02:30:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033691456.3545.22.camel@elendil>
References: <Pine.LNX.4.33.0210031314220.27868-100000@ts1.alberni.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0210031314220.27868-100000@ts1.alberni.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Aaron Clausen <maureen-taocow@alberni.net>
Cc: netfilter@lists.netfilter.org

I checked the code, and discovered I was wrong. Shaping is done _after_
Netfilter, i.e. after POSTROUTING chain.

I just tried this :

RULE=3D192.168.10.1/32

I ping 192.168.10.1 and stats are growing, so it matches.
Then, I'll DNAT in OUTPUT 192.168.10.1 to 192.168.10.12

iptables -t nat -A OUTPUT -d 192.168.10.1 -j DNAT --to 192.168.10.12

It does not match anymore =3D> DNAT is done _before_ shaping.

No I flush

iptables -t nat -F

then set

RULE=3D192.168.10.11/32,

I ping 192.168.10.1, and counters are growing. It matches. Then I set
SNAT :

iptables -t nat -A POSTROUTING -d 192.168.10.1 -j SNAT --to 192.168.10.2
ip addr add 192.168.10.2 dev eth0

So I use 192.168.10.2 to emit py pings. And my class is no more reached
=3D> SNAT is done _before_ shaping also...

If I set :

RULE=3D192.168.10.2/32,

Class is reached again. So I was wrong... Sorry.

To answer your message :

Le jeu 03/10/2002 =E0 22:15, Aaron Clausen a =E9crit :
> iptables -t nat -A PREROUTING -i eth0 -d 64.251.69.2 -j DNAT --to 10.10=
2.106.2

eth0 : RULE=3D64.251.69.2,
eth1 : RULE=3D10.102.106.2

> iptables -t nat -A POSTROUTING -o eth0 -s 10.102.106.2 -j SNAT --to 64.=
251.69.2

eth0 : RULE=3D64.251.69.2,
eth1 : RULE=3D10.102.106.2

[...]

> iptables -t nat -A POSTROUTING -o eth0 -s 10.101.104.0/21 -j MASQUERADE

eth0 : RULE=3D<eth0_IP>,
eth1 : RULE=3D10.101.104.0/21

Hope this will help you at last, and sorry again for the mistake. Going
to bed now, seems to be high time ;)

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

