From: "Parthiv Shah" <parthiv.shah@sibridgetech.com>
Subject: RE: Adding ebtables entry from kernel module
Date: Fri, 23 Apr 2010 13:09:22 +0530
Message-ID: <F24502A8FCAC496180CC7A5AF283CF21@PARTHIVLAPTOP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
References: 
In-Reply-To: 
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Everyone,

Any insight/pointers for this one? Thanks in advance.

Thanks,
Parthiv


-----Original Message-----
From: Parthiv Shah [mailto:parthiv.shah@sibridgetech.com] 
Sent: Monday, April 19, 2010 11:21 AM
To: 'netfilter@vger.kernel.org'
Subject: Adding ebtables entry from kernel module

Hi,
 
I am new to using ebtables and my requirements is to do L2 NATing of clients
connected on the bridge, through WiFi interface.
 
As a proof of concept, I am able to add following rules in ebtables and have
the functionality that I want. (this is for one client connected on bridge)
 
 1. ebtables -t nat -A POSTROUTING -o ath0 -j snat --to-src
00:03:7F:12:06:90 --snat-arp --snat-target ACCEPT
 
 2. ebtables -t nat -A PREROUTING -p 0x0800 -i ath0 --ip-dst 192.168.40.239
-j dnat --to-dst 08:00:46:6A:A4:AC --dnat-target ACCEPT  3. ebtables -t nat
-A PREROUTING -p 0x0806 -i ath0 --arp-ip-dst 192.168.40.239 -j dnat --to-dst
08:00:46:6A:A4:AC --dnat-target ACCEPT 
 
With above rules, client PC (192.168.40.239) is able to ping gateway
(through WiFi - WAN interface) and it's packets are properly NATed. Now
practically, there will be many clients connected on the bridge and run time
they will join and leave the bridge port. So now I need to add/delete these
rules (specifically 2 and 3) for each client as and when they join / leave.
I was thinking of modifying the ebtables rules from the kernel itself (at
the time of dhcp / arp / ip packet flow for any new client).
 
How can I add / delete the above rules (2 and 3), from the kernel module?
Basically I don't want to use ebtables user space tool to add/delete rules
in ebtables, neither I want to extend ebtables. I just want to be able to
create / delete ebtables rule entries from kernel space.
 
Any help on this will be appreciated.
 
Thanks,
Parthiv
 
 

