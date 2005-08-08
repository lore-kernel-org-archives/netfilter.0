From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: ppooe state RELATED,ESTABLISHED issue
Date: Sun, 07 Aug 2005 20:37:42 -0400
Message-ID: <1123461462.3383.25.camel@inyoureyes.linsolutions.com>
References: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
	<42F3299E.9030701@mnemon.de>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <42F3299E.9030701@mnemon.de>
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
To: =?ISO-8859-1?Q?J=F6rg?= Harmuth <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

On Fri, 2005-08-05 at 10:55 +0200, J=C3=B6rg Harmuth wrote:
> Ted Kaczmarek schrieb:
> > Today I was testing a Centos 4.1(RH ES4 clone) with  2.6.9-11.EL =
and a
> > Verizon dsl connection. I couldn't get any connection tracking re=
lated
> > rules working on the pppoe interface.
> >=20
> > -A INPUT -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> > -A FORWARD -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> >=20
> > The only way I could get it to forward traffic=20
> > was to allow all INPUT and FORWARD traffic for ppp0.
>=20
> Definitely not what you want :)
>=20
> > The pppoe is using eth0 and the inside interface is eth1.
> >=20
> > Googling uncovered a thread with respect to connection tracking b=
eing
> > broken=20
> > with bridging.
> >=20
> > http://www.uwsg.iu.edu/hypermail/linux/kernel/0506.2/0422.html
> >=20
> > Is this really the same issue? If packets are coming in eth1 and =
leaving
> > ppp0(using eth0) are they not just being routed?
>=20
> With policies set to ACCEPT and no other rules in place: Yes.
>=20
> > If eth0 is up the I can see packets
> > being bridged from ppp0e to eth0, but with eth0 down I am at a lo=
ss as
> > to why this is happening.
>=20
> Ofcourse, if eth0 is down no ppp traffic is possible.
>=20
> > Also is this issue specific to 2.6? A 2.4 based machine would lik=
ely
> > suffice in this application.
>=20
> Probably not, but I don't know.
>=20
> Well to start off, ppp0 is a logical interface, encapsulating the
> physical interface (here: eth0). So, all your rules - as you did - =
must
> be applied to eth1 and ppp0. You are forwarding packets, so must
> MASQUERADE all outgoing traffic through ppp0. In most cases you can=
't
> use SNAT, except your ISP gives you allways the same IP when you go
> online (in Germany DSL connections are disconnected by the ISP once=
 a day).
>=20
> So, a basic rule-set could look like this:
>=20
> echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
> -P INPUT DROP
> -P FORWARD DROP
>=20
> -A INPUT[FORWARD] -m state --state RELATED,ESTABLISHED -j ACCEPT
>=20
> -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>=20
> >From now on, all you have to do is allowing the connections you wa=
nt on
> the respective interface like this:
>=20
> -A INPUT -i ppp0 -p tcp --dport 80 --syn -j ACCEPT
>=20
> Same goes for eth1. Forwarding looks just the same:
>=20
> -A FORWARD -i eth1 -p tcp --dport 119 --syn -j ACCEPT
>=20
> if you are DNATing connetions to your router, you must SNAT them to=
o:
>=20
> -t nat -A PREROUTING -i eth1 -p tcp --dport 119 \
>    -j DNAT --to $NNTP_IP
> -t nat -A POSTROUTIMG -o eth1 -p tcp --sport 119 \
>    -j SNAT --to $NAT_BOX_IP_ON_ETH1
>=20
> Always assuming, that all policies not mentioned yet, are set to AC=
CEPT.
> Additionally, I'm a friend of this (last rule):
>=20
> -A INPUT[FORWARD] -p tcp -j REJECT --reject-with tcp-reset
>=20
> HTH and have a nice time,
>=20
> Joerg

With 2.4 Kernel Centos 3.5 it works fine, but I didn't bring up eth0 =
ip
interface. Need to retest this without an ip interface on eth0 and 2.=
6
kernel, the previous case I had an ip on eth0 as well.


Ted



