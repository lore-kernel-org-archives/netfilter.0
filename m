From: Geoff Silver <geoff@uslinux.net>
Subject: DNAT problem
Date: Wed, 27 Nov 2002 14:28:10 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211271417310.12858-100000@mail.uslinux.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'll preface this by saying I'm not subscribed to the list, so if anyone
who can help would CC me, that would be appreciated.  Thanks!

I have a 3-way firewall doing DNAT from a public address space (66.243
net) to a private address space (10.102 net).  Everything works, except
when I'm on the DMZ and try to reach another DMZ machine through it's
public IP.  The requests traverse the DNAT rule which *should* translate
them to their 10.102 destination address (and it works from my LAN or from
the internet), but instead the address isn't rewritten.

Example:  public IP is 66.243.73.184 which is NAT'd to 10.102.1.2.  If I
tcpdump on 10.102.1.2 and use a web browser from an internet host
(somewhere else in the world), I see something like:

14:25:00.353543 152.163.190.1.38300 > 10.102.1.2.80: S
3550573715:3550573715(0) win 24820 <nop,nop,sackOK,mss 1412> (DF) [tos
0x10]
14:25:00.353578 10.102.1.2.80 > 152.163.190.1.38300: S
1480002886:1480002886(0) ack 3550573716 win 15532 <mss
1412,nop,nop,sackOK> (DF)
14:25:00.423200 152.163.190.1.38300 > 10.102.1.2.80: . ack 1 win 25416
(DF) [tos 0x10]
14:25:01.333833 152.163.190.1.38300 > 10.102.1.2.80: P 1:6(5) ack 1 win
25416 (DF) [tos 0x10]

However, if I tcpdump and try the same thing from the host itself, I see:

13:59:42.698619 10.102.1.2.3024 > 66.243.73.184.80: S
4167737472:4167737472(0) win 16060 <mss 1460,sackOK,timestamp 25440395
0,nop,wscale 0> (DF) [tos 0x10]

Since I can look at the number of packets sent over the DNAT rule via
'iptables -t nat -v -L' and *see* the number of packets changing
corresponding to the number sent (and the intervals sent), I'm *sure* the
packets are traversing that rule, but not getting NAT'ed.  Does anyone
have any ideas *why* this might be happening?  Is this a bug?  Does anyone
perhaps have a workaround for it?  I could run split-DNS (DNS-views) or IP
alias the server, but it's a kludge, and I really *want* my firewall to do
the translation right.

Thanks!


