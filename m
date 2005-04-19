From: "Doug C" <the_wasp@game-nation.net.nz>
Subject: Remapping of starcraft UDP port 6112
Date: Tue, 19 Apr 2005 18:58:23 +1200
Message-ID: <001001c544af$d2bd15e0$3800a8c0@Dewasp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

hi there everyone

i play starcraft which uses udp port 6112 all is fine unless i want 2 =
local comps in the same game. (changing the game port is no longer =
supported as blizzard feels that starcraft is "nat-friendly", however =
warcraft3 supports this feature)

i have attempted to write iptable configs to remap the ports but none =
have worked =3D(

i need a fully working normal nat/ip masq for other games like counter =
strike and for normal downloading/browsing/email etc as well as:

ClientA:
outgoing traffic on udp port 6112 from clientA to be remapped to where =
its already going udp port 60001
incomming traffic on udp port 60001 needs to be remapped back to clientA =
on upd port 6112

CLientB:
outgoing traffic on udp port 6112 from clientB to be remapped to where =
its already going udp port 60002
incomming traffic on udp port 60002needs to be remapped back to clientB =
on upd port 6112

so far i have:
*************************************************************************=
*****************************************************
ADSL=3D$(/sbin/ifconfig hsb0 | grep "inet addr" | awk -F: '{print $2}' | =
awk '{print $1}'|sed -n 1p)

iptables -A PREROUTING -t nat -j DNAT -p udp -d $ADSL --dport 63001 =
--to-destination 192.168.0.3:6112
iptables -A POSTROUTING -t nat -j SNAT -p udp -s $ADSL --sport 6112 =
--to-source 192.168.0.3:63001

iptables -A PREROUTING -t nat -j DNAT -p udp -d $ADSL --dport 63002 =
--to-destination 192.168.0.56:6112
iptables -A POSTROUTING -t nat -j SNAT -p udp -s $ADSL --sport 6112 =
--to-source 192.168.0.56:63002
*************************************************************************=
*****************************************************

starcraft sends the game packets to all other clients in the game, it =
does not work by sending them via a server then the server sending them =
to the client
ips of other people in the game will ovbiously be different from game to =
game
i hope you can help me

cheers
Doug
