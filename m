From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: How to allow Real Player
Date: Tue, 12 Aug 2003 21:56:31 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3614e$e5eeed50$0400a8c0@bradmorgan>
References: <000c01c35b2e$2de52100$d90315ac@rsrc.be.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c35b2e$2de52100$d90315ac@rsrc.be.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "'Netfilter (E-mail)'" <netfilter@lists.netfilter.org>

I'm trying to understand how to setup my firewall to allow Real Player.
Based on the text below, I've written the following rules:=20

## Allow Real Player
for i in $LANIPS; do
  iptables -A FORWARD -p tcp -s $i --dport 554 -j ACCEPT
  iptables -A FORWARD -p tcp -s $i --dport 7070 -j ACCEPT
done
iptables -A FORWARD -p udp --dport 6970:6979 -j ACCEPT

I limited the number of UDP ports to a much smaller range than they =
suggest.

This network has both public IP addresses and NAT addresses (a =
conversion to
use just the NAT address range is taking place).  My test user is on one =
of
the NAT addresses.

What I don't understand is the statement "The range of UDP ports, on the
other hand, carries the incoming stream. These ports begin to carry =
traffic
only after RealPlayer and RealServer have performed the authentication
routine, and should be enabled only for incoming traffic."

Is the firewall going to know what to do with an incoming packet to one =
of
these UDP ports?  If the internal machine initiated the conversation, =
then
ESTABLISHED would know what to do, but that would be outgoing traffic =
which
the documentation says won't happen.

Is this another one of those applications that needs a "helper"?  Does =
one
exist?  I looked but couldn't find it.

Strange thing is, the user's web cast worked after adding the above =
rules,
but capturing the traffic using Ethereal didn't show any UDP traffic at =
all,
only TCP and RSTP on 554.  I did however, see realplayer.exe listening =
on
UDP port 6970.

Thanks for your insight.

Regards,

Brad Morgan  =20

----- Excerpt from http://service.real.com/firewall/adminfw.html -----

Application-level Firewalls=20

Your firewall must be RealPlayer-aware. If it is not, RealNetworks has a
free RTSP proxy service which includes source code and specifications =
for
building your own proxy. It's simple and easy to set up. To get your =
copy,
send an e-mail request to firewall@real.com. You will get an immediate
response telling you where to download the proxy.=20

Most major firewall vendors support RealPlayer. If your firewall vendor =
is
not listed as supporting RealPlayer, ask your firewall representative to
contact us about joining our firewall developers program.=20


Network-level Firewalls

Network-level firewalls, such as packet filters, use access control =
lists to
allow traffic destined for some ports to pass from the Internet to the
organization's internal network and to block packets for other ports. To
allow any version of RealAudio Player or RealPlayer to play correctly, =
it is
only necessary for the router to allow packets to pass to the inner =
network
that are bound for the following range of ports:

TCP port 7070 for connecting to pre-G2 RealServers
TCP port 554 and 7070 for connecting to G2 RealServers=20

UDP ports 6970 - 7170 (inclusive) for incoming traffic only=20

The TCP port is used by RealPlayer to initiate a conversation with an
external RealServer, to authenticate RealPlayer to the server, and to =
pass
control messages during playback (such as pausing or stopping the =
stream).
RealSystem G2 uses two TCP protocols for conversations between Players =
and
Servers.=20

For an even safer firewall, configure the router's access control list =
to
allow TCP connections on port 7070 and/or port 554 to be initiated from =
the
inside network exclusively. Incoming traffic, on the other hand, should =
only
be allowed if it is part of an ongoing connection. This is assured by
requiring incoming TCP packets to have the ACK bit set in the TCP header
carried by every packet. The syntax for setting the ACK bit varies with =
the
kind of router you own. For Cisco routers the flag "ESTABLISHED" can be =
put
at the end of the line in an access rule to specify that an incoming =
packet
must be part of an ongoing conversation.=20

The range of UDP ports, on the other hand, carries the incoming stream.
These ports begin to carry traffic only after RealPlayer and RealServer =
have
performed the authentication routine, and should be enabled only for
incoming traffic.=20

You may also want to use a proxy server in conjunction with a =
network-level
firewall.=20

=20




