From: "Eliot, Wireless and Server Administrator,
	Great Lakes Internet" <support8@greatlakes.net>
Subject: RE: Redirecting traffic from a non-existent IP
Date: Mon, 5 Jun 2006 09:45:34 -0400
Message-ID: <0633E0EDB4F25F43A2D7179CA11FAFAB25544A@xavier.staff.greatlakes.net>
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
To: Julian Hagenauer <chaosbringer@gmx.de>
Cc: netfilter@lists.netfilter.org


> -----Original Message-----
> From: Julian Hagenauer [mailto:chaosbringer@gmx.de]
> Sent: Monday, June 05, 2006 9:37 AM
> To: Eliot, Wireless and Server Administrator, Great Lakes Internet
> Subject: Re: Redirecting traffic from a non-existent IP
>=20
>=20
> >Well, unless something is answering ARP requests on 192.168.1.5, your
> >other hosts have no idea which layer 2 address to direct their
traffic
> >to. Why not just add that address as a secondary address on your box:
> >
> >ip addr add 192.168.1.5/24 dev eth1
> >
> >That seems like a much simpler solution.
> >
> >Eliot Gable
> >Certified Wireless Network Administrator (CWNA)
> >Certified Wireless Security Professional (CWSP)
> >Cisco Certified Network Associate (CCNA)
> >CompTIA Security+ Certified
> >CompTIA Network+ Certified
> >Network and System Engineer
> >Great Lakes Internet, Inc.
> >112 North Howard
> >Croswell, MI 48422
> >(810) 679-3395
> >(877) 558-8324
> >
> >Now offering Broadband Wireless Internet access in Croswell,
Lexington,
> >Brown City, Yale, Worth Township, and Sandusky. Call for details.
> >
> >
> >
> >
> Hi,
> secondary adresses are unfortunately no option for me.
> I want to transparently and frequently exchange two xen VMs (acting as
> server) without a noticeable downtime during the exchange. So my idea
> was to bring up both vms and simply change the iptables to switch from
> one vm to the other.
> If anybody has an idea how i can realize that in a better way: tell me
:-)

Why not use a protocol that is meant for that then? For instance,
Virtual Router Redundancy Protocol. Using VRRP, you can create a virtual
IP address that is shared between two machines. One machine hosts the IP
until it fails or goes offline. At that point, the other machine takes
over. You can configure it so that when the master machine comes back
online either it takes over the IP again, or you could have it stay on
the slave machine until you manually tell it to switch back. Check into
the VRRP daemon offered by ImageStream or check out UCARP.=20

Also, you may want to consider using the CLUSTERIP target in Netfilter
and the Linux Kernel.=20

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


