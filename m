From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: I can't resolve DNS name
Date: 30 Aug 2003 13:42:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062243778.1605.8.camel@kermit>
References: <0afd01c36e54$67e73620$0221a0c0@DANIEL>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0afd01c36e54$67e73620$0221a0c0@DANIEL>
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
To: Daniel Arjona <darjona@transito.gob.pa>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-08-29 um 19.38 schrieb Daniel Arjona:
> Observations:
> I have LRH 8.0 and iptables is in the my unique server with squid, qmail =
and
> others.
> My router is directly connected to the NIC of the server.
> When i try to connect to any FTP Server, i recieve this message "I can't
> resolve DNS name"
> I can't do ping to any IP Address
Looking at the iptables output below, I do not see any drop rule. Your
firewall code does not stop any packet. If you can't resolve any name,
test your name resolution and ping an ip-address, like:
ping 217.160.128.61
If that does not work, check your routing.
> echo 1 > /proc/sys/net/ipv4/ip_forward
> [root@transito root]# iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> MASQUERADE  all  --  192.160.33.0/24      anywhere
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>  ******************************************
>=20
> [root@transito root]# iptables -L -n
>=20
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> ACCEPT     all  --  192.160.33.0/24      0.0.0.0/0
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:25
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:110
>=20
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:80
> ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:143
> ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:53
> ACCEPT     udp  --  192.160.33.0/24      0.0.0.0/0          udp dpt:53
> ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:21
> ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:1214
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

