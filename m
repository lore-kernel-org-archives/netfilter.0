From: Jordan Russell <jr-list-2005@quo.to>
Subject: Non-masqueraded address seeping out?
Date: Thu, 03 Nov 2005 22:47:00 -0600
Message-ID: <dkep45$vdb$1@sea.gmane.org>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I noticed something strange while trying to debug the previous problem I
posted about:

When I initiate a PPTP connection from a Windows 2000 machine through my
Linux 2.6.14 firewall, one of the packets is sent out the
Internet-connected interface with a non-masqueraded source address. Or
at least that's what tethereal and tcpdump claim; see the log below.
Notice that the packet at 0.040063 ("PPTP Outgoing-Call-Request") is
first sent with a source address of 10.10.10.1, then re-sent(?) 2.5
seconds later with a 'correct' source address of 24.24.24.224.

I see the same behavior regardless of whether ip_nat_pptp &
ip_conntrack_pptp are loaded.

Is there a logical explanation for this?
I'm curious to know whether connections would go through 2.5 seconds
faster if the 'misaddressed' packet were eliminated...

Thanks,
Jordan Russell


# tethereal -ni eth1 host 66.166.166.166
Capturing on eth1
  0.000000 24.24.24.224 -> 66.166.166.166 TCP 41824 > 1723 [SYN] Seq=0
Ack=0 Win=65535 Len=0 MSS=1460
  0.015359 66.166.166.166 -> 24.24.24.224 TCP 1723 > 41824 [SYN, ACK]
Seq=0 Ack=1 Win=5840 Len=0 MSS=1460
  0.015498 24.24.24.224 -> 66.166.166.166 TCP 41824 > 1723 [ACK] Seq=1
Ack=1 Win=65535 Len=0
  0.015542 24.24.24.224 -> 66.166.166.166 PPTP
Start-Control-Connection-Request
  0.033877 66.166.166.166 -> 24.24.24.224 TCP 1723 > 41824 [ACK] Seq=1
Ack=157 Win=5840 Len=0
  0.039882 66.166.166.166 -> 24.24.24.224 PPTP
Start-Control-Connection-Reply
  0.040063   10.10.10.1 -> 66.166.166.166 PPTP Outgoing-Call-Request
  2.603036 24.24.24.224 -> 66.166.166.166 PPTP Outgoing-Call-Request
  2.627212 66.166.166.166 -> 24.24.24.224 PPTP Outgoing-Call-Reply
  2.629100 24.24.24.224 -> 66.166.166.166 PPTP Set-Link-Info
  2.630681 66.166.166.166 -> 24.24.24.224 PPP LCP Configuration Request
  2.632082 24.24.24.224 -> 66.166.166.166 PPP LCP Configuration Request
  2.632102 24.24.24.224 -> 66.166.166.166 PPP LCP Configuration Ack
  2.651733 66.166.166.166 -> 24.24.24.224 PPP LCP Configuration Reject
  2.651973 24.24.24.224 -> 66.166.166.166 PPP LCP Configuration Request
  2.668760 66.166.166.166 -> 24.24.24.224 PPP LCP Configuration Ack
[...]

Legend:
10.10.10.1 is the LAN address of the PPTP client (Windows 2000)
24.24.24.224 is the Internet address of the Linux 2.6.14 NAT/firewall
66.166.166.166 is the Internet address of the remote PPTP server


