From: <hamals@infinito.it>
Subject: set up my DMZ
Date: Fri, 17 Sep 2004 11:37:38 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-3590363@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've a DMZ with two server, I would like to acces them 
through my iptables firewall.

IP_serve1_DMZ =192.168.2.2
IP_serve2_DMZ =192.168.2.3

IP_server1_public = x.x.x.52
IP_server2_public = x.x.x.53 (x is for privacy..)


My firewall has

eth1 internet interface = x.x.x.50
eth0 dmz interface = 192.168.2.1

I need to have my server access with their pubbic IP, but 
I've only eth1 as inteface to internet.

I read that I can't use alias in iptables rules (like 
eth1:1 etc) , then what kind of rules have I to write to 
solve my problem?


I did this script but is it not working,
what do you think is wrong in it?



#!/bin/bash


iptables -F

iptables -t nat -F

iptables -t mangle -F

# filter table everythingd is ACCEPT  only to follow the 
easyest way#

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

## make DMZ -> internet ##

iptables -t nat -A POSTROUTING -s 192.168.2.1 -o eth1 -j 
SNAT --to-source 82.190.228.52


## make internet -> DMZ ##

iptables -t nat -A PREROUTING -i eth1 -d x.x.x.52 -j DNAT 
--to-destination 192.168.2.1


Thanks
_______________________________________
Connessione ed e-mail gratuita da 10 mb
consultabile tramite web e tramite pop.
www.infinito.it vieni a scoprire tutti 
i nostri servizi!

http://www.infinito.it/xmail


