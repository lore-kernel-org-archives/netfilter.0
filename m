From: Javier Sanchez <sjllera@ya.com>
Subject: Re: Vijay - port 25 to be blocked
Date: Tue, 28 Dec 2004 17:23:36 +0100
Message-ID: <1104251017.19129.11.camel@horus>
References: <E1CjK9G-0000Y9-00@mx.ya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1CjK9G-0000Y9-00@mx.ya.com>
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
To: Vijay Kumar <vijay@calsoftinc.com>
Cc: netfilter@lists.netfilter.org



You are using INPUT, and should be using the OUTPUT chain because you
need to filter traffic comming from an external network. You can also
put the filter on the INPTU chain, in this case you shuld use --sport
instead of --dport.


So it should be:

To filter incoming traffic from a forbidden mail server.

iptables -I INPUT -i eth0 --sport 25 -d  !<ip addr of mail server>  -j
REJECT

To filter outgoing traffic to a forbidden mail server.

iptables -I OUTPUT -o eth0 --dport 25 -d  !<ip addr of mail server>  -j
REJECT

You should use the second option, but depend on your firewall ruleset
implementation, any of them will do the trick .-)

Cheers

El mar, 28-12-2004 a las 21:52 +0530, Vijay Kumar escribi=F3:
> Hi,
>=20
> I want to allow my internal network to only connect to some specific em=
ail
> servers.
> Apart from these mail server  I want to block port 25 and 110 from my
> internal network to anywhwere. I am doing the following :=20
>=20
> iptables -I INPUT -I eth0 --dport 25 -d  !<ip addr of mail server>  -j
> REJECT =20
> =20
> This does not seem to block the port 25 traffic. Where am I going wrong=
?=20
>=20
> Kindly help.=20
>=20
> Regards,
> Vijay Kumar
>=20
> =20
>=20
>=20
>=20



