From: "Miguel Laborde" <Miguel.Laborde@qlogitek.com>
Subject: -j SNAT question
Date: Wed, 29 Oct 2003 15:38:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5A9EB3555F2D04AB1EE3DD6C748C4758BB863@qlmail.qlogitek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Hello all,

	I'm in the process of rewriting some rules for my firewall, but there's =
one thing that is on my mind about SNATing that I can't quite figure =
out. From looking at a few example scripts I see that its suggested to =
use SNATing instead of MASQUERADE-ing if you have a static IP. As it so =
happens I have about 10 static IPs, with the usual array of servers in =
the DMZ such as web/ftp/etc. What I currently do is DNAT in the =
PREROUTING chain to my DMZ addresses for these machines, and then in the =
POSTROUTING chain i -J SNAT to my main firewall IP. This is where the =
question arises. Lets assume the following:

	EXT_IP_FW =3D 10.0.0.1
	EXT_IP_WEB =3D 10.0.0.2
	DMZ_IP_WEB =3D 172.16.38.4

So I'm doing the following for the PREROUTING stage:
	IPTABLES -A PREROUTING -t nat -p tcp -d $EXT_IP_WEB --dport 80 -j DNAT =
--to $DMZ_IP_WEB:80

	So here I've DNAT'd it to the DMZ. Now this is my POSTROUTING rule:

	IPTABLES -A POSTROUTING -t nat -j SNAT --to $EXT_IP_FW

	So everything that goes out through my firewall is source nat'd to the =
firewall's IP. This is where I'm confused.. mostly by the fact that this =
kind of setup appears to work while I think it shouldn't. If a client =
sends a SYN packet with the destination IP of EXT_IP_WEB and then gets a =
ACK packet back with the source IP set to EXT_IP_FW won't it wonder what =
the heck is going on and just ignore it?!=20

	Thanks!=20

