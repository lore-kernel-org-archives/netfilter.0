From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Forwarding a port on the LAN
Date: Mon, 7 Jul 2003 08:18:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BEE6@wardrive.citadelcomputer.com.au>
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
To: Internet Protocol version Six <inet6@mail.be>, netfilter@lists.netfilter.org

if your going from LAN to LAN and want a port redirect to another =
machine on the LAN there is one important thing to remember.
When you connect to port 1600 on the router, this would rewrite the =
destination address to the internal port 23 machine which is fine, the =
problem is the return packet which is still marked with the original =
senders address.
The machine on port 23 will return directly to you and not back via the =
router which your machine will respond by dropping the packet as there's =
no internal tracking for it.

In basic words, write a POSTROUTE and SNAT/MASQ the internal LAN source =
address to be the router so it goes back via the router and connection =
tracking returns it to the sender.

Problems with this will be that the machine on port 23 will always see =
the router no matter how many other machines on the LAN telnet to =
192.168.0.1:1600. All connections will appear from the router... much =
like an external website sees normal MASQUERADEd clients behind a =
firewall.

Hope this info helps.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Internet Protocol version Six [mailto:inet6@mail.be]
Sent: Sunday, July 06, 2003 2:42 PM
To: netfilter@lists.netfilter.org
Subject: Forwarding a port on the LAN


I want to forward a connection to the router (192.168.0.1:1600) to =
192.168.0.2:23 which from the Internet works fine, however if I connect =
from a LAN machine (192.168.0.3) to the router on port 1600 I get a =
"Connection timed out". I use the following rule:

iptables -I PREROUTING -t nat -p tcp --dport 1600 -j DNAT --to =
192.168.0.2:23

I don't see anything wrong with this, or am I forgetting something?

wkg,

-----------------------------------------------------
Mail.be, WebMail and Virtual Office
http://www.mail.be



