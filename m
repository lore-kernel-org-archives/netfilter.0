From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: Linux router in bridge mode
Date: Fri, 18 Aug 2006 15:39:47 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE125863@q.LeBlancNet.us>
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
To: netfilter@lists.netfilter.org

I think I found what I'm looking for here:
http://www.debian.org/doc/manuals/securing-debian-howto/ap-bridge-fw.en.
html

If it doesn't do what I want, then I'll look into the following
suggestion. Thanks for the help.

Robert LeBlanc

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Vivek Dasmohapatra
> Sent: Friday, August 18, 2006 3:09 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Linux router in bridge mode
>=20
> On Thu, 17 Aug 2006, Robert LeBlanc wrote:
>=20
> > Is it possible to use iptables with two NICs in bridge mode? I'd
like to
> > do some NATing on the back end for computers behind the router
still.
> > Can that be done with virtual addresses, or can an adapter be in
bridged
> > mode and IP mode (is that what it's called?) at the same time?
>=20
> Yes, it is possible to do this. IIRC you used to need a patch, but I
think
> it was rolled in a while ago. Enable
>=20
> CONFIG_BRIDGE_NETFILTER
>=20
> Symbol: BRIDGE_NETFILTER [=3Dy]
>    Prompt: Bridged IP/ARP packets filtering
>      Defined at net/Kconfig:137
>      Depends on: NET && BRIDGE && NETFILTER && INET
>      Location:
>        -> Networking
>         -> Networking support (NET [=3Dy])
>           -> Networking options
>             -> Network packet filtering (replaces ipchains)
>=20
> You may also want CONFIG_IP_NF_ARPTABLES (but this is a bit more
> specialised):
>=20
> Symbol: IP_NF_ARPTABLES [=3Dm]
> Prompt: ARP tables support
>    Defined at net/ipv4/netfilter/Kconfig:581
>    Depends on: NET && INET && NETFILTER && NETFILTER_XTABLES
>    Location:
>      -> Networking
>        -> Networking support (NET [=3Dy])
>          -> Networking options
>            -> Network packet filtering (replaces ipchains) (NETFILTER
> [=3Dy])
>              -> IP: Netfilter Configuration
>=20
> Depending on where your bridge is in the network, you may also need to
> turn on proxy arp for the interfaces in question.
>=20
> The brctl tool is used to set up/remove bridges.
> On debian this can be configured in /etc/network/interfaces iirc, or
> just use an init script or similar.
>=20


