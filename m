From: Daniel Scott <djscott@MIT.EDU>
Subject: iptables forwarding packets on the same interface
Date: Thu, 18 Nov 2010 15:26:16 -0500
Message-ID: <AANLkTimDgcNAfVZa6tUpQZFMb-jRXbzsiaDSnCZmqTTe@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have an iptables firewall configured as:

192.168.1.1

which handles the routing for our network.

I have added a separate router on:

192.168.1.2 which provides access to a different network:

192.168.10.0/24.

I have added a route on 192.168.1.1:

192.168.10.0 192.168.1.2 255.255.255.0 UG 0 0 0 eth1

so that packets from the network are routed through the .2 gateway.
However, iptables is blocking the packets when I route from a
different IP on the 192.168.1.0/24 network. i.e.

Ping from '1' network into '10' network:

Nov 17 17:18:30 fw kernel: [FIREWALL_LOG_CHAIN] IN= OUT=eth1
SRC=192.168.1.1 DST=192.168.1.42 LEN=112 TOS=0x00 PREC=0xC0 TTL=64
ID=25272 PROTO=ICMP TYPE=5 CODE=1 GATEWAY=192.168.1.2
[SRC=192.168.1.42 DST=192.168.10.10 LEN=84 TOS=0x00 PREC=0x00 TTL=63
ID=48895 PROTO=ICMP TYPE=0 CODE=0 ID=12034 SEQ=2 ]

DNS request from '10' network into '1' network:

Nov 18 10:19:50 fw kernel: [FIREWALL_LOG_CHAIN] IN=eth1 OUT=eth1
SRC=192.168.1.202 DST=192.168.10.10 LEN=71 TOS=0x00 PREC=0x00 TTL=63
ID=62146 PROTO=UDP SPT=53 DPT=38966 LEN=51

Am I doing this correctly? Can I 'route' packets back on to the same
interface, out via a different gateway. If so, can anyone tell me
which iptables/routing rule(s) I need to add to forward between
different network IPs on the same physical interface.

Thanks,

Dan
