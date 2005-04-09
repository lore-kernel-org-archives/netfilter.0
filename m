From: "Tom Cruickshank" <tcruicksh@gmail.com>
Subject: question regarding pptp
Date: Sat, 9 Apr 2005 18:27:09 -0400
Message-ID: <42585697.3a8f454b.74e6.34dc@mx.gmail.com>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hello,

     I have a question regarding pptp. I=92ve read through many =
documentations
and so far not sure what I=92ve been doing wrong.

=20

I have a linux box which acts as a firewall. Port 1723 is ported to a
windows RAS box inside the internal network.

=20

Here is what were my iptables rules.

=20

Iptables =96A PREROUTING =96t nat =96p tcp =96d xxx.xxx.xxx.xxx  =
=96dport 1723 =96j DNAT
=96to yyy.yyy.yyy.yyy:1723

Iptables =96append FORWARD =96s yyy.yyy.yyy.0/24 =96j ACCEPT

Iptables =96table nat =96append POSTROUTING =96out-interface ppp0 =96j =
MASQUERADE

Iptables =96append FORWARD =96p 47 =96s yyy.yyy.yyy.0/24 =96j ACCEPT

=20

xxx.xxx.xxx.xxx =3D external IP

yyy.yyy.yyy.yyy =3D internal ip (ip for windows server)

=20

I was able to connect to the vpn server without any problems. Then the
external IP changed.

=20

After changing the external IP in the iptables info, I keep getting=20

=20

A connection between the VPN server and the VPN client xxx.xxx.xxx.xxx =
has
been established, but the VPN connection cannot be completed. The most
common cause for this is that a firewall or router between the VPN =
server
and the VPN client is not configured to allow Generic Routing =
Encapsulation
(GRE) packets (protocol 47). Verify that the firewalls and routers =
between
your VPN server and the Internet allow GRE packets. Make sure the =
firewalls
and routers on the user's network are also configured to allow GRE =
packets.
If the problem persists, have the user contact the Internet service =
provider
(ISP) to determine whether the ISP might be blocking GRE packets.

=20

For more information, see Help and Support Center at

=20

As far as I can tell, the GRE packets SHOULD be going through.

=20

I=92ve modified the Iptables to something like this without any success.

=20

iptables -A PREROUTING -t nat -p tcp -d xxx.xxx.xxx.xxx --dport 1723 -j =
DNAT
--to yyy.yyy.yyy.yyy:1723

=20

iptables -m state -A FORWARD -p tcp -s xxx.xxx.xxx.xxx/32 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p udp -s xxx.xxx.xxx.xxx/32 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p tcp -s yyy.yyy.yyy.0/24 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p udp -s yyy.yyy.yyy.0/24 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p 47 -s xxx.xxx.xxx.xxx/32 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p 47 -s yyy.yyy.yyy.0/24 --state NEW -j =
ACCEPT

=20

iptables -m state -A FORWARD -p 47 --state ESTABLISHED,RELATED -j ACCEPT

iptables -m state -A FORWARD -p tcp --state ESTABLISHED,RELATED -j =
ACCEPT

iptables -m state -A FORWARD -p udp --state ESTABLISHED,RELATED -j =
ACCEPT

=20

iptables -A input -p 47 -s yyy.yyy.yyy.0/24 -d xxx.xxx.xxx.xxx -j ACCEPT

iptables --append FORWARD -p tcp --destination-port 1723 --jump ACCEPT

=20

iptables --table nat --append POSTROUTING --out-interface ppp0 -j =
MASQUERADE

iptables --append FORWARD -s yyy.yyy.yyy.0/24 -j ACCEPT

=20

Would anyone have a clue what I might be doing wrong? Would appreciate =
any
assistance. Thanks!

=20

Sincerely,

=20

Tom Cruickshank


--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.308 / Virus Database: 266.9.5 - Release Date: 4/7/2005
=20
