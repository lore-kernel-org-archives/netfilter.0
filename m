From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: Connections
Date: Wed, 24 Aug 2005 17:27:16 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFC8F@p001ex03.porta.local>
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
To: Raphael Jacquot <raphael.jacquot@imag.fr>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

Hi.

maybe he has not a problem with his bandwidth, but a problem with his =
router
that cannot handle those connections. if you are using a linux box as =
router/gw=20
check the logs for something with conntrack table full. if this is the =
case your=20
machine is not able to accept new connections afaik.

a possible solution can be to increase your ip_conntrack_max in =
/proc/sys/net/ipv4=20
e.g. "echo "2048" >/proc/sys/net/ipv4/ip_conntrack_max

or you get patch o matic and look for the connlimit patch.

the last solution would be find the p2p guy and cut off his network =
cable ;)

greetings

matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of=20
> Raphael Jacquot
> Sent: Wednesday, August 24, 2005 5:08 PM
> To: Lyubomir Louisov
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Connections
>=20
>=20
> Lyubomir Louisov wrote:
> > Hi.
> > My torrent client is using too much connections at the same=20
> time and thats
> > why i cant browse the net.
> > My question is how can i limit the number of connections=20
> with iptables?
> >=20
> >=20
>=20
> You'd better use a QOS solution, to reduce the priority of=20
> the torrent=20
> data compared to the other stuff data
>=20
>=20

