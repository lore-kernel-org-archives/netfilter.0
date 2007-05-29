From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: T1 router and multiple public ips
Date: Tue, 29 May 2007 08:39:02 -0700
Message-ID: <001801c7a207$7b734090$5a05a8c0@nisgaa.net>
References: <5009b2270705282025q2a2243b6u7e4d3e1d7dcbd0c@mail.gmail.com>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5009b2270705282025q2a2243b6u7e4d3e1d7dcbd0c@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Shouldn't the T1 router be configured to handle the traffic between the =
two
public IPs? Or are the gateways able to talk to one another from the
"inside"?

Are your gateways both using the same segment? I would have floyd1 using
192.168.10.x and floyd2 using 192.168.11.x or something like that so you
could do the following:

Set up hosts files on the gateways to point traffic directed to each =
others'
networks at each other (or on each machine, but that's a pain unless you
insert in each users' startup script a command to copy the hosts from =
from a
file server), so for example if you have a domain
"www.floyd1sapacheserver.com" that points to the public IP 13.47.77.2, =
you
would have an entry in the hosts file of floyd2 point to 192.168.10.x, =
and
the reverse applies to "www.floyd2siisserver.com", you would have an =
entry
in the hosts file of floyd1 that pointed to 192.168.11.x, at least =
that's
what I would try.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> jamil egdemir
> Sent: Monday, May 28, 2007 8:26 PM
> To: netfilter@lists.netfilter.org
> Subject: T1 router and multiple public ips
>=20
>=20
> Hi,
>=20
> I have a T1 router that provides me with two public ips: 13.47.77.2
> and 13.47.77.3.  There are two linux boxes, (each with two Ethernet
> cards) acting as the gateways to a 192.168.1.0 network sitting behind
> each public ip.  My question is how do I get a browser on 192.168.1.30
> sitting behind 13.47.77.2 to reach a web server on 192.168.1.2 sitting
> behind 13.47.77.3.
>=20
> Usually I use something like the following rule to forward ports from
> outside ips to internal ips on the 192.168.1.0 networks:
>=20
> '/sbin/iptables -t nat -A PREROUTING -p tcp --dport $MYPORT=20
> -j DNAT --to
> 192.168.1.2:80'
>=20
> so.. all my previous natting experience was for trying to let machines
> on the outside communicate with my networks behind the 13.47.77.2 and
> 13.47.77.3 public ips.. the iptables command above works great fot
> that.
>=20
> let's say the hostname(eth0-ip, eth1-ip) of the first gateway are
> floyd1(13.47.77.2, 192.168.1.1) and the hostname(eth0-ip, eth1-ip) of
> the 2nd gateway floyd2(13.47.77.3, 192.168.1.1)and I'm trying to make
> a browser on 192.168.1.30 behind floyd1 talk to the web server on
> 192.168.1.2 behind floyd2 that is listening on port 80.  The default
> gateways are currently set to 13.47.77.1 on both floyd1 and floyd2.
>=20
> What are the iptables commands that I need to make this thing fly?  I
> feel like I should have a pair of iptables commands on each gateway to
> do the job. One of them being a -j DNAT and the other being a -j SNAT
> to handle both directions..
>=20
> I'm also wondering what is the 'best practice' for this situation
> where you have a T1 router with networks sitting behind each public ip
> that need to talk to each other..
>=20
>=20
> --=20
> -jamil
>=20
> -------------------------------------------------------------
> Jamil Egdemir
> unclejamil@gmail.com
> AIM: unclejamil
> YahooMessenger: uncle_jamil
> http://grad.physics.sunysb.edu/~jamil
> (631) 338-3170 (cell)
> -------------------------------------------------------------
>=20


