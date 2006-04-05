From: "Jan den Ouden (ml)" <jan.ml@denouden.info>
Subject: bad tcp checksum
Date: Wed, 05 Apr 2006 16:51:02 +0100
Message-ID: <4433E766.9080409@denouden.info>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

I'm seeing a strange problem with kernel 2.6.12 Xen domain0 with all 
netfilter options compiled in. I'm trying to do port forwarding to an 
internal machine from an internet gateway box.

What works ok is forwarding from gateway:143 to internalmachine:143.

But when I forward from gateway:1000 to internalmachine:143 I get bad 
TCP checksums on the return packets. These packets are ignored on the 
client machine on the external internet.

Iptables rules:

*nat
-A PREROUTING -d  213.84.168.6 -i ppp0 -p tcp -m tcp --dport 143 -j DNAT 
--to-destination 192.168.50.3:143
-A PREROUTING -d 213.84.168.6 -i ppp0 -p tcp -m tcp --dport 1001 -j DNAT 
--to-destination 192.168.50.3:143
-A POSTROUTING -s 192.168.50.0/255.255.255.0 -o ppp0 -j SNAT --to 
213.84.168.6

Example trace from client machine:

root@host2:/home/jan# tcpdump -vvv -r trace
reading from file trace, link-type EN10MB (Ethernet)
12:08:37.271198 IP (tos 0x10, ttl  64, id 48778, offset 0, flags [DF], 
proto: TCP (6), length: 60) host2.denouden.info.32784 > vdmheen.nl.1001: 
S, cksum 0xc616 (correct), 3872473067:3872473067(0) win 5840 <mss 
1460,sackOK,timestamp 229729 0,nop,wscale 0>
12:08:37.304060 IP (tos 0x40, ttl  54, id 0, offset 0, flags [DF], 
proto: TCP (6), length: 60) vdmheen.nl.1001 > host2.denouden.info.32784: 
S, cksum 0xff8a (correct), 2453556454:2453556454(0) ack 3872473068 win 
5792 <mss 1460,sackOK,timestamp 5433137 229729,nop,wscale 2>
12:08:37.304101 IP (tos 0x10, ttl  64, id 48779, offset 0, flags [DF], 
proto: TCP (6), length: 52) host2.denouden.info.32784 > vdmheen.nl.1001: 
., cksum 0x2e1e (correct), 1:1(0) ack 1 win 5840 <nop,nop,timestamp 
229733 5433137>
12:08:37.349163 IP (tos 0x40, ttl  54, id 43987, offset 0, flags [DF], 
proto: TCP (6), length: 209) vdmheen.nl.1001 > 
host2.denouden.info.32784: P, cksum 0xc246 (incorrect (-> 0xbeec), 
1:158(157) ack 1 win 1448 <nop,nop,timestamp 5433141 229733>
12:08:37.574322 IP (tos 0x40, ttl  54, id 43989, offset 0, flags [DF], 
proto: TCP (6), length: 209) vdmheen.nl.1001 > 
host2.denouden.info.32784: P, cksum 0xc22f (incorrect (-> 0xbed5), 
1:158(157) ack 1 win 1448 <nop,nop,timestamp 5433164 229733>
12:08:38.034079 IP (tos 0x40, ttl  54, id 43991, offset 0, flags [DF], 
proto: TCP (6), length: 209) vdmheen.nl.1001 > 
host2.denouden.info.32784: P, cksum 0xc201 (incorrect (-> 0xbea7), 
1:158(157) ack 1 win 1448 <nop,nop,timestamp 5433210 229733>
12:08:38.953738 IP (tos 0x40, ttl  54, id 43993, offset 0, flags [DF], 
proto: TCP (6), length: 209) vdmheen.nl.1001 > 
host2.denouden.info.32784: P, cksum 0xc1a5 (incorrect (-> 0xbe4b), 
1:158(157) ack 1 win 1448 <nop,nop,timestamp 5433302 229733>
12:08:40.794190 IP (tos 0x40, ttl  54, id 43995, offset 0, flags [DF], 
proto: TCP (6), length: 209) vdmheen.nl.1001 > 
host2.denouden.info.32784: P, cksum 0xc0ed (incorrect (-> 0xbd93), 
1:158(157) ack 1 win 1448 <nop,nop,timestamp 5433486 229733>

Does anybody have any idea what's wrong here? I've tried to search on 
Google for an answer, but I couldn't find any people with similar problems.

Thanks,
Jan


