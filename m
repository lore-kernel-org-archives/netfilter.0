From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Problem with ssh
Date: Wed, 25 Aug 2004 08:31:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512CD@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi all,
>
> First off, a feeble attempt at diagramming my setup :
>
> 192.168.200.x   eth -> eth  Embedded Linux Wireless  ppp -> ppp =
Embedded
> Linux Access Point eth0 -> 192.168.1.x
>
> The two Embedded Linux Wireless boxes are actually what I am working =
on.
> The second one in the list above is configured as a bridge, and =
doesn't
> currently have any firewalling (because I haven't figured out whether =
I
> need ebtables or iptables, but that's another story).
>
> The client side wireless box (on the left) has the following rule in =
it :
>
> $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.200.0/16 -j =
DROP

192.168.200.0/16 =3D=3D 192.168.0.0 - 192.168.255.255

try using 192.168.200.0/24; and if that wasn't a typo, reading up on IP =
subnetting.

-j

