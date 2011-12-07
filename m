From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: What happens after PREROUTING/nat ?
Date: Wed, 07 Dec 2011 18:57:52 +0100
Message-ID: <4EDFA920.4040804@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hi list,

I know that the answer is routing...
But...
I have a triangle problem...

Take this example:

"A": the local router/gateway/firewall connected to the Internet and the LAN
"B": a server on the LAN
"C": a client on the same LAN or on the other side (Internet)

If "C" connects from the Internet to a service on "A" (in reality the 
service is on "B") then everything is fine because I can DNAT the 
packets to "B"...
But if "C" is in the LAN then the packets are simply disappearing...

I made some logging and the !!LAST!! TRACE in my syslog is (a bit 
cleaned up version):

Dec  7 18:35:55 TRACE: nat:PRE_LAN_POP3:rule:1 IN=br1 OUT= 
PHYSIN=vlan100 SRC=LAN_IP_OF_C DST=WAN_IP_OF_A PROTO=TCP SPT=59036 
DPT=110 SEQ=3967862358 ACK=0 WINDOW=14600 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A26E062280000000001030304) MARK=0x5c

... and the rule:

#iptables -vnL PRE_LAN_POP3 -t nat
Chain PRE_LAN_POP3 (3 references)
  pkts bytes target     prot opt in     out     source               
destination
    12   720 DNAT       tcp  --  *      *       0.0.0.0/0           
!LAN_IP_OF_B         to:LAN_IP_OF_B

So what happens next? Any thoughts?

sysctl settings:
net.ipv4.ip_forward = 1
net.ipv4.conf.all.forwarding = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.all.proxy_arp = 0
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.all.secure_redirects = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.proxy_arp = 0
net.ipv4.conf.default.rp_filter = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1
net.ipv4.tcp_abort_on_overflow = 1
net.ipv4.tcp_ecn = 2
net.ipv4.tcp_fack = 1
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_mtu_probing = 1
net.ipv4.tcp_sack = 1
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_window_scaling = 1
net.ipv6.conf.all.disable_ipv6 = 1

Thanks for your help,

Swifty

