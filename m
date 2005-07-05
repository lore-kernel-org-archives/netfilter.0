From: Askar <askarali@gmail.com>
Subject: Re: mangle squid packets
Date: Tue, 5 Jul 2005 23:18:16 +0500
Message-ID: <a0f69e5050705111820d01eb5@mail.gmail.com>
References: <42C5A815.8040301@lanhelp.com.br>
	<Pine.LNX.4.61.0507051347060.28524@yvahk01.tjqt.qr>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507051347060.28524@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Before marking squid packets you have to define route with "ip"
iproute2 command more info could be find on www.lartc.org , below is
an example of iproute + iptables for your firewall machine.

echo 112 squid.out >> /etc/iproute2/rt_tables
ip rule add fwmark 3 table squid.out
ip route add default via xxx.xxx.xxx.xx dev eth0 table squid.out=20
ip route flush cache

# repacle xxx.xxx.xx with squid server ip
#####
here is iptables part

iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 80 -j MARK --set-ma=
rk 3


regards

Askar
hope this would helps


On 7/5/05, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>=20
> >I dont know what mangle rule I need to mark squid transparent packets, I
> >have tried all the following (One at a time):
>=20
> Because Squid practically starts a new connection, you need special help
> from squid itself to mark outgoing packets based on incoming ones.
>=20
> This is done by TPROXY, a netfilter module from Balabit.com.
> Unfortunately, they do not have a version for 2.6.11 and up yet.
>=20
>=20
>=20
> Jan Engelhardt
> --
> | Alphagate Systems, http://alphagate.hopto.org/
>=20
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

