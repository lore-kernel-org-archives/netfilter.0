From: "Eliot, Wireless and Server Administrator,
	Great Lakes Internet" <support8@greatlakes.net>
Subject: RE: Redirecting traffic from a non-existent IP
Date: Mon, 5 Jun 2006 09:16:42 -0400
Message-ID: <0633E0EDB4F25F43A2D7179CA11FAFAB255447@xavier.staff.greatlakes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Julian Hagenauer <chaosbringer@gmx.de>, netfilter@lists.netfilter.org


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Julian Hagenauer
> Sent: Monday, June 05, 2006 7:28 AM
> To: netfilter@lists.netfilter.org
> Subject: Redirecting traffic from a non-existent IP
>=20
> Hi,
> i am running Linux 2.6.11.12-xen0 (binary distribution).
> I want to route all Traffic destined to 192.168.1.5 to 192.168.1.3.
> 192.168.1.5 is a non-existent IP/host, 192.168.1.3 is a Xen-VM running
> on localhost, so 192.168.1.5 should act as a kind of alias for
> 192.168.1.3 and be accessible from localhost.
> The following modules are loaded:
>=20
> Module                  Size  Used by
> iptable_filter          2432  0
> iptable_nat            19932  1
> ip_conntrack           38712  1 iptable_nat
> ip_tables              20352  2 iptable_filter,iptable_nat
> intel_agp              20124  1
> agpgart                28968  1 intel_agp
>=20
>=20
> I wrote and ran the following script on localhost:
>=20
> #!/bin/bash
> echo 1 > /proc/sys/net/ipv4/ip_forward
> MAP_FROM=3D192.168.1.5 # virtuelle IP
> MAP_TO=3D192.168.1.3 # IP einer VM
> iptables -t nat -F
> echo "Mappe $MAP_FROM nach $MAP_TO..."
> iptables -t nat -A PREROUTING -d $MAP_FROM -j DNAT --to $MAP_TO
> echo "Aktuelle Nat-Regeln:"
> iptables -t nat -L
>=20
> But ping 192.168.1.5 or ssh 192.168.1.5 still does not work.
> I have no clue what's wrong.
>=20

Well, unless something is answering ARP requests on 192.168.1.5, your
other hosts have no idea which layer 2 address to direct their traffic
to. Why not just add that address as a secondary address on your box:

ip addr add 192.168.1.5/24 dev eth1

That seems like a much simpler solution.=20
=20
Eliot Gable
Certified Wireless Network Administrator (CWNA)
Certified Wireless Security Professional (CWSP)
Cisco Certified Network Associate (CCNA)
CompTIA Security+ Certified
CompTIA Network+ Certified
Network and System Engineer
Great Lakes Internet, Inc.
112 North Howard
Croswell, MI 48422
(810) 679-3395
(877) 558-8324
=20
Now offering Broadband Wireless Internet access in Croswell, Lexington,
Brown City, Yale, Worth Township, and Sandusky. Call for details.


