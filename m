From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables and iproute
Date: Mon, 26 Apr 2004 10:59:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082969954.1794.35.camel@anduril.intranet.cartel-securite.net>
References: <1082964013.1772.14.camel@Toshiba.Toshiba>
	 <1082965885.1794.1.camel@anduril.intranet.cartel-securite.net>
	 <1082966886.1772.18.camel@Toshiba.Toshiba>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082966886.1772.18.camel@Toshiba.Toshiba>
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
To: Antonio Alvarez <aramirez@teneinformatica.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Le lun 26/04/2004 =E0 10:08, Antonio Alvarez a =E9crit :
> > You can mangle them in OUTPUT chain...
> Uhm.... not sure. you can mangle the packet but when the packet go
> output the packet was routed :-(

Not quite, there's a second round for altered packets ;)
One routing process is called for packet building, in order to determine
to which interface it will get sent, and so source address given. If
packet is altered in OUTPUT chain, then it will get routed again so it
keeps consistant with routing table.

What I've just tested :

root@anduril:~# echo 200 test >> /etc/iproute2/rt_tables
root@anduril:~# ip rule add fwmark 2 table test
root@anduril:~# ip route add default via 192.168.1.123 dev eth1 \
			table test
root@anduril:~# ip route flush cache

Then for Netfilter :

root@anduril:~# iptables -t nat -A OUTPUT -d 192.168.11.0/24 \
			-j MARK --set-mark 2

My configuration is eth0 to usual network with default route, and eth1
to 192.168.1.1/24. If I ping 192.168.11.1, packets are rerouted to new
gateway, using correct interface :

root@anduril:~# tcpdump -i eth1
tcpdump: listening on eth1
10:50:21.917025 192.168.2.45 > 192.168.11.1: icmp: echo request (DF)
10:50:22.916930 192.168.2.45 > 192.168.11.1: icmp: echo request (DF)
10:50:23.916850 192.168.2.45 > 192.168.11.1: icmp: echo request (DF)
10:50:24.916769 192.168.2.45 > 192.168.11.1: icmp: echo request (DF)

So things are OK, except for source address that is eth0's one. So, I
just have to add a SNAT rule to make things OK :

root@anduril:~# iptables -t nat -A POSTROUTING -o eth1 \
			-j SNAT --to 192.168.1.1

And then :

root@anduril:~# tcpdump -i eth1
tcpdump: listening on eth1
10:58:09.046686 192.168.1.1 > 192.168.11.2: icmp: echo request (DF)
10:58:10.045704 192.168.1.1 > 192.168.11.2: icmp: echo request (DF)
10:58:11.045624 192.168.1.1 > 192.168.11.2: icmp: echo request (DF)
10:58:12.045546 192.168.1.1 > 192.168.11.2: icmp: echo request (DF)

So it should work with your setting as well.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

