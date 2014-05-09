From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Losing connection between nat and filter tables
Date: Fri, 09 May 2014 11:56:40 -0300
Message-ID: <536CECA8.1000604@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello everyone! This is the users list, right? =)

I'm about to deploy a FTP service for my company using iptables for 
NATing client connections to an internal FTP server. However, there will 
be two FTP sites hosted on the same server, so in order to route the 
connections to each FTP site I'm currently using two of our public IP 
addresses like this:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d 192.168.50.3 -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -d 192.168.50.3 -p tcp --dport 2121 -j ACCEPT

iptables -t nat -A PREROUTING -d 180.1.2.11 -p tcp --dport 21 -j DNAT 
--to-destination 192.168.50.3
iptables -t nat -A PREROUTING -d 180.1.2.12 -p tcp --dport 21 -j DNAT 
--to-destination 192.168.50.3:2121

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 180.1.2.11
iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source 180.1.2.12

(the FORWARD default policy is DROP; all chains in the nat table are set 
to ACCEPT)

I didn't open up higher ports because the RELATED state should take care 
of things (or so I think). The default gateway is 180.1.2.1 and the 
interface set to use it is 180.1.2.11 (eth1). Here are my routes:

180.1.2.0/28 dev eth1  proto kernel  scope link  src 180.1.2.11
180.1.2.0/28 dev eth2  proto kernel  scope link  src 180.1.2.12
192.168.50.0/24 dev eth0  proto kernel  scope link  src 192.168.50.3
default via 180.1.2.1 dev eth1

After running the above, I can successfully connect to the FTP using the 
IP 180.1.2.11 in passive mode (the only mode I need). But connecting to 
180.1.2.12 will result in a timeout.

Logging the client connection with PREROUTING and FORWARD I get this:

May  9 09:53:45 firewall kernel: IN=eth2 OUT= 
MAC=02:45:bd:53:82:78:ae:50:4d:5f:b1:b9:08:00 SRC=177.21.108.6 
DST=180.1.2.12 LEN=52 TOS=0x00 PREC=0x00 TTL=113 ID=14149 DF PROTO=TCP 
SPT=50051 DPT=21 WINDOW=8192 RES=0x00 SYN URGP=0
*repeats 3 more times before timeout*

So, the connection reaches the server, but I don't see it hit the 
FORWARD chain, while client connections to the other IP (180.1.2.11) 
logs all the way to the POSTROUTING chain.

The only peculiarity is that the iptables machine is virtualized on a 
XenServer 6.2 platform. I'm using vlans and virtual (bridged) 
interfaces. The iptables (v1.4.7) is running on a CentOS 6.4 kernel 
2.6.32-358.el6.x86_64. Even knowing that it don't have anything to do 
with it, I've disabled the rp_filter.

Right now I'm clueless and that don't even make sense to me =(
Am I missing something? Could somebody help me with that?
Thank you!

