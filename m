From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 16:41:24 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051307@asimail2.alphanumeric.com>
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

> > your other option could be to leave the /28 of public space outside =
the
>  > firewall, re-address the DMZ hosts to use private space, and setup
>  > one-to-one NATs for the DMZ hosts, and keep your firewall solely =
layer 3
>  > (my bias--i love the routing).
>
> I like this idea better, but I'm confused about a couple of things.
> First, I've never done one-to-one NAT, but I'm sure I can look that =
up.

ok.  the basic premise is that you generate pairs of SNAT and DNAT rules =
for each private/public IP pair.

> Second, will I require any special rules to allow internal LAN hosts =
to
> access the DMZ systems by their public IP addresses? I want to be sure
> internal systems access them the same way as external systems. Third,

by their public IP addresses?  yes.  by their names--no (two words for =
you:  split dns--know it, use it, love it)

if you need the internal folks to access the DMZ hosts by public IP, =
your best bet is probably to do DNATs like:

  iptables -t nat -A PREROUTING -i $INTERNAL_IF -o $DMZ_IF \
    -d $DMZ_PUB_IP -j DNAT --to-detination $DMZ_PRIV_IP

for each host...you can cycle through these in the script that creates =
the static one-to-one mappings from #1 above...  ;-)

> when I write rules for what access is allowed to what systems in the =
DMZ
> from either the Internet or the LANs, what do I write the rule =
against:
> the real, pulic IP of the DMZ server, or it's private IP address?

private IP.  DNAT happens in the PREROUTING chain of the nat table; =
which is prior to any chain of the filter table.  SNAT happens in the =
POSTROUTING chain of the nat table; which is after any chain of the =
filter table.  so the rule in the filter table should always (hmmm...) =
use the actual IP assigned to the NIC of the host in question.

-j

