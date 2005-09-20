From: Askar <askarali@gmail.com>
Subject: rules for dhcp server
Date: Tue, 20 Sep 2005 17:36:28 +0500
Message-ID: <a0f69e5050920053621fc6fa5@mail.gmail.com>
Reply-To: askarali@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "lists.netfilter.org" <netfilter@lists.netfilter.org>

hi list

I'm configuring a firewall on dhcp server, i'm a bit confuse which port to=
=20
allow on INPUT that users (clients) get IP from the server

from /etc/sevices...=20

bootps 67/tcp dhcps #Bootstrap Protocol Server
bootps 67/udp dhcps #Bootstrap Protocol Server
bootpc 68/tcp dhcpc #Bootstrap Protocol Client
bootpc 68/udp dhcpc #Bootstrap Protocol Client
dhcpv6-client 546/tcp #DHCPv6 Client
dhcpv6-client 546/udp #DHCPv6 Client
dhcpv6-server 547/tcp #DHCPv6 Server
dhcpv6-server 547/udp #DHCPv6 Server

lot of other services do runnig on this machine, however i'm very clear=20
about all other services, ie which port to allow etc
All the client machines are running MS. Therefore any other good suggestion=
=20
will be appreciated to machine the network efficient.

regards

Askar
--=20
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)
