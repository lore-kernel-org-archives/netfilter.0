From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Port forwarding problem...
Date: Tue, 11 Feb 2003 20:14:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002601c2d201$c163d220$0401000a@robbysan.org>
References: <001601c2d1fa$669894e0$990da8c0@..153.service>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c2d1fa$669894e0$990da8c0@..153.service>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> internet=20
> <------>(eth0)[web,smtp,pop3,ftp](eth1)<------>LAN(192.168.13.0/24)
>=20
> i have only one "real" IP on eth0.
>=20
> can you tell me how can i use something like :
>=20
> http://www.myserver.xxx:33333 to redirect to .. let's say
192.168.13.147:80 ??
>=20

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -d 192.168.13.147 -j ACCEPT

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 3333 -j DNAT
--to-destination 192.168.13.147:80

> the main problem that i see here is that on port 33333 i have no
services running.

If port forwarding doesn't work, you don't see a service running on the
port.
OTOH if portforwarding works but the service isn't running, the port
isn't open on <inet_ip> either.


Gr,
Rob


