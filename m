From: "Lionel Duboeuf" <lionel.duboeuf@adpsa12.org>
Subject: UDP port closed in an http request
Date: Tue, 21 Jan 2003 16:04:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002101c2c15e$5bb17bc0$0c1ca8c0@LionelDuboeuf>
Reply-To: "Lionel Duboeuf" <lionel.duboeuf@adpsa12.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,

Trying to explain my problem:
I've Linux Mandrake 8.0

I use iptables for filtering but this problem still exist with transforming
my linux box in a client of a network:

i can ping 193.252.19.189 but not www.wanadoo.fr
i can dig or nslookup www.wanadoo.fr which reports me 193.252.19.189
of course while i'm doing http://193.252.19.189 everythings works fine but
http://www.wanadoo.fr not.

my nameservers are OK ( 193.252.19.3 and .4 in resolv.conf)

I dumped the tcpdump result which give me a udp port unreachable:
(FJT hostname of my linuxbox, 192.168.01 is my gateway)

09:59:18.882158 FJT.32859 > 193.252.19.3.domain: 32456+ A? www.wanadoo.fr.
(32) (DF)

09:59:18.883391 FJT.32860 > 193.252.19.3.domain: 30805+ PTR?
3.19.252.193.in-addr.arpa. (43) (DF)

09:59:18.945537 192.168.0.1.domain > FJT.32859: 32456* 1/2/2 A
193.252.19.189 (115) (DF)

09:59:18.945582 FJT > 192.168.0.1: icmp: FJT udp port 32859 unreachable (DF)
[tos 0xc0]

09:59:18.949660 192.168.0.1.domain > FJT.32860: 30805* 1/2/2 (138) (DF)

09:59:18.949678 FJT > 192.168.0.1: icmp: FJT udp port 32860 unreachable (DF)
[tos 0xc0]

09:59:23.878466 arp who-has 192.168.0.1 tell FJT

09:59:23.878693 arp reply 192.168.0.1 is-at 0:a0:65:b5:71:5e


any help would be very nice.
Thanks a lot

Lionel Duboeuf





