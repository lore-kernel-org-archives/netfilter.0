From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 02 Feb 2005 08:22:24 -0800
Message-ID: <4200FE40.8070509@shorewall.net>
References: <61246.57.66.65.39.1107336931.squirrel@57.66.65.39>
	<4200A1F3.8030609@imag.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4200A1F3.8030609@imag.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
Cc: netfilter@lists.netfilter.org

Raphael Jacquot wrote:
> Herv=E9 wrote:
>=20
>> Hello,
>>
>> I have a weird setup I would like to make work: I have two identical
>> subnets connected to one machine via two different NICs, like this:
>>
>> Server             |         | Client 1
>> eth0:192.168.100.1 |---------| 192.168.100.2
>>                    |                              | Client 2
>> eth1:192.168.100.1 |------------------------------| 192.168.100.2
>=20
>=20
> having 2 interfaces on the same box with the same IP address
>=20
> repeat after me :
>=20
> WILL NOT WORK

Having two interfaces with the same IP address and netmask doesn't work
well. Having the same IP address with different netmasks can be useful.

From my firewall:

gateway:/usr/src/linux-2.6.10/net/ipv4/netfilter# ip addr ls
1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:a0:cc:db:31:c4 brd ff:ff:ff:ff:ff:ff
    inet 206.124.146.176/32 scope global eth0
    inet6 fe80::2a0:ccff:fedb:31c4/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc htb qlen 1000
    link/ether 00:02:e3:08:55:fa brd ff:ff:ff:ff:ff:ff
    inet 206.124.146.176/24 brd 206.124.146.255 scope global eth1
    inet 206.124.146.178/24 brd 206.124.146.255 scope global secondary
eth1:0
    inet 206.124.146.180/24 brd 206.124.146.255 scope global secondary
eth1:1
    inet6 fe80::202:e3ff:fe08:55fa/64 scope link
       valid_lft forever preferred_lft forever
4: eth2: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:08:c7:c0:e2:15 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.254/24 brd 192.168.1.255 scope global eth2
    inet6 fe80::208:c7ff:fec0:e215/64 scope link
       valid_lft forever preferred_lft forever
5: sit0: <NOARP> mtu 1480 qdisc noop
    link/sit 0.0.0.0 brd 0.0.0.0
gateway:/usr/src/linux-2.6.10/net/ipv4/netfilter#

Note Interfaces eth0 and eth1 -- both have IP address 206.124.146.176.

eth0 interfaces to my DMZ where there is a single server
(206.124.146.177) using Proxy ARP.

-Tom
--=20
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key

