From: "Yoav Zamir" <yoav_zamm@hotmail.com>
Subject: Reset regarded as a new session
Date: Tue, 29 Jun 2004 15:59:30 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY7-F19hUlmsQlcwuu0004a46a@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

It seems like iptables doesn't treat correctly a session I have created.
The situation is as follows:
I have two machines (A-holds a program that is a TCP client, B-TCP server).
A contains an SNAT & DNAT that alter the ip-addresses of the outgoing 
sessions.

Now (in chronological order):
A opens a session (sends a SYN, recieves SYN ACK).
A sends some data (and recieves acks).
A closes the connection: (Sends a FIN)
B sends an ACK to the FIN (that contains data(!)).
A sends a RST to B (because data was recieved in the FINACK(?)), but at this 
point the NAT sends it with altered IP addresses - as though the session has 
already ended and the reset packet belongs to a new session. This packet 
also has bad chksum.
B tries to send FIN packets (with the correct IP addresses), but recieves no 
acknowledgements to them; Thus leaving the session stuck on the server in 
the mode LAST_ACK.

The NAT configuration and a plot of tethereal is attached.

Regards,
Yoav.


Compiled by tethereal, based on tcpdump:

  1   0.000000  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [SYN] Seq=0 
Ack=0 Win=5840 Len=0 MSS=1460 TSV=5140710 TSER=0 WS=0
  2   0.001437   2.7.88.255 -> 3.6.104.154  TCP 20000 > 20000 [SYN, ACK] 
Seq=0 Ack=1 Win=5792 Len=0 MSS=1460 TSV=5109167 TSER=5140710 WS=0
  3   0.001477  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [ACK] Seq=1 
Ack=1 Win=5840 Len=0 TSV=5140712 TSER=5109167
  4   0.001551  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [ACK] Seq=1 
Ack=1 Win=5840 Len=1448 TSV=5140712 TSER=5109167
  5   0.001575  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [ACK] Seq=1449 
Ack=1 Win=5840 Len=1448 TSV=5140712 TSER=5109167
  6   0.010284   2.7.88.255 -> 3.6.104.154  TCP 20000 > 20000 [ACK] Seq=1 
Ack=1449 Win=8688 Len=0 TSV=5109175 TSER=5140712
  7   0.010307  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [PSH, ACK] 
Seq=2897 Ack=1 Win=5840 Len=1448 TSV=5140721 TSER=5109175
  8   0.010318  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [PSH, ACK] 
Seq=4345 Ack=1 Win=5840 Len=658 TSV=5140721 TSER=5109175
  9   0.022450   2.7.88.255 -> 3.6.104.154  TCP [TCP Dup ACK 6#1] [TCP 
Previous segment lost] 20000 > 20000 [ACK] Seq=7 Ack=1449 Win=8688 Len=0 
TSV=5109188 TSER=5140712 SLE=1709622117 SRE=1709623565
10   0.024704   2.7.88.255 -> 3.6.104.154  TCP [TCP Dup ACK 6#2] 20000 > 
20000 [ACK] Seq=7 Ack=1449 Win=8688 Len=0 TSV=5109190 TSER=5140712 
SLE=1709622117 SRE=1709624223
11   0.213172  3.6.104.154 -> 2.7.88.255   TCP [TCP Retransmission] 20000 > 
20000 [ACK] Seq=1449 Ack=1 Win=5840 Len=1448 TSV=5140923 TSER=5109175
12   0.215916   2.7.88.255 -> 3.6.104.154  TCP [TCP Retransmission] 20000 > 
20000 [PSH, ACK] Seq=1 Ack=1449 Win=8688 Len=6 TSV=5109381 TSER=5140712 
SLE=1709622117 SRE=1709624223
13   0.215940  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [ACK] Seq=5003 
Ack=7 Win=5840 Len=0 TSV=5140926 TSER=5109381
14   0.216025  3.6.104.154 -> 2.7.88.255   TCP 20000 > 20000 [FIN, ACK] 
Seq=5003 Ack=7 Win=5840 Len=0 TSV=5140926 TSER=5109381
15   0.221815   2.7.88.255 -> 3.6.104.154  TCP 20000 > 20000 [ACK] Seq=7 
Ack=5003 Win=11584 Len=0 TSV=5109387 TSER=5140923
16   0.222140   2.7.88.255 -> 3.6.104.154  TCP 20000 > 20000 [PSH, ACK] 
Seq=7 Ack=5004 Win=11584 Len=6 TSV=5109387 TSER=5140926
17   0.222211  3.6.104.232 -> 2.7.89.77    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0
18   0.222468   2.7.88.255 -> 3.6.104.154  TCP 20000 > 20000 [FIN, PSH, ACK] 
Seq=13 Ack=5004 Win=11584 Len=6 TSV=5109387 TSER=5140926
19   0.222494  3.6.104.234 -> 2.7.89.79    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0
20   0.422856   2.7.88.255 -> 3.6.104.154  TCP [TCP Retransmission] 20000 > 
20000 [FIN, PSH, ACK] Seq=7 Ack=5004 Win=11584 Len=12 TSV=5109588 
TSER=5140926
21   0.422887  3.6.104.236 -> 2.7.89.81    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0
22   0.824776   2.7.88.255 -> 3.6.104.154  TCP [TCP Retransmission] 20000 > 
20000 [FIN, PSH, ACK] Seq=7 Ack=5004 Win=11584 Len=12 TSV=5109990 
TSER=5140926
23   0.824837  3.6.104.238 -> 2.7.89.83    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0
24   1.628616   2.7.88.255 -> 3.6.104.154  TCP [TCP Retransmission] 20000 > 
20000 [FIN, PSH, ACK] Seq=7 Ack=5004 Win=11584 Len=12 TSV=5110794 
TSER=5140926
25   1.628643  3.6.104.240 -> 2.7.89.85    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0
26   3.236299   2.7.88.255 -> 3.6.104.154  TCP [TCP Retransmission] 20000 > 
20000 [FIN, PSH, ACK] Seq=7 Ack=5004 Win=11584 Len=12 TSV=5112402 
TSER=5140926
27   3.236341  3.6.104.242 -> 2.7.89.87    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0
28   6.451663   2.7.88.255 -> 3.6.104.154  TCP [TCP Retransmission] 20000 > 
20000 [FIN, PSH, ACK] Seq=7 Ack=5004 Win=11584 Len=12 TSV=5115618 
TSER=5140926
29   6.451699  3.6.104.244 -> 2.7.89.89    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0
30  12.883417   2.7.88.255 -> 3.6.104.154  TCP [TCP Retransmission] 20000 > 
20000 [FIN, PSH, ACK] Seq=7 Ack=5004 Win=11584 Len=12 TSV=5122050 
TSER=5140926
31  12.883461  3.6.104.246 -> 2.7.89.91    TCP 20000 > 20000 [RST] Seq=0 
Ack=0 Win=0 [CHECKSUM INCORRECT] Len=0

The NAT's configuration is:
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       tcp  --  anywhere             anywhere            tcp 
spts:20000:29999 to:3.2.46.172-3.19.11.33:20000-30000

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere            tcp 
spts:20000:29999 to:2.3.31.18-2.12.21.34:11111-22222

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


