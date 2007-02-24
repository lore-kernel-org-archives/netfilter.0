From: "Alec Matusis" <alecm@chatango.com>
Subject: "distributed router" question
Date: Fri, 23 Feb 2007 22:50:19 -0800
Message-ID: <9494.44433576918$1172303504@news.gmane.org>
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

I am wondering if I am doing something legitimate, or it's against TCP/IP (I
am a physicist by education, so I do not know):

I have box A that has one connection to WAN and one connection to LAN. On
box A, eth0 has a public ip 1.2.3.4 and eth1 has a private ip 10.0.0.1

I have box B that also has one connection to WAN and another one to the same
LAN. On B, eth0 has a public ip 5.6.7.8 and eth1 has a private ip 10.0.0.2

I configured iptables in box A to forward packets destined for 1.2.3.4:3000
to the destination 10.0.0.2:3000 , i.e. to box B. This part works, I checked
with tcpdumps.

Now, the box B after receiving a SYN packet via box A on eth1, sends an ACK
packet directly through its WAN interface eth0 to the client. If I do not
configure POSTROUTING SNAT , those ACK packets appear to originate from
10.0.0.2, so they are rejected by the client. 
My question is: if I configure SNAT on box B so that ACK packets appear to
come from box A (i.e. from 1.2.3.4), would this be a legitimate
configuration?

In other words, a SYN packet is sent to one machine, forwarded via LAN to
another machine, and the ACK packet is sent from the second machine having
the source ip of the first machine. For that matter, all incoming packets
from the client are received by A, then forwarded to B, and all response
packets are sent directly from B to the client. Is this a legitimate
configuration?



