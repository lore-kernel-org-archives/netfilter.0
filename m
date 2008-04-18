From: =?ISO-8859-1?Q?Javier_Prieto_Mart=EDnez?= 
	<javier.prieto.ext@juntadeandalucia.es>
Subject: Redirecting ports in a bridge
Date: Fri, 18 Apr 2008 11:27:44 +0200
Message-ID: <48086990.5060000@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi.
I have a linux appliance from Eneo Tech. 
(http://www.eneotecnologia.com/) with the following setup:

   (192.168.1.x)        
192.168.1.7                                                     ---- 
SERVER1 192.168.2.1
    [ LAN1 ] ----------- [ ROUTER ] ---------- [ APPLIANCE ] -------- [ 
LAN 2 ] --------|
                        192.168.2.7            192.168.2.140        
(192.168.2.x)       ---- SERVER2 192.168.2.2

The appliance has 4 ethernet cards, and a br0 bridge which includes all 
them. ETH2 is connected to the router, ETH3 is connected to LAN2, and 
BR0 has an IP address of LAN2.

Now, I want to redirect all HTTP traffic going to SERVER1, to the same 
port SERVER2.

I've tried the following rule:

    iptables -t nat -A PREROUTING -p tcp -d 192.168.2.1 --dport 80 
--to-destination 192.168.2.2:80 -j DNAT


The redirection seems to be working, as far as I've seen with tcpdump on 
SERVER2, but I'm not able to make a connection.

I have two suppositions:

    1) I have to SNAT the response. I've tried that rule:
    iptables -t nat -A POSTROUTING -p tcp --sport 80 -s 192.168.2.2 -d 
192.168.1.0/24 -j SNAT --to-source 192.168.2.1

    2) I have to use ebtables, as I'm using a bridge.

Any help? Thanks in advance :-)

