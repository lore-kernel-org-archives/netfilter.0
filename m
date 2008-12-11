From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Using MARK and TOS to route traffic through different
	interfaces to the same destination
Date: Thu, 11 Dec 2008 13:33:51 +0100
Message-ID: <1228998831.22977.9.camel@enterprise.ims-firmen.de>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Javier =?ISO-8859-1?Q?G=E1lvez?= Guerrero <javier.galvez.guerrero@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2008-12-11 at 13:18 +0100, Javier G=E1lvez Guerrero wrote:
> Hi all,
>=20
> I need to route packets through different interfaces (let them be ath=
0
> and eth0) depending on the application source port, so I thought usin=
g
> TOS or MARK targets of iptables would be helpful.
>=20
> Anyway, as I try configure it to mark the traffic and updating the
> routing tables through many different ways, I can't get it working so
> the packets are always sent through the "default" interface in the
> main routing table.
>=20
> For example, if I use MARK I configure it this way:
>=20
> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60301 -j MARK --set-=
mark 1
> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60302 -j MARK --set-=
mark 2

AFAIK, locally generated packets are routed before they are sent to
netfilter, so setting fwmarks there to influence routing is pointless.

See http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html

=46igure 3a

If you can use two different source IPs, you could probably
bind them to each interface and then you wouldn't need policy
routing at all to achieve your objective.


> sudo ip rule add fwmark 1 table 1 prio 1
> sudo ip rule add fwmark 2 table 2 prio 2
>=20
> sudo ip route add table 1 nexthop via 192.168.0.1 dev ath0
> sudo ip route add table 2 nexthop via 192.168.0.1 dev eth0
>=20
>=20




