From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Port forwarding not working (nfcan: to exclusive) (nfcan: to 
 exclusive)
Date: Sun, 29 Apr 2007 03:10:13 -0400
Message-ID: <1177830613l.3596l.1l@soapy>
References: <000001c78a0c$a7b02cd0$dededede@neilhp>
	<1177819456l.3596l.0l@soapy>
	<1077.70.240.185.92.1177822593.squirrel@ssl.jammconsulting.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1077.70.240.185.92.1177822593.squirrel@ssl.jammconsulting.com>
	(from +nfcan+jimlaur+ce6b708e36.neil#JAMMConsulting.com@spamgourmet.com
	on Sun Apr 29 00:56:33 2007)
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 04/29/2007 12:56:33 AM, neil@JAMMConsulting.com wrote:
> Jim:
>=20
> > The outside should be able to initiate
> > so the first rule looks good:
> >
> > /sbin/iptables -A FORWARD -i eth0 -o eth1 -d $LINKSYS_VPN_IP
> > 	-p tcp --sport 1024: --dport 1723
> > 	-m state --state NEW,ESTABLISHED -j ACCEPT
> >
> > But you need to accept the return packets.
> > How about this for the return pattern:
> >
> > /sbin/iptables -A FORWARD -i eth1 -o eth0 -s $LINKSYS_VPN_IP
> > 	-p tcp --sport 1723
> > 	-m state --state ESTABLISHED -j ACCEPT
>=20
> That is my point.  Without this rule, I should see packets
> hitting the firewall in the log.  I dont see them.

I guess "hitting the firewall" means showing up in a drop count.
I agree, if the packets come in they should be counted.
But you do need some rule to accept them in filter.

If the packets do not come back, maybe that is a routing problem?
I can also imagine that a vpn box might not want to talk to hosts
not on the local network it was hooked up to.
Some security folks might get upset :)
Maybe you could use SNAT to make the packets appear
to come from the firewall, then they ought to come back.
I think that is a better use of the postrouting chain.
The mantra is always "filter in filter", etc.,
and my experience has been that it is good advice.

> I can add this rule, but I don't think the return packets are
> coming back correctly.

I think a sniffer, e.g. wireshark (ex ethereal), would
be able to tell you if there were loose packets
floating around on the eth1 side trying to get somewhere else.
You could filter on tcp and source ip:port
and see what the destination was.

If the packets were destined for the outside originator,
would the firewall route them there?

>=20
> > The accept in the nat postrouting can be removed.
>=20
> I need that as I also set the nat postrouting to drop
> by default.
see above, not recommended

--=20
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.


