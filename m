From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 15:30:15 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051304@asimail2.alphanumeric.com>
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

> I have a SonicWall Pro 330 that's giving me no end of grief, and so I
> want to replace it. It's my primary firewall. Becase we have two LANs
> and the SonicWall only has one LAN port, I have an iptables
> router/firewall that's connected to the LAN port of the SonicWall. The
> two LANs hang off of the iptables machine. The SonicWall provides our
> DMZ, as well.
>
> I want to collapse the two systems into one, but I'm not quite sure =
how
> to do it.
>
> I want one iptables-based firewall, with four NICs, that connect to =
our
> external router, our DMZ switch, and each of our two internal LAN =
switches.
>
> I believe I know how to set it up so that traffic from either internal
> LAN gets NAT'd to the firewall's external IP address, for traffic =
headed
> to the Internet, and de-NAT'd on the way back. I also believe I know =
how
> to allow traffic to flow back and forth between the two LANs, where
> NAT'ing isn't needed.

just to be clear:

	iptables -t nat -A POSTROUTING -o $EXTERNAL_IF \
	  -s $INTERNAL_NET_1 -j SNAT --to-source $EXTERNAL_IP

	iptables -t nat -A POSTROUTING -o $EXTERNAL_IF \
	  -s $INTERNAL_NET_2 -j SNAT --to-source $EXTERNAL_IP

> However, I'm not sure how to handle the external network and the DMZ. =
We
> have a /28 subnet from our ISP. Our router uses one address on the
> subnet. From the router, you proceed to a switch, where three devices
> are plugged in: a wireless access point, a VPN device, and the =
external
> interface of the SonicWall firewall. All three devices have addresses =
on
> the same /28 subnet as the router. Additionally, the SonicWall's DMZ
> interface does not have and address assigned to it - it is somehow
> logically bridged to the external interface. The systems in the DMZ =
are
> also on the same /28 subnet. You tell the SonicWall which IP addresses
> are in use in the DMZ, so that it knows which interface to send =
traffic
> for that subnet out of. Internal traffice, heading out either the
> external or DMZ interfaces of the SonicWall, appear to come from the
> external address of the SonicWall. I have no idea how to replicate =
this
> setup under iptables.

if you desire to replicate this exactly with netfilter, you would create =
a bridge between the external and DMZ interfaces (man 8 brctl), and use =
ebtables to do the bridge filtering (http://ebtables.sourceforge.net/).

your other option could be to leave the /28 of public space outside the =
firewall, re-address the DMZ hosts to use private space, and setup =
one-to-one NATs for the DMZ hosts, and keep your firewall solely layer 3 =
(my bias--i love the routing).

> Lastly, some systems in the DMZ need to access database servers on one
> of the internal LANs. The LANs use private, non-routable address space
> (192.168.32.0 & 192.168.40.0). So, I need certain systems in the DMZ, =
to
> be able to initiate connections through the firewall, to systems on my
> 40-net. No NAT'ing is needed for these connections, but I'm not sure =
how
> to set them up, either. On the SonicWall, we just put a rule in that
> allows it, and two static routes, so it knows to forward traffic for
> those nets to the linux box. Somehow I think it isn't as simple under
> iptables, but hopefully I'm wrong.

well--the linux box in the new scenario will be directly connected to =
those LANs (as it is now)--so you won't need static routes to them.  you =
will need rules that allow the DMZ hosts to connect, though:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  iptables -A FORWARD -i $DMZ_IF -o $LAN_IF1 -p tcp --syn \
    -s $DMZ_HOST --sport 1024:65535 -d $LAN_HOST --dport $DB_PORT -j =
ACCEPT

  [ repeat as necessary ]

> Sorry for the length of this, but I wanted to try and describe it all
> accurately. I've never set up an iptables firewall that is so
> (seemingly) complicated before.

let me know what i missed.

-j

