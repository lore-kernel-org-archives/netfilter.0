From: Ian Laurie <iml@zip.com.au>
Subject: Re: Hi!
Date: Mon, 13 Jun 2005 00:55:14 +0000
Message-ID: <1118624114l.11527l.2l@server.moose.blogdns.org>
References: <2e51be410506111000557ddca1@mail.gmail.com>
	<Pine.LNX.4.53.0506111202260.9775@altaica>
	<1118512593.18567.6.camel@debianbox>
	<Pine.LNX.4.53.0506111321350.9775@altaica>
	<1118620090l.11527l.0l@server.moose.blogdns.org>
	<Pine.LNX.4.53.0506121914140.9775@altaica>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0506121914140.9775@altaica> (from
	tib@tigerknight.org on Mon Jun 13 10:26:35 2005)
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="Flowed"
To: netfilter@lists.netfilter.org

On 06/13/2005 10:26:35 AM, Tib wrote:
> > > Caveat to what I just said - if you are doing masquerading behind a=20
> single
> > > IP, then you don't need to worry about the FORWARD ruleset. Only pack=
ets
> > > associated with connections  that are being masqueraded will get sent=
 on
> > > to internal networks - unless you have specific ports that are=20
> translated
> > > to internal services.
> >
> > Actually that isn't quite correct.  With ip_forward on, network bridgin=
g=20
> is
> > enabled. Running NAT does not disable the bridging function.  If a box =
on=20
> the
> > outside port sends a packet addressed to a box on the inside port, usin=
g=20
> the
> > firewall as its gateway, the packet will get through NAT.  NAT runs on =
top
> > of the bridging function, so bridging still works, though only in one=20
> direction
> > since in the other direction packets will get NATed.
>=20
> Actually, it is 100% correct. Masquerading is a broad spectrum SNAT that
> will redirect return traffic associated with whatever it sends out back t=
o
> the originating internal host. So if some new connection comes in to the
> external IP that isn't associated with any outbound connection, it hits
> the firewall and falls flat - this is why modules like ip_conntrack_ftp
> and ip_nat_ftp are necessary, and why dcc on irc clients tends to get
> borked, the list goes on.

Hi Tib,

We *may* be speaking at cross purposes.  I agree with what you have said bu=
t
I am also correct.  The issue is your statement "hits the firewall and fall=
s=20
flat".

Your original paragraph doesn't make it clear to a beginner that you are
pre-supposing that there is a real firewall in place that will enforce NAT.

My point, that is also 100% correct, is that having a NAT rule alone does n=
ot=20
disable the bridging function.

The reality is that a lot of beginners "assume" that when they have NAT, th=
eir
internal addresses are unreachable from the outside and that simply isn't
the case with NAT alone (at least not with iptables under Linux).

That was the point I was making. =20
As for the rest of your post, you are forgetting the wider purpose of route=
rs/
firewalls.  For example, inside a company where you may have the
R&D department on one private address space, finance on another, etc., all=20
isolated with routers.  In this scenario (which I work in) all you need to =
do=20
is use the "route" command to tell your machine where to send packets, and=20
suddenly private IP addresses are routable and *will* make it to the
firewall.  Further, you can specifically allow certain machines (like mine)
to get through..... despite NAT in operation for all other packets.

That is, I can ssh etc. into boxes that sit behind NAT.  I just wanted to m=
ake=20
the point that NAT alone doesn't prevent this, which wasn't obvious from yo=
ur=20
post.

Ian



