From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Problem iptables DNAT.
Date: 18 Jun 2003 07:32:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055914322.7293.11.camel@kermit.spenneberg.de>
References: <001801c334eb$529a2ae0$0b01a8c0@mypc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001801c334eb$529a2ae0$0b01a8c0@mypc>
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
To: zufeng huang <zufeng@hotpop.com>, Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-06-17 um 18.12 schrieb zufeng huang:
> Hi, all
>=20
>  I have a Linux box with RedHat 9.0 installed(eth0:218.xxx.xxx,eth1:192.1=
68.0.1), this box is a firewall&proxy. Now I want external user can access =
my internal web server via the firewall box.
>=20
> According to RedHat 9.0's manual and the posts in internet, I used the fo=
llowing command.
>=20
> #iptables -t nat -A PREROUTING -p TCP -d xxx.xxx.xxx.xxx --dport 80 -j DN=
AT --to 192.168.0.5:80
This just accomplishes DNAT. You still have to allow the packets
through, like:
iptables -A FORWARD -p tcp -d 192.168.0.5 --dport 80 -m state --state
NEW -j ACCEPT

By the way, when adding a tcpdump, please make sure you already know
what you are talking about. Only include it if you know it will help to
resolve the issue. If you just want to capture http traffic using
tcpdump, do:
tcpdump tcp port 80
This would get rid of the dns, icmp and netbios packets.

Cheers,

Ralf
>=20
> But I can't access the internal web server from outside.
>=20
> Use tcpdump to get the following packets:
>=20
> 21:57:18.274817 192.168.0.85.1331 > 218.77.120.200.25460: udp 49
> 21:57:18.450579 218.77.120.200 > 192.168.0.85: icmp: 218.77.120.200 udp p=
ort 25460 unreachable [tos 0xc0]
> 21:57:18.968829 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT UD=
P PACKET(137): QUERY; REQUEST; BROADCAST
> 21:57:18.969963 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455: ipx-ne=
tbios 50
> 21:57:19.057680 61.144.148.161.50660 > 192.168.0.5.http: S 5685372:568537=
2(0) win 8192 <mss 1452,nop,nop,sackOK> (DF)
> 21:57:19.718043 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT UD=
P PACKET(137): QUERY; REQUEST; BROADCAST
> 21:57:19.749255 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455: ipx-ne=
tbios 50
> 21:57:20.468067 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT UD=
P PACKET(137): QUERY; REQUEST; BROADCAST
> 21:57:20.528584 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455: ipx-ne=
tbios 50
> 21:57:22.020715 61.144.148.161.50660 > 192.168.0.5.http: S 5685372:568537=
2(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
> 21:57:23.444576 arp who-has 192.168.0.85 tell 192.168.0.1
> 21:57:23.444815 arp reply 192.168.0.85 is-at 0:e0:4c:ef:55:f8
> 21:57:23.533007 218.17.247.6.http > 192.168.0.85.1383: R 562882410:562882=
410(0) ack 2793007952 win 0
> 21:57:24.054574 arp who-has 192.168.0.5 tell 192.168.0.1
> 21:57:24.054674 arp reply 192.168.0.5 is-at 0:30:48:23:4:33
> 21:57:27.919595 0.00:30:48:23:04:33.4010 > 0.ff:ff:ff:ff:ff:ff.452:ipx-sa=
p-resp[|ipx 64]
> 21:57:28.024632 61.144.148.161.50660 > 192.168.0.5.http: S 5685372:568537=
2(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
> 21:57:29.248044 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
> 21:57:29.248486 192.168.0.100.netbios-dgm > 192.168.0.255.netbios-dgm: NB=
T UDP PACKET(138)
> 21:57:33.839985 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
> 21:57:34.581878 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
> 21:57:35.332929 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
> 21:57:40.026871 61.144.148.161.50660 > 192.168.0.5.http: S 5685372:568537=
2(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
> 21:57:43.191397 arp who-has 192.168.0.5 tell 192.168.0.4
> 21:58:18.987637 arp who-has 192.168.0.5 tell 192.168.0.222=20
>=20
> As I said, this box is a proxy too, so the above packets maybe contain un=
-useful messages to analysis where the problem is.
>=20
> Anybody can help me?=20
>=20
> thanks,
>=20
> zufeng
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

