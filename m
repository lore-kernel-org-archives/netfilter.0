From: <koen.news@koca.be>
Subject: multiple external IP's - virtual NIC - DNAT problems
Date: Fri, 29 Jan 2010 08:15:30 +0100
Message-ID: <47b63751ecb9bdee2ada1d1be9deb980@mail.priorweb.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Debian Lenny IPTABLES firewall.



I'm missing some essential knowledge on how to map multiple external IP's

I got from the ISP to specific internal IP's. 

Everything works qua NAT & redirects for one external IP (eth0) and

multiple internal subnets.



The external IP pack is available at the untrust interface of the router

(configured by the ISP) where eth0 of the firewall is connected to. 

Until now the firewall works with one of the external IP's. Port

forwarding works without a problem.



eth0: external IP1

eth1: internal 192.168.1.10/24



$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 9999 -j DNAT --to

192.168.2.240:3389) = Works perfect



I thought I needed to create via /etc/network/interfaces this: eth0:1 an

extra interfaces that matches official IP2 so I can DNAT traffic to a

specific server. 

IPtables doesn't accept eth0:1 as interface. But I can use the IP2. "IP2"

is the official IP e.g. $IPTABLES -t nat -A PREROUTING -p tcp -d "IP2"

--dport 80 -j DNAT --to 192.168.2.240:80 => doesn't work



1) Is this really necessary? First I tried to $IPTABLES -t nat -A

PREROUTING -p tcp -d "IP2" -j DNAT --to 192.168.2.240 without an virtual

interface but it doesn't work, TCP/IP does need an interface with the

correct IP to send data to I guesss :)

2) No other/better way than to define multiple official IP's to one iFACE?



This must be a common problem but I can't find a google answer. 

Any pointer on how to solve this problem? Maybe another approach. I will

need to do this for multiple servers. 



Koen Linders
