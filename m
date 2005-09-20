From: Leopold Aichinger <tux.racer@utanet.at>
Subject: syn-paket behind the firewall
Date: Tue, 20 Sep 2005 23:18:52 +0200
Message-ID: <43307CBC.2050408@utanet.at>
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
To: Netfilter Mailing Liste <netfilter@lists.netfilter.org>

Playing around with the new snort-machine I realised that a router 
behind the firewall is sending 'icmp destination unreachable - host 
unreachable' to a host on the internet:

IP (tos 0xc0, ttl 64, id 27629, offset 0, flags [none], proto 1, length: 
88) 10.10.10.169 > 83.222.7.130:
icmp 68: host 192.168.160.246 unreachable
  0x0000: 45c0 0058 6bed 0000 4001 9de5 0a0a 0aa9
  0x0010: 53de 0782 0301 ba2c 0000 0000 4560 003c
  0x0020: fe9a 4000 3206 8cc2 53de 0782 c0a8 a0f6
  0x0030: 0014 1389 9b72 1732 0000 0000 a002 16d0
  0x0040: 6a23 0000 0204 05b4 0402 080a 5a28 e9a8
  0x0050: 0000 0000 0103 0302

This icmp-packet was generated in reaction to an tcp-packet coming from 
host 83.222.7.130 with
only the syn-flag set.
On the firewall I found the following entry in the file 
/proc/net/ip_conntrack:

tcp  6 429852 ESTABLISHED src=83.222.7.130 dst=195.xx.xx.xx sport=20 dport=5001 
src=192.168.160.246 dst=83.222.7.130 sport=5001 dport=20 [ASSURED] use=1 

Note: 195.xx.xx.xx is the Internet-Ipaddress of the firewall
This was all I found in the file /proc/net/ip_conntrack concerning host 83.222.7.130 and host 192.168.160.246 
No second entry for this two host perhaps for port 21 or any other port.

The host 192.168.160.246 has apparently established a tcp-connection to the ftp-Server
83.222.7.130 and the client then disappeared without sending any fin or reset flag
(I am sure that I had no machine with Ip-Address 192.168.169.246 on the net, but
I still looking for an explanation for that!)

My Problem now:
Is it possible that syn-packets can pass the firewall coming from ftp-servers
by using ftp activ mode if connection-tracking is used by the firewall?

My firewall-rules for ftp:

<-- snipp -->
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
<--snipp -->
iptables -A FORWARD -i $INT_INTERF -o $EXT_INTERF -j client-chain-ext
<-- snipp -->
iptables -A client-chain-ext -p tcp -s $NETZ --sport $UNPRIVPORTS -d any/0 --dport 21 -m state --state NEW -j ACCEPT

I have no rule for port 20, the last rule is all I configured for ftp.

I fear that ip_conntrack_ftp perhaps opens activ-ftp transfers!

Has anybody seen something similar?
If activ-ftp is possible any idea how to block it?

THX for every answer and help!!

Leopold Aichinger




