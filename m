From: "Gary Smith" <gary@primeexalia.com>
Subject: RE: iptables not responding to packets destined for subinterface
Date: Sat, 30 Oct 2004 22:23:53 -0700
Message-ID: <21245695958BF041875A6C39D08F9EBA0232CD@vjo-mails-03.primeexalia.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Support Team <support@precisenetworksinc.com>, netfilter@lists.netfilter.org

I don't think that you can.  I think that you also answered your own
question being that you must use the primary interface and use the
target destination IP address.  This is what we currently do on our
firewall with 126 IP's (125 are aliases).  All of the firewall traffic
is answered by the firewall and then NAT'd in/out using iptables. =20

Gary Wayne Smith


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Support Team
Sent: Saturday, October 30, 2004 10:13 PM
To: netfilter@lists.netfilter.org
Subject: iptables not responding to packets destined for subinterface

My public interface has serveral IP address aliases.  Only the primary
IP
address responds to traffic (ip, imcp, et al).  I inserted a log
statement
at the top of each table and found that the packets destined for the
virtual
addresses never made it to any table.  However, according to tcpdump, I
confirmed that the packets did get picked up by the kernel on the
secondary
address.  I guess they are just not passed to iptables.  Obviously, the
packet was never replied to (icmp) or acknowledged (ip) by the process.

How can I get iptables to respond to the packets on the secondary
interfaces?  Or, how can I get the kernel to pass the packets to
iptables?

I understand that when the packet hits the chain, all I have to do is
create
a rule with the primary interface and use the IP address to distinguish
the
packets of different virtual addresses.

If you are looking for more detail, see the email I sent on Sun, 24 Oct,
at
9:28 p.m. (GMT -6).

Thanks for your help!




