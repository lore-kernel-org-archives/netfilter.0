From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: The basis for deciding which NIC to use in a multiple NIC system
Date: Wed, 2 Jun 2004 12:22:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E32B@alderaan.smgtec.com>
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
To: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>, netfilter@lists.netfilter.org

Martinez, Michael wrote:
> Let's say you have a Linux system with two NIC cards each on the same
> subnet. Let's say the system wants to talk to another computer on the
> subnet. How does the kernel decide which NIC to use? =20

I believe the last initialized card is given the subnet route. I don't
believe they automatically equalize.

> Is there a way to force the use of a particular NIC for an
> application running under a particular username?=20

Yes, at least for outgoing connections.

Setup a new routing table dedicated for this new channel. The only route
will be default -> some_network. I assume you can do this yourself.

The second part is forcing data to/from the user to go out on the
correct interface.

# Routing
# Any traffic with 111 fwmark should exit network if
if_second_one(eth0,eth1,...)
ip rule add fwmark 111 table 111
ip route add default dev $if_second_one table 111

# Tell the system to mark any packet leaving the system coming from root
as 111
iptables -A OUTPUT -m owner --uid-owner root -j MARK --mark 111=20

# When sending the marked packets over the network, send it as the IP
address of the second NIC.
iptables -A POSTROUTING --mark --mark 111 -j SNAT $Outgoing_IP

