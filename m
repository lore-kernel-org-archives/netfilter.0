From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 18:25:52 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905130B@asimail2.alphanumeric.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> (btw, none of your responses wrap at all, and I have to edit them)

yeah--sorry about that.  i'm in the process of switching mail accounts.

> I need internal hosts, and external hosts, to be able to connect to =
the
> DMZ servers by their public DNS names. Connecting to
> http://www.somedomain.com from either the inside or the outside, =
should
> get you to the server in the DMZ. For testing purposes, we need to
> access everything the same way as our customers.

this statement implies you would want split-dns...

> Not knowing what split-dns was, I googled it. If I understand it
> correctly it seems that this is only needed when you use a single,
> common domain for both internal and external systems. All our external
> systems (both between the firewall and the router, and in the DMZ) are
> in "domain.com" and all our internal systems are in "sub.domain.com", =
so
> we don't need split-dns, right?

whereas this statement implies you don't want split-dns.

> > if you need the internal folks to access the DMZ hosts by public IP,
>  > your best bet is probably to do DNATs like:
> >
> >   iptables -t nat -A PREROUTING -i $INTERNAL_IF -o $DMZ_IF \
> >     -d $DMZ_PUB_IP -j DNAT --to-detination $DMZ_PRIV_IP

in addition to missing an 's' in there; i also used "-o" which isn't
allowed in PREROUTING--it's been a long day here too...last try:

   iptables -t nat -A PREROUTING -i $INTERNAL_IF \
     -d $DMZ_PUB_IP -j DNAT --to-destination $DMZ_PRIV_IP

> > for each host...you can cycle through these in the script that =
creates
>  > the static one-to-one mappings from #1 above...  ;-)
>
> I think I need to look closer at how packets travers netfilter, before
> I'll understand that one. It's been a long day. :)

sorry--the above rule says:  translate the destination IP of any packet
entering the internal interface; destined for the public IP address of=20
a DMZ host to it's private IP address.

so when someone on the inside tries to get to 198.6.1.10 (which is =
translated
on the outside interface to 10.10.1.1), it will also get translated to
10.10.1.1.  there are other ways to achieve this--normally the DNAT on =
the
external side will specify the external interface explicitly:

  iptables -t nat -A PREROUTING -i $EXTERNAL_IF -d $PUBLIC_IP \
    -j DNAT --to-destination $PRIVATE_IP

in this case you could leave out the interface specification, so that =
*any*
traffic destined to $PUBLIC_IP will get translated, regardless of
interface:

  iptables -t nat -A PREROUTING -d $PUBLIC_IP \
    -j DNAT --to-destination $PRIVATE_IP

the beauty/flexibility of netfilter...

-j

