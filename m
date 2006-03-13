From: Nilesh <niluforalways@yahoo.com>
Subject: RE: port forwarding form IP range
Date: Mon, 13 Mar 2006 05:13:44 -0800 (PST)
Message-ID: <20060313131344.71657.qmail@web50511.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: edvin.seferovic@kolp.at, netfilter@lists.netfilter.org

Thanks Edvin,

We have two Internet service providers.
The scenario is 192.168.0.1 is on my ISP 1=20
and now I have installed second proxy server on other
comp which is 192.168.0.3 on the ISP 2 connection.
We have assigned the Ip's to our internal machines
from range 192.168.0.4 to 192.168.0.250.
We have some bandwidth upload/download limitations on
the ISP 1.=20
I want to use 192.168.0.3 proxy severs for the some
IP's
I have taken example as 192.168.0.10 IP.
The browser settings of 192.168.0.10 comp is
192.168.0.1:3128

I want to setup the firewall on the 192.168.0.1 so the
request coming from 192.168.0.10 for the
192.168.0.1:3128 will forwarded to 192.168.0.3:3128
so he/she will use invisibly the proxy
192.168.0.3:3128

could you please help me to solve the problem

Nilesh.=20



--- Seferovic Edvin <edvin.seferovic@kolp.at> wrote:

> Hi,
>=20
> first of all an IP address should have /32 mask - or
> simply NO mask !
>=20
> INTIP=3D"192.168.0.1/24" <<< but I haven't seen the
> use of this variable in
> your script
>=20
> You are prerouting http traffic to your proxy (
> squid I suppose ) which is
> running on the same machine ( 192.168.0.1 )! So you
> need=20
>=20
> --to-port 3128 without the IP address
>=20
> $IPTABLES -t nat -A PREROUTING -i eth1 -p tcp
> --dport 80 -j REDIRECT
> --to-ports 192.168.0.1:3128 <<<=20
>=20
> I do NOT see the aim of this rule.. every packet
> from 192.168.0.10 to
> 192.168.0.1 ( machine with this firewall script )
> which comes on the same
> ethernet card ? There is a forward chain for the
> packets that are being
> routed. Every packet which has destination of a
> local eth card hits the
> input chain. So your following rule should be
> changed=20
>=20
> $IPTABLES -A FORWARD -s 192.168.0.10 -i eth1 -d
> 192.168.0.1 -o eth1 -p tcp
> --sport 1024:65535 --dport 3128 -j ACCEPT
>=20
> .. to something what suits your needs !
>=20
> Regards,
>=20
> Edvin
>=20
> -----Original Message-----
> From: Nilesh [mailto:niluforalways@yahoo.com]=20
> Sent: Montag, 13. M=E4rz 2006 12:39
> To: Nilesh; edvin.seferovic@kolp.at;
> netfilter@lists.netfilter.org
> Subject: RE: port forwarding form IP range
>=20
> Sorry earlier mail was without attchment.
>=20
> --- Nilesh <niluforalways@yahoo.com> wrote:
>=20
> > no there is only Forward default chain.
> > I am confused , I have attached herewith my
> > rc.firewall  could you please look into.If I am
> > going
> > wrong way.
> >=20
> > Thanks
> > Nilesh,
> >=20
> > --- Seferovic Edvin <edvin.seferovic@kolp.at>
> wrote:
> >=20
> > > -i eth1 -o eth1 ??? How is this suppose to work?
> > Is
> > > there any forward chain
> > > on one interface?
> > >=20
> > > iptables -A FORWARD -s 192.168.0.10 -i eth1 -d
> > > 192.168.0.1 -o eth1 -p tcp --sport 1024:65535
> > > --dport
> > > 3128 -j ACCEPT.
> > >=20
> > > Regards,
> > >=20
> > > Edvin
> > >=20
> > > --- Rob Sterenborg <rob@sterenborg.info> wrote:
> > >=20
> > > > On Mon, March 13, 2006 09:53, Nilesh wrote:
> > > > > Thanks Leandro,
> > > > >
> > > > > I have tried with this rules but
> unfortunately
> > > not
> > > > > working.
> > > > > Squid server running on the 192.168.0.3 and
> > its
> > > > > working  fine. I have not installed any
> > firewall
> > > > on
> > > > > the 192.168.0.3.
> > > > > In my Internet browser settings If I chnage
> > the
> > > > > settings from 192.168.0.1:3128 to
> > > 192.168.0.3:3128
> > > > I
> > > > > can surf the web.
> > > > > but If I dont change to 192.168.0.3:3128
> proxy
> > > > > settings I get the connection timout error.
> > > > >
> > > > > I think DNAT is not working
> > > >=20
> > > > Probably you tell Netfilter to do DNAT, but
> are
> > > not
> > > > allowing it.
> > > > Do you have a FORWARD rule that allows this
> > > traffic
> > > > or is your policy ACCEPT ?
> > > >=20
> > > > Please don't top-post.
> > > >=20
> > > >=20
> > > > Gr,
> > > > Rob
> > > >=20
> > > >=20
> > > > > --- Leandro Silva <lansoweb@gmail.com>
> wrote:
> > > > >
> > > > >> Hello !
> > > > >>
> > > > >> You can use something like that:
> > > > >>
> > > > >> iptables -I PREROUTING -t nat -s
> 192.168.0.10
> > > -p
> > > > tcp
> > > > >> --dport 80 -j
> > > > >> DNAT --to 192.168.0.3:3128
> > > > >> iptables -I PREROUTING -t nat -s
> 192.168.0.10
> > > -p
> > > > tcp
> > > > >> --dport 3128 -j
> > > > >> DNAT --to 192.168.0.3:3128
> > > > >>
> > > > >> If you have iprange compiled for iptables
> you
> > > can
> > > > >> use:
> > > > >>
> > > > >> iptables -I PREROUTING -t nat -m iprange
> > > > --src-range
> > > > >> 192.168.0.10-192.168.0.20 -p tcp --dport 80
> > -j
> > > > DNAT
> > > > >> --to
> > > > >> 192.168.0.3:3128
> > > > >> iptables -I PREROUTING -t nat -m iprange
> > > > --src-range
> > > > >> 192.168.0.10-192.168.0.20 -p tcp --dport
> 3128
> > > -j
> > > > >> DNAT --to
> > > > >> 192.168.0.3:3128
> > > > >>
> > > > >> I hope this can help,
> > > > >> Leandro
> > > > >>
> > > > >> 2006/3/11, Nilesh
> <niluforalways@yahoo.com>:
> > > > >> > Dear all,
> > > > >> >
> > > > >> > I have two squid proxy servers and two
> ISP
> > > > >> >
> > > > >> > 1)      192.168.0.1 port 3128
> > > > >> > 2)      192.168.0.3 port 3128
> > > > >> >
> > > > >> > We have around 70 comps assigned IP's
> > between
> > > > >> > 192.168.0.4 to 192.168.0.250
> > > > >> > The default proxy we are using is
> > 192.168.0.1
> > > > >> which is
> > > > >> > on the ISP 1.
> > > > >> > Now I have configured 192.168.0.3 squid
> > proxy
> > > > >> server
> > > > >> > on ISP 2 line.
> > > > >> > Both ISP 1 and ISP 2 are landing
> > (connected)
> > > on
> > > > >> the
> > > > >> > same Switch.
> > > > >> >
> > > > >> > Now I want setup the request coming from
> IP
> > > > range
> > > > >> > (192.168.0.10 to 192.168.0.20) for the
> > > > >> > 192.168.0.1:3128
> > > > >> > Will be forward to 192.168.0.3:3128
> > > > >> > So the users from this IP range will
> access
> > > > only
> > > > >> > 192.168.0.3 proxy server.
> > > > >> >
>=20
=3D=3D=3D message truncated =3D=3D=3D


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around=20
http://mail.yahoo.com=20

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

