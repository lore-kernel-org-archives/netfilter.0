From: Dmitry Ananjev <altex@crazy.ru>
Subject: Iptables + traceroute + NAT = invalid packet? :-(
Date: Thu, 13 Jan 2005 23:20:36 +0400
Message-ID: <41E6CA04.6090203@crazy.ru>
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
To: netfilter@lists.netfilter.org

Hello!

I have a problem with the connection tracking state extension.
I want to allow traceroute from my local network, so I configured my 
firewall to accept outgoing packets from my network.
I also accept established, related pachets and log&drop invalid packets:

iptables -A INPUT -m state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state INVALID -j LOG
iptables -A INPUT -m state INVALID -j DROP
iptables -A INPUT -i <LAN_IFACE> -j ACCEPT

iptables -A OUTPUT -m state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state INVALID -j LOG
iptables -A OUTPUT -m state INVALID -j DROP

iptables -A FORWARD -m state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state INVALID -j LOG
iptables -A FORWARD -m state INVALID -j DROP
iptables -A RORWARD -i <LAN_IFACE> -j ACCEPT

iptables -A POSTROUTING -o <INET_IFACE> -j SNAT --to-source <INET_IP>

However, at this time a traceroute from my local network to an external 
host looks like that:

---
Tracing route to ya.ru [213.180.193.123]
over a maximum of 30 hops:

  1     *        *        *     Request timed out.
  2    22 ms    23 ms    31 ms  213.156.200.xxx
  3    31 ms    21 ms    23 ms  213.156.195.xxx
  4    25 ms    50 ms    25 ms  e12.bcn1.xxx.xxx [213.156.192.xxx]
etc.
---

cat /var/log/messages
-------------
Jan 12 14:30:02 serv kernel: INVALID output: IN= OUT=eth0 
SRC=192.168.2.1 DST=192.168.2.10 LEN=120 TOS=0x00 PREC=0xC0 TTL=64 
ID=54714 PROTO=ICMP TYPE=11 CODE=0 [SRC=192.168.2.10 DST=213.180.193.123 
LEN=92 TOS=0x00 PREC=0x00 TTL=1 ID=26615 PROTO=ICMP TYPE=8 CODE=0 ID=512 
SEQ=32768 ]
-------------

So why does the time-exceeded answer have the state 
INVALID, though it should be RELATED as far as i can see it?
Am I doing something wrong or is it even an iptables bug?

Thank you!
WBR, Dmitry Ananjev
altex@crazy.ru



