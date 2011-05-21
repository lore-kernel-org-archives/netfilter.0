From: netfilter@buglecreek.com
Subject: FORWARD chain and Interfaces
Date: Sat, 21 May 2011 00:10:05 -0600
Message-ID: <1305958205.10779.1454356989@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:subject:date; s=smtpout; bh=r5cMQIRpWTaTB/Occ+NEALXE/F4=; b=c/9x69vUEk8Bj5giRD88s2WAICDIQP9Klb4dRDFR0Iw6fkC/Ps/78dUGXYQVDSJFson/tpUatCrtRiCkGauKNuOWjgtFX0Fm2QXEd4LjyriUCsnaeR3kW/3FQGAr5k+tmCdSLPRFoXX7E1EazEu9rHjDsmxdaMWKxGV6mJuZAE8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

I have a firewall router box that I'm trying to write a ruleset for that
accepts/blocks traffic from Network A to Network B.  I'm testing the
rules on 3 virtual machines and will eventually deploy to production
hardware:

Network A Machine Eth0 <-------> Eth0 Firewall/Router Eth1 <------->
Eth0Network B Machine
              192.168.99.1                192.168.99.2           
              10.10.10.1       10.10.10.2


I have the the following rules on the Firewall/Router as a test before I
write rules with http, ssh etc:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p icmp --icmp-type echo-request -s
192.168.99.0/24 -d 10.10.10.0/24 -m state --state NEW -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -m state --state
NEW -j LOG --log-prefix "ICMP: "

When I ping from 192.168.99.1 to 10.10.10.2 it does not work.  The log
rule logs the packet as IN=ETH1 OUT=ETH1.  I may not understand how the
interfaces should be referenced in the FORWARD chain, but I would think
that the second rule above should allow and forward that icmp traffic.  

However, if I remove the -i eth0 and -o eth1 from the second rule above
the ping works fine, the log of course still says  IN=ETH1 OUT=ETH1.  

I guess I don't have to reference the interfaces in all my FORWARD
rules, but I'd like to.  I am confused why the -i and -o referenced in
the second rule does not allow and forward traffic. And you the log rule
log the packets as IN=ETH1 and OUT=ETH1, I would expect IN=ETH0
OUT=ETH1.

