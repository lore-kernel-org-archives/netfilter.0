From: andilist@gmx.de
Subject: Delete connection tracking for udp connection
Date: Thu, 16 Dec 2004 07:55:04 +0100 (MET)
Message-ID: <21290.1103180104@www68.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello,
how can i delete an entry in /proc/net/ip_conntrack for a udp connection?

I am doing NAT and have the following problem:

An internal client sends a udp packet every 10 sekonds.
After the first packet the connection is listet in /proc/net/ip_conntrack.
eg:
source: 192.168.1.1
destionatin: 1.2.3.4
NAT
destionatin: external ip of nat machine (3.4.5.6
source: 1.2.3.4
State: Assured
Timeout: 180-170 (sends every 10 seconds)

now, my external address changes (from 3.4.5.6 -> 4.5.6.7) (reconnect to the
internet).
My problem is, that in /proc/net/ip_conntrack the old address (3.4.5.6) is
listed
How can i delete the connection tracking manually (on reconnect; on change
of external address)?  it will never reach the timeout because the client
sends a new packet every 10 seconds.

Or, is there a possibility to change the ip-address in the connection
tracking table?

Regards 
Andreas



-- 
GMX ProMail mit bestem Virenschutz http://www.gmx.net/de/go/mail
+++ Empfehlung der Redaktion +++ Internet Professionell 10/04 +++

