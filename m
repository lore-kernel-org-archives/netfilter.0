From: Guido Lorenzutti <guido@lorenzutti.com.ar>
Subject: Re: Firewall problem
Date: Wed, 15 Jun 2005 00:48:11 -0300
Message-ID: <42AFA4FB.90408@lorenzutti.com.ar>
References: <20050615031424.30876.qmail@web30602.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050615031424.30876.qmail@web30602.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Mohamed Nassih <nassih50@yahoo.com>, netfilter@lists.netfilter.org

Mohamed Nassih wrote:
> Hi,
> =20
>  I have this firewall script, the problem is that I can not connect to th=
e webserver (123.45.67.2) from the local network (192.168.1.0).
> =20
> Please help.

maybe if you...

echo 1 > /proc/sys/net/ipv4/ip_forward

and not

echo 1 > /proc/sys/net(((( ))))/ipv4/ip_forward

> =20
> echo 1 > /proc/sys/net /ipv4/ip_forward
> IPTABLES -F INPUT=20
> IPTABLES -F OUTPUT=20
> IPTABLES -F FORWARD

you could...

iptables -F instead of the three rules from above...

> IPTABLES -P INPUT DROP=20
> IPTABLES -P OUTPUT DROP=20
> IPTABLES -P FORWARD DROP=20
> Iptables =96A INPUT  -i lo =96j ACCEPT
> Iptables =96A OUTPUT  -o lo =96j ACCEPT
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
> iptables -A FORWARD -i eth1 -p tcp -d 123.45.67.2 --destination-port 80=20
> =96m state --state NEW,ESTABLISHED  -j ACCEPT
> iptables -A FORWARD =96p tcp -i eth0 =96-source-port 80 =96m state --stat=
e=20
> ESTABLISHED -j ACCEPT
>=20


It would be more readable if you....

iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 80 -d 123.45.67.2 -m=20
state --state NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp --sport 80 -s 123.45.67.2 -m=20
state --state ESTABLISHED -j ACCEPT

Check if eth0 =3D wan and eth1 =3D lan.




PD: sorry for my english, i never study.

