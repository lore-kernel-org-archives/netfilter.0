From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Help needed with ESP and DNAT on Debian 2.4.26 / iptables
	1.2.9-10
Date: Sat, 28 Aug 2004 14:19:20 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512FB@asimail2.alphanumeric.com>
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

> Hi there!
>
> I need help getting DNAT to work with ESP packets on a Debian box
> ('testing/sarge' release, 2.4.26 kernel, iptables 1.2.9-10). This used
> to work fine on a RH90...
>
> This is used to suport a laptop running XP Pro logging in to a =
corporate
> VPN with the Nortel VPN client. Company policy and authentication
> requirements prevent me from changing anything in that setup (so I =
can't
> change the VPN to terminate AT the Linux box for example).
>
> My problem is: incoming ESP packets are not being DNATed as I wanted
> them to. The rule I use is:
> -A PREROUTING -p esp -s <VPN server> -j DNAT --to-destination <laptop>
>
> The rule does get hit into (I have a mirror rule with -j LOG), but the
> translation does NOT happen.

that rule will only get hit if a packet initializing a connection comes =
from the contivity.

normally--the VPN tunnel will be initiated by your VPN client, and if =
you are using outbound NAT + connection tracking; the replies from the =
VPN gateway will be caught by your "-m state --state ESTABLISHED" rule.

i.e.:

client:500 -> vpngw:500
client:esp -> vpngw:esp

i have learned; however, that having a DNAT & filter rule that allows =
UDP 500 from the VPN gw to the client is useful for when the client is =
idle for long periods of time, and the VPN gw wants to rekey the tunnel.

> Like I said, it used to work fine when the server was a RH90.
>
> How do I begin troubleshooting this? Some things I tried so far are:
> - try to DNAT ALL traffic (not just -p esp)
> - force ipt_esp to load (modprobe ipt_esp and yes, it is under
> /lib/modules/<kernel>/kernel/ipv4/netfilter)

the esp module is only useful with manual keying, not with IKE, as it =
matches on SPI.

> - tried doing an SNAT on the preceding UDP/500 connection to maybe =
trick
> netfilter into understanding the ESP part later
>
> Naturally, I have tcpdump logs, syslogs, etc... for further analysis,
> but I'm weak when it comes to netfilter troubleshooting...

maybe some idea about the network topology, ip address, and the =
ever-famous output of:
  iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL

you *might* possibly be focusing you energies on the wrong aspect--i =
asuume your goal is to make the VPN client work; whether that requires a =
DNAT a ESP traffic or not (it absolutely should not, btw).

-j


