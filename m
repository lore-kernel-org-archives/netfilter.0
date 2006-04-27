From: "Antanas Masevicius" <admin@ntt.lt>
Subject: asymmetric port translation?
Date: Thu, 27 Apr 2006 10:51:23 +0300
Message-ID: <004c01c669cf$60e9a730$2c00a8c0@Elfas>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello,

while trying to run SIP client under linux NAT i see following ip_conntrack 
table:

udp      17 174 src=192.168.10.10 dst=84.12.0.18 sport=5060 dport=5060 
packets=1551 bytes=1075989 src=84.12.0.18 dst=84.12.134.21 sport=5060 
dport=5060 packets=3665 bytes=1067143 [ASSURED] mark=0 use=1
udp      17 173 src=192.168.10.10 dst=84.12.0.18 sport=23192 dport=36048 
packets=168 bytes=10220 src=84.12.0.18 dst=84.12.134.21 sport=36048 
dport=1024 packets=114 bytes=8810 [ASSURED] mark=0 use=1
udp      17 27 src=84.12.0.18 dst=84.12.134.21 sport=36048 dport=23192 
packets=40 bytes=2610 [UNREPLIED] src=84.12.134.21 dst=84.12.0.18 
sport=23192 dport=36048 packets=0 bytes=0 mark=0 use=1

sport 5060 gets mapped to sport 5060 on outgoing IP 84.12.134.21, but in 
next line sport 23192 gets mapped to 1024 port, later, when my rtpproxy 
84.12.0.18  tries to send to 23192  - gets UNREPLIED.

my box:
linux version: 2.6.16.9
iptables v1.2.11

natting is performed with:

iptables -A POSTROUTING -s 192.168.10.0/24 -d 0/0 -p all -t nat -j 
SNAT --to-source 84.12.134.21

is it a normal PAT behaviour? I am not sure, but it seems that older 
versions of linux/iptables didn't exposed such behaviour.
Is there workaround for such thing? Maybe it is related with usage of higher 
ports - strange that 5060 always gets mapped correctly.
This box isn't loaded so there is no port shortage.

regards,
Antanas Masevicius 


