From: jonathan@innovativesource.net
Subject: Forward to DMZ addresses
Date: Sat, 13 Aug 2005 13:19:55 -0500 (CDT)
Message-ID: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>
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

I have a machine that I using as a firewall, separting WAN / LAN / DMZ

Rules thus far are to NAT all outgoing packets that come in from the LAN
interface.

From the machine itself, I can ping machines on my DMZ interface (eth2)
and my LAN interface (eth0)

I'm having trouble getting through the firewall to my DMZ machines, but I
can access the NIC that routes to the DMZ machine via SSH...  I've tried
various forwarding rules, and even changed the default FORWARD policy to
ACCEPT anything.  Here is a basic rule I'm trying:

#eth1 =3D WAN NIC
#eth2 =3D DMZ NIC
iptables -A FORWARD -i eth1 -o eth2 -d xx.xx.xx.xx  -p tcp --dport 22 -j
ACCEPT

now, if I do a netstat on the firewall nothing... if I do a netstat on th=
e
machine I'm attempting to connect from... all I see is SYN_SENT

**I'm trying from external machines...i.e. machines not on my network.

physical network is

router -> vlan -> firewall -> DMZ
router -> vlan -> firewall -> LAN

I can also access the DMZ machine via the firewall itself and vice versa,
but once logged into the DMZ machine, I can't get to anything past the
firewall.  I have the following rules for that

iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT

Kinda confused here...

the LAN stuff works... at least for now... to simply forward the packets
out through the WAN NIC and NAT them...

*shrug*




