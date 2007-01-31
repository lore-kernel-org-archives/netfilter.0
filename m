From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Connect to localhost bound port from outside?
Date: Wed, 31 Jan 2007 17:03:42 +0100
Message-ID: <45C0BDDE.2030905@plouf.fr.eu.org>
References: <eppgne$mc1$1@sea.gmane.org> <45C06BE7.2080208@plouf.fr.eu.org>
	<45C0B772.2090201@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C0B772.2090201@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant Taylor a =E9crit :
> Pascal Hambourg wrote:
>=20
>> Iptables will happily redirect anything you like to localhost, but the=
=20
>> kernel IP routing prohibits communications with a loopback address on=20
>> a non loopback interface and thus will drop the packets.
>=20
> Does this apply if the reverse path filter is turned off?

Yes. This is not a reverse path issue, as rp_filter=3D1 checks only the=20
source address, not the destination address.

> Or is this a=20
> hard coded filter in the kernel that can not be gotten around?

AFAIK, it is hard coded. I guess the reason is that RFC 3330 reserves=20
127.0.0./8 for the loopback and prohibits its use on any network outside=20
the host. Unfortunately, the routing code does not know that the packet=20
was DNATed and has an original non-loopback destination address.

> Another thought to the OP would be to use the Dummy interface in lieu o=
f=20
> the Loop Back interface as I believe it does not have the same=20
> restrictions that Loop Back does.  However I could be mistaken.

I do not see how a dummy interface might be useful here. Can you please=20
clarify ?

> I have often considered using lo for local only but using dummy as a=20
> spur network to bind services to and then route traffic in to the spur=20
> network.  Thoughts / Opinions?

A dummy interface is a black hole, a kind of "/dev/null" interface,=20
traffic you route to it is lost. This is very different from a loopback=20
interface, whose traffic you route to it loops back and is received by=20
the local host. It is fine to use a dummy interface if you want to add=20
an extra address to the host and bind services to it, but I guess you=20
could do the same with the loopback interface.

