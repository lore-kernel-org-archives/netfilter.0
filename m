From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables -j REDIRECT
Date: Wed, 07 Jul 2004 16:57:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089212276.3299.19.camel@anduril.intranet.cartel-securite.net>
References: <1276578354.20040706010841@dinfo.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1276578354.20040706010841@dinfo.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: =?koi8-r?Q?=F3=C5=D2=C7=C5=C5=D7_?= =?koi8-r?Q?=F3=C5=D2=C7=C5=CA_?= =?koi8-r?Q?=EE=C9=CB=CF=CC=C1=C5=D7=C9=DE?= <serg@dinfo.ru>
Cc: netfilter@lists.netfilter.org

Le lun 05/07/2004 =C3=A0 23:08, =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B5=D0=B2=
 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 =D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B0=
=D0=B5=D0=B2=D0=B8=D1=87 a =C3=A9crit :
> how can I manage packets incoming from 80 port to my LAN?
> All chains and tables(OUTPUT:mangle,nat,filter and
> POSTROUTING:mangle,nat) shows that one go from
> local_ip_of_gateway:3128.
> But tcpdump started at LAN interface shows that packets go from real
> ip addresses and src_port 80....
> In what chain and table netfilter replaces SRC_ip & SRC_port back by
> real?

After POSTROUTING, so you are not able to match them. But what you can
do is use CONNMARK target and connmark match to spot thoses connections.

Something like :

	iptables -A PREROUTING -t mangle -i LAN -p tcp --dport 80 \
		-j CONNMARK --set-mark 0x01

Now, every packet that belongs to a connection beginning by one of
theses packets will get connmarked with 0x01. To match them back, use
connmark match like this :

	-m connmark --mark 0x01

Hope it will help.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

