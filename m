From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: sub interface filtering
Date: Mon, 7 Apr 2003 09:48:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF50C7005@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: chenqunwei@yahoo.com, netfilter@lists.netfilter.org

http://lartc.org/

-----Original Message-----
From: Qunwei Chen [mailto:chenqunwei@yahoo.com]=20
Sent: Friday, April 04, 2003 5:31 PM
To: netfilter@lists.netfilter.org
Subject: Re: sub interface filtering

I tried the google for "Advanced Traffic and Routing Howto" but failed=20
to find it. Does anyone have the location of this document?

Thanks in advance,

Qunwei

Daniel Chemko wrote:

>The Advanced Traffic and Routing Howto had everything I needed. It can
>show you how to setup its IP settings etc.. If you want to integrate
>into IPTables, the following example shows how simply this can be
>accomplished.
>
>$ ip address list
>1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue=20
>    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>    inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
>2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
>    link/ether 11:11:11:11:11:11 brd ff:ff:ff:ff:ff:ff
>    inet 192.168.1.2/24 brd 192.168.1.255 scope global eth0
>    inet 192.168.1.111/32 scope global eth0
>3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
>    link/ether 11:11:11:11:11:11 brd ff:ff:ff:ff:ff:ff
>    inet 192.168.2.1/24 brd 192.168.1.255 scope global eth1
>
>You notice that there are 2 addresses on the same interface eth0. I
want
>to forward each IP address to a separate machine on a different subnet
>in this case, so I would do the following:
>
>iptables -t nat -A PREROUTING -j DNAT --destination 192.168.1.2 --to-
>destination 192.168.2.2
>
>iptables -t nat -A PREROUTING -j DNAT --destination 192.168.1.111 --to-
>destination 192.168.2.111
>
>You could have included "-i eth0" if you really wanted to, but unless
>you have the same IP address bolted to different interfaces, I don't
see
>that mattering much.=20
>
>
>-----Original Message-----
>From: Mike [mailto:mikeeo@msn.com]=20
>Sent: Wednesday, April 02, 2003 12:34 PM
>To: Daniel Chemko; netfilter@lists.netfilter.org
>Subject: Re: sub interface filtering
>
>I hate to ask but do you have and example of using iproute2 for IP
>address aliases?
>
>Thanks,
>Mike
>
>
> =20
>




