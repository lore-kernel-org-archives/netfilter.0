From: "William T. Mann" <wtmann@comune.belluno.it>
Subject: iptables: DNAT on virtual interfaces not working
Date: Tue, 23 Dec 2014 07:43:26 +0100 (CET)
Message-ID: <453142209.685.1419317006894.JavaMail.zimbra@comune.belluno.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.log

I'm using iptables 1.4.21 on Ubuntu Server 14.04.1 and I am unable to DNAT my virtual interfaces. My firewall is configured with 3 NICs with the classic DMZ, Internal, Internet setup. The DMZ is setup on 10.6.7.x, the internal is 10.6.x.x and the internet obviously are public. On the internet NIC I have a main address and I've setup virtual addresses using ip. In my firewall I have a bunch of commands to NAT the public addresses to my internal servers with commands like follows:

iptables -t nat -A PREROUTING  -d 5.97.33.3  -j DNAT --to-destination 10.6.7.3
iptables -t nat -A OUTPUT  -d 5.97.33.3  -j DNAT --to-destination 10.6.7.3
iptables -t nat -A POSTROUTING -o eth0   -s 10.6.7.3  -j SNAT --to-source 5.97.33.3

The NAT rules however are not being executed. Using tcpdump and ping I see the packets arriving to the interface but then they just disappear (internally though everything works: the problem is from the internet). I never see a connection with conntrack and no rules are being executed at all (the NAT counters are not increasing). The above rules are being made by fwBuilder 5.1.0.3599.

On a similar server using iptables 1.4.4 on Ubuntu Server 10.04.4 everything works just fine (although sometimes a virtual address is no longer NATed and I have to change virtual addresses, but then later the virtual address starts back to working).

On both servers IP forwarding is activated. I've read about different people having similar problems but none of the solutions offered helped. Does anyone have any ideas? Thanks in advance.

-- 
rag. William Mann 
Istruttore Area Informatica 
Comune di Belluno 
Tel: +39 0437 913156
E-mail: wtmann@comune.belluno.it
