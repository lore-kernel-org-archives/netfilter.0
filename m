From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Help cofiguring new (private) subnet
Date: Tue, 15 Apr 2003 15:18:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DB8@alderaan.smgtec.com>
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
To: Net Filter Mailing List <netfilter@lists.netfilter.org>

Unless I am mistaken, a proper routing table entry should suffice for
your two private networks to talk to each other.

Gateway for Subnet1:
route add -net <SN2NetAddr>/<SN2NetMask> gw <iptablesmachine_SN1_side>

Gateway for Subnet2:
route add -net <SN1NetAddr>/<SN1NetMask> gw <iptablesmachine_SN2_side>

I don't think you have to do anything at all as long as the firewall is
the gateway for both subnets.

If you have iptables FORWARD table drop by default, add:

iptables -a FORWARD -i <sn1_if> -o <sn2_if>
iptables -a FORWARD -i <sn2_if> -o <sn1_if>

No filtering, no problems.


-----Original Message-----
From: Ashley M. Kirchner [mailto:ashley@pcraft.com]=20
Sent: Tuesday, April 15, 2003 2:54 PM
To: Net Filter Mailing List
Subject: Help cofiguring new (private) subnet


    I'm needing some help on configuring of my current iptables script=20
to expand onto a second subnet.  But before I posted the whole script=20
(from iptables-save) and a map layout of the network, I thought I'd ask=20
if there's anyone in specific that would like to help me out, or whether

I should just go ahead and post the whole shebang.

    The short gist of it is this:  I've used Oskar Andreasson's=20
rc.firewall script at http://iptables-tutorial.frozentux.net/ (linked=20
from www.iptables.com) to generate my initial firewall script between=20
our public internet address and the internal network.  However, I've now

added a third nic to the machine and configured it with a different=20
(private) network.  With the current firewall rules, I can not see=20
anyone on that new subnet...only those on the old one.  That's what I=20
need fixing.  That new subnet does NOT need forwarding like the first=20
one does, so I'm not worried about it...I do however need to see the=20
other systems on that subnet.

    There you go.  Anyone willing to help?





