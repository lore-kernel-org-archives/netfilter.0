From: "Support Team" <support@precisenetworksinc.com>
Subject: iptables not responding to packets destined for subinterface
Date: Sat, 30 Oct 2004 23:12:55 -0600
Message-ID: <000301c4bf08$4ae54700$6601a8c0@CHELA>
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

My public interface has serveral IP address aliases.  Only the primary =
IP
address responds to traffic (ip, imcp, et al).  I inserted a log =
statement
at the top of each table and found that the packets destined for the =
virtual
addresses never made it to any table.  However, according to tcpdump, I
confirmed that the packets did get picked up by the kernel on the =
secondary
address.  I guess they are just not passed to iptables.  Obviously, the
packet was never replied to (icmp) or acknowledged (ip) by the process.

How can I get iptables to respond to the packets on the secondary
interfaces?  Or, how can I get the kernel to pass the packets to =
iptables?

I understand that when the packet hits the chain, all I have to do is =
create
a rule with the primary interface and use the IP address to distinguish =
the
packets of different virtual addresses.

If you are looking for more detail, see the email I sent on Sun, 24 Oct, =
at
9:28 p.m. (GMT -6).

Thanks for your help!


