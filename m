From: Tannador <mail@tannador.com>
Subject: Static mapping of private subnet to different private subnet
Date: Tue, 04 Nov 2014 15:47:51 +0100
Message-ID: <F1992426-119C-4B69-ACE5-44772A062125@tannador.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I am currently tinkering with a system that has two network interfaces which are both configured by the remote peer (DHCP and PPP). Now, I am facing the scenario that I might be assigned the same private network on both interfaces.

I would like to transparently map the ip adresses of incoming packets on one interface to a different private network. That is, for applications, it should look like the interface has been assigned to this different private network.

Example
nif0 (nif = network interface)
IP 192.168.1.145
Gateway 192.168.1.1
DNS1 192.168.1.2
DNS2 192.168.1.3 

nif1 (before mapping)
IP 192.168.1.203
Gateway 192.168.1.3 
DNS1 192.168.1.3 
DNS2 192.168.1.54 

nif1 (after mapping to 10.0.0.0/8) 
IP 10.168.1.203 
Gateway 10.168.1.3 
DNS1 10.168.1.3 
DNS2 10.168.1.54 

In essence, I would like to provide a network address and a subnet mask and have the corresponding parts of all ip addresses on a certain interface mapped. Such that 192.168.1.3 is mapped to 10.168.1.3 iff the packet is received via nif1. Since this is a purely static operation, I guess it cannot be that difficult. 

My first approach was to use NAT but that does not seem to do the trick. After a lot more googling, I give up. Am I looking at the wrong places? Do I have to use MANGLE or RAW on PREROUTING and POSTROUTING?

I would write a script that is called whenever on link is configured by the remote peer. So I am able to change rules whenever there is a collision.

I can hardly believe to be the first to ask this question but I am unable to find a solution anyway :/

Kind regards, 
tannador
-- 
Sent from my smartphone. Pardon typos and the short form.

