From: Phil Radden <phil-netfilter@frogtop.com>
Subject: Lost packets, un-masqueraded retransmits
Date: Thu, 1 Sep 2005 23:07:47 +0100 (BST)
Message-ID: <Pine.LNX.4.44.0509012224260.4223-100000@rhubarb.frogtop.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I'm seeing some very strange problems which I believe are at least half 
netfilter issues - my apologies if not!  I hope you can help me.

I have a Fedora Core 4 system (2.6.12-ish, iptables 1.3.0-ish) acting as a 
masquerading gateway between an ethernet network (MTU 1500) and a PPPoATM 
connection (MTU 1492).  
I've simplified things to a single iptables rule,
  -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
with net.ipv4.ip_forward=1, and can reproduce the problem.

Machines on the internal network are unable to access certain websites (the 
homepage of www.nationalrail.co.uk, for example).  It appears that large 
packets are being dropped, but also, whilst snooping to debug, I saw 
unmasqueraded packets being leaked out.

Snooping on the LAN address of the gateway I see (eg.):

No.     Time        Source                Destination           Protocol Info
      1 0.000000    192.168.31.191        213.174.202.41        TCP      1851 > http [SYN] Seq=0 Ack=0 Win=65535 Len=0 MSS=1460
      2 0.018139    213.174.202.41        192.168.31.191        TCP      http > 1851 [SYN, ACK] Seq=0 Ack=1 Win=32767 Len=0 MSS=16856
      3 0.018416    192.168.31.191        213.174.202.41        TCP      1851 > http [ACK] Seq=1 Ack=1 Win=65535 Len=0
      4 0.020234    192.168.31.191        213.174.202.41        HTTP     GET /live/styles/main/home.css HTTP/1.1
      5 0.051078    213.174.202.41        192.168.31.191        TCP      http > 1851 [ACK] Seq=1 Ack=408 Win=32767 Len=0
      6 0.054043    213.174.202.41        192.168.31.191        HTTP     Continuation or non-HTTP traffic
      7 0.054246    192.168.31.191        213.174.202.41        TCP      [TCP Dup ACK 3#1] 1851 > http [ACK] Seq=408 Ack=1 Win=65535 Len=0 SLE=1461 SRE=1674
     10 16.051440   192.168.31.191        213.174.202.41        TCP      1845 > http [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
     11 54.377013   192.168.31.191        213.174.202.41        TCP      [TCP Retransmission] 1845 > http [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0

(packet 6 was seq 1461, ack 408, len 213).  As you can see, a 1460-byte 
packet went missing between packets 5 and 6.

Snooping on ppp0, I see nearly the same thing, with the internal IP address 
replaced by the external IP (correctly, by the masquerading rule).  Once 
again, the 1460-byte packet is missing.  However, and worryingly, the 
retransmitted packet, packet 11, and subsequent retransmissions, _appear_ 
(according to tcpdump and ethereal) to still have the original (RFC1918) 
source address.  Is this a config error, a reporting error or a bug? :)

Snooping at the endpoint (213.174.202.41 in this example) showed:

21:34:43.491939 85.210.143.231.1851 > 213.174.202.41.http: S 2346403573:2346403573(0) win 65535 <mss 1460,nop,nop,sackOK> (DF)
21:34:43.492005 213.174.202.41.http > 213.174.202.41.1851: S 4283534505:4283534505(0) ack 2346403574 win 32767 <mss 16856,nop,nop,sackOK> (DF)
21:34:43.509632 85.210.143.231.1851 > 213.174.202.41.http: . ack 1 win 65535 (DF)
21:34:43.524462 85.210.143.231.1851 > 213.174.202.41.http: P 1:408(407) ack 1 win 65535 (DF)
21:34:43.524484 213.174.202.41.http > 85.210.143.231.1851: . ack 408 win 32767 (DF)
21:34:43.525913 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
21:34:43.525935 213.174.202.41.http > 85.210.143.231.1851: P 1461:1674(213) ack 408 win 32767 (DF)
21:34:43.544692 85.210.143.231.1851 > 213.174.202.41.http: . ack 1 win 65535 <nop,nop,sack sack 1 {1461:1674} > (DF)
21:34:46.528362 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
21:34:52.527773 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
21:35:04.526655 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
21:35:28.524181 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)

Everything matches up, and you can see the 1460-byte packets going out, 
which never make it.  But the reason I think this part of the problem is 
potentially netfilter related, rather than a connection configuration 
issue, is that the gateway box itself can access all of these affected site 
with no problem at all!

I'd be grateful for any suggestions, I've currently run out of ideas of 
things to try...

Thanks,
Phil


