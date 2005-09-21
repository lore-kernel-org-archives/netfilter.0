From: Askar <askarali@gmail.com>
Subject: Re: rules for dhcp server
Date: Wed, 21 Sep 2005 09:32:07 +0500
Message-ID: <a0f69e5050920213225e20e33@mail.gmail.com>
References: <a0f69e5050920053621fc6fa5@mail.gmail.com>
	<200509200846.37890.rob0@gmx.co.uk>
Reply-To: askarali@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509200846.37890.rob0@gmx.co.uk>
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
To: netfilter@lists.netfilter.org

Thanks, your reply really helps..

On 9/20/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
>=20
> On Tuesday 20 September 2005 07:36, Askar wrote:
> > I'm configuring a firewall on dhcp server, i'm a bit confuse which
> > port to allow on INPUT that users (clients) get IP from the server
> >
> > from /etc/sevices...
> >
> > bootps 67/tcp dhcps #Bootstrap Protocol Server
> > bootps 67/udp dhcps #Bootstrap Protocol Server
> > bootpc 68/tcp dhcpc #Bootstrap Protocol Client
> > bootpc 68/udp dhcpc #Bootstrap Protocol Client
>=20
> The server binds 67/udp, client binds 68/udp. TCP is not used.
>=20
> > dhcpv6-client 546/tcp #DHCPv6 Client
> > dhcpv6-client 546/udp #DHCPv6 Client
> > dhcpv6-server 547/tcp #DHCPv6 Server
> > dhcpv6-server 547/udp #DHCPv6 Server
>=20
> I don't know about this but I bet it's also UDP-only. If you're not
> using IPv6 addressing then you do not care.
>=20
> > lot of other services do runnig on this machine, however i'm very
> > clear about all other services, ie which port to allow etc
>=20
> On the server machine you must allow connections to your 67/udp from
> 68/udp. Some of these (renewals) will come addressed to the IP of your
> dhcpd; others (broadcasts) will come to 255.255.255.255<http://255.255.25=
5.255>.=20
> The origin
> IP's for such broadcasts are 0.0.0.0 <http://0.0.0.0>.
>=20
> DHCP service is generally a good thing to keep behind a firewall, IMO.
> Mine at home is running on a server which gets pass-through DNAT from
> the external router, so I had to be tricky about this. If the source
> address is not in my LAN segment I handle it as an external packet, but
> that was a problem for DHCP. I simply accept all from 255.255.255.255<htt=
p://255.255.255.255>
> (those won't pass through the external router anyway), but if you want
> to tighten it up you could try this:
>=20
> iptables -A INPUT -s 0.0.0.0 <http://0.0.0.0> -d 255.255.255.255<http://2=
55.255.255.255>\
> -p udp --sport 68 --dport 67 -j ACCEPT


however running tcpdump -n -i eth0 upd port 67 give me....
09:21:55.685883 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP,=20
Request from 00:07:e9:60:a8:db, length: 300

its a client requesting an IP from dhcp server, 0.0.0.0:bootpc. greping=20
bootpc from /etc/services gives..
bootps 67/tcp dhcps #Bootstrap Protocol Server
bootps 67/udp dhcps #Bootstrap Protocol Server

but not --sport 68, it mean client request also coming from --sport 67.=20
therefore i thinks i must go with ..
iptables -A INPUT -s 0.0.0.0 <http://0.0.0.0> -d
255.255.255.255<http://255.255.255.255>\ -p udp --dport 67 -j ACCEPT

without specifying a --sport things

Thanks and regards

Askar

09:21:56.000922 IP 192.168.1.1.bootps > 255.255.255.255.bootpc: BOOTP/DHCP,=
=20
Reply, length: 300


> All the client machines are running MS. Therefore any other good
> > suggestion will be appreciated to machine the network efficient.
>=20
> Get rid of all the MS machines. :)


We are trying but it will takes time :)


Only bind your DHCP service to the interface[s] where you intend to
> offer DHCP.
> --
> mail to this address is discarded unless "/dev/rob0"
> or "not-spam" is in Subject: header
>=20
>=20


--=20
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)
