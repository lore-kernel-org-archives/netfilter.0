From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: OUTPUT chain DNAT problem
Date: Thu, 3 Jul 2003 08:14:50 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BEC7@wardrive.citadelcomputer.com.au>
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
To: admin@flshlnk.com, netfilter@lists.netfilter.org

There was a problem in the old days where NAT for OUTPUT was broken. Not =
sure if this is the same case still or not, if so then you'll need to =
use the -p-o-m patch to fix the problem and it'll work.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Fox [mailto:admin@flshlnk.com]
Sent: Wednesday, July 02, 2003 8:57 PM
To: netfilter@lists.netfilter.org
Subject: OUTPUT chain DNAT problem


Hi.

I'm having problems with rewriting outgoing packets.
I've specified the following rule:
iptables -t nat -A OUTPUT -d 10.0.0.2 -j DNAT --to-destination
192.168.0.2

When I ping 10.0.0.2 i get them rewritten (i check it with tcpdump and
get stats with `iptables -t nat -L -v -n`). But when an application
sends a packet to 10.0.0.2 it's not rewritten. I can't understand why.

I need to to the following thing:

A              B                C
10.0.0.2  ---> 192.168.0.1 ---> 192.168.0.2

A send requests to B and B replies to A. But i want those replies go
to C and only C.

Your help is appreciated.
thanks.
fox



