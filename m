From: Pawel <pzlist@mp.pl>
Subject: routing based on MARK problem
Date: Tue, 09 Oct 2007 13:49:02 +0200
Message-ID: <470B6AAE.70400@mp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

In my network routing based on MARK do not work. Return packets (SYN - 
ACK) do not reach client.


My network :


local area -------
                         |
                         |--------------eth0 server eth1 -------------- 
provider 1
                         |
external  N------ 
I want to assure access to "external N " from "local area"
I prepared new routing table :

ip rule add fwmark 5 table EXTERNAL
ip route add default via $EXTERNAL_NETWORK_GW_IP dev eth0 table EXTERNAL

next iptable rules:

iptables -t nat PREROUTING -t mangle -i eth0 [DST PORT/ADDRESSES RULES] 
-j MARK  --set-mark 5
to disable NAT and redirection to proxy:

iptables -t nat PREROUTING -m mark --mark 5 -j ACCPET
iptables -t nat POSTROUTING -m mark --mark 5 -j ACCPET

tcpdump on "server"  shows:
"local area IP " > "external N IP"  SYNC
"local area IP" > "external N IP"  SYNC
"external N IP"  > "local area IP " SYNC ACK

last packet appears only once  - that packet to not each host in local area

accept_reidirection and send_reisrections are disabled


What is wrong ?
Thanks for any suggestions.

Pawel






