From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port forwarding without masquerading..???
Date: Tue, 29 May 2007 19:53:20 +0200
Message-ID: <465C6890.9000106@plouf.fr.eu.org>
References: <3143.67.190.128.248.1180318896.squirrel@webmail.usermail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3143.67.190.128.248.1180318896.squirrel@webmail.usermail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

dummy@sapmail.pg.com a =E9crit :
>=20
> I am changing data centers and want to forward traffic hitting server A=
 to
> Server B in another data center.  I was using masquerading and it was
> working fine, however a problem has popped its ugly head.  Server B nee=
ds
> to know the IP address of the client connecting to it.  If it gets
> forwarded through Server A, the IP address of Server A is what is given=
.
>=20
> I tried to make this work without masquerading but I break the port
> forwarding.

The reply packets *must* go back to the forwarding box (A) by any means=20
in order for the DNAT to work properly. Masquerading on box A was an=20
easy way to achieve this, but the drawback is it hides the real source=20
address. Another problem may be that some router or firewall in the path=20
between box A's and box B drops forwarded packets with a "foreign"=20
source address.

The only workaround I can think of when box A and box B are not in the=20
same network is some tunnel or VPN between them and advanced routing on=20
box B set up so it sends the reply packets of forwarded connections back=20
to box A through the tunnel/VPN. This way, intermediate routers do not=20
see foreign source addresses and box B sends the reply traffic back to=20
box A regardless of the destination address. The advanced routing rule=20
may be based on the destination address (if the traffic is forwarded to=20
a specific address such as a private tunnel address), the protocol, the=20
destination port or a connection mark.

