From: Tom Fischer <tom.fischer@ebuz.de>
Subject: DNAT-Problem
Date: Thu, 9 Sep 2004 04:10:47 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040909041047.7f8457cf@nixe>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

i have a problem with DNAT. We have to move some services for a few days
on another machine. So we want do DNAT on incoming Packets. I set

iptables -A PREROUTING -t nat -s 0/0 -d xxx.xxx.xxx.xxx -p tcp --dport
9000-j DNAT --to xxx.xxx.xxx.xxx

Should be enough on this box in my opinion. So i can see the Packet
incoming on the old machine, and i can see the Packet with my Source IP
and the new destination IP, but i think the packet never leaves the old
machine. tcpdump looks like this

[root@server4 mysql]# tcpdump -n port 9000
tcpdump: listening on eth0
04:02:04.746105 217.232.189.4.65423 > oldmachine.9000: S
740515023:740515023(0) win 5840 <mss 1452,sackOK,timestamp 66069311
0,nop,wscale 7> (DF) [tos 0x70] 
04:02:04.746151 217.232.189.4.65423 > newmachine.70.9000: S
740515023:740515023(0) win 5840 <mss 1452,sackOK,timestamp 66069311
0,nop,wscale 7> (DF) [tos 0x70] 
04:02:07.744772 217.232.189.4.65423 > oldmachine.9000: S
740515023:740515023(0) win 5840 <mss 1452,sackOK,timestamp 66072311
0,nop,wscale 7> (DF) [tos 0x70] 
04:02:07.744806 217.232.189.4.65423 > newmachine.9000: S
740515023:740515023(0) win 5840 <mss 1452,sackOK,timestamp 66072311
0,nop,wscale 7> (DF) [tos 0x70] 

The packet never arivves on the new machine. What am I missing?

Kernel is 2.4.27, the box seems to be Fedora Core 2 and iptables is
Version 1.2.7a.

Anybody can help me out?

Tom 

