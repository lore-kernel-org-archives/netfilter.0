From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: IPTABLES for dual homed machine and public IP addresses
Date: Wed, 11 Aug 2004 11:50:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E351@alderaan.smgtec.com>
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
To: lists@neteconomist.com, netfilter@lists.netfilter.org

Eddie wrote:
> I am trying to setup a firewall for a LAN that has more than 40
> servers in production. All the production servers have public IP
> addresses. I have looked at several scripts available on line to
> build from and I have failed to get one that caters for this type of
> scenario. My router's internal interface is 65.x.x.1. Does anybody
> know of a way around this while keeping my external IP's or must I
> use private IP's for my internal machines? Do I have to set up the
> default gateway on production servers as my routers internal
> interface of use my firewall trusted interface as default gateway?


You can bin all the prod server's IP ports to the outside of the
firewall, or just simply proxy-arp the addresses. Then, apply the
patch-o-matic ROUTE patch to your kernel in order to forward the traffic
to your internal servers.

Then, on the internal side of the network proxy-arp whatever IP address
that the internal prod servers are using for a gateway and add ROUTE
rules for that.

Example:

This demonstration will assume default forward allowed. I assume you
know how to lock it down. I've used the prod addresses as described to
simplify selection of the ip range.

Prod Machines (65.10.10.64-104)
Firewall
   eth1-DMZ=3D(65.10.10.3)
   eth0-INET=3D(65.10.10.2)
Router
   65.10.10.1

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/conf/eth0/proxy_arp
echo "1" > /proc/sys/net/ipv4/conf/eth1/proxy_arp

iptables -t mangle -A PREROUTING -i eth0 --destination 65.10.10.64/26 -j
ROUTE --oif eth1
iptables -t mangle -A PREROUTING -i eth1 --destination ! 65.10.10.0/24
-j ROUTE --gw 65.10.10.1

Refer to http://www.sjdjweis.com/linux/proxyarp/ for an alternative
iproute2 based solution to this as well.

