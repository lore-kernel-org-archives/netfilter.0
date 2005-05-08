From: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Subject: Re: How to masquerade when using ROUTE
Date: Sun, 8 May 2005 11:55:33 -0300
Message-ID: <f48e768e05050807559b74d35@mail.gmail.com>
References: <427D52FA.8020805@fabian-wolter.de>
Reply-To: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427D52FA.8020805@fabian-wolter.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Fabian Wolter <netfilter-ml@fabian-wolter.de>, netfilter@lists.netfilter.org

take a look in  iproute2,

lartc.org  , using  iptables and iproute to do it=20

1) create an entry in /etc/iproute2/rt_tables

echo "200            fabian

2) create the route default to route fabian
ip route add default via x.x.x.x dev ethX table fabian

3) create the rules=20

iptables -t mangle -A PREROUTING -p tcp --dport 25 -j MARK --set-mark 3

4) routing the packets=20

ip rule add from fwmark 3 lookup fabian prio 1


be happy=20



On 5/7/05, Fabian Wolter <netfilter-ml@fabian-wolter.de> wrote:
> Hi,
>=20
> I want to route all outgoing port-25-traffic produced by the clients
> over ppp1. The rest schould take the default route over ppp0.
>=20
> I used the following command:
>=20
> iptables -A PREROUTING -p tcp --dport 25 -t mangle -i eth0 -j ROUTE
> --oif ppp1
>=20
> But the source addresses of the packets are wrong as "tcpdump -ni ppp1"
> shows:
>=20
> 01:20:24.422756 IP 192.168.0.4.32825 > 160.45.10.13.25: S
> 2020082843:2020082843(0) win 5840 <mss 1460,sackOK,timestamp 266850[|tcp]=
>
>=20
> 192.168.0.4 is the IP adress of the client which tried to connect to the
> mailserver 160.45.10.13.25.
>=20
> Masquarding is done to 192.168.0.0/24:
>=20
> # iptables -t nat -L POSTROUTING
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> MASQUERADE  all  --  192.168.0.0/24       anywhere
>=20
> My default route is set to ppp0.
>=20
> So, how can I replace/masquerade the 192.168.0.4 by the official IP
> address of ppp1?
>=20
> Regards,
> Fabian
>=20
>=20


--=20
Glaucius Djalma Pereira Junior
glaucius@gmail.com

