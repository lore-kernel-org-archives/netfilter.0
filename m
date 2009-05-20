From: "Matt" <Matt@PlumSoftware.co.uk>
Subject: Routing & NAT'ing PTPP VPN Problem
Date: Wed, 20 May 2009 11:45:51 +0100
Message-ID: <117F5E7DA31C17478948DC39E01B948BAC396C@frost.PlumSoftwareLtd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi. 

Apologies if this is the incorrect list for this question. If it is, then please direct me to the appropriate one.

We have a multihomed linux router that we use to traffic shape outbound traffic on both our public interfaces:


                Internet                          Internet
                   |                                  |
         ----100.100.173.81---                  200.200.64.137
        /      (router)        \                  (router)
       |                        |                     | 
 100.100.173.83           100.100.173.82        200.200.64.139 
       |                        |                     | 
 192.168.100.x                   \                   / 
(Office Network)                  \                 / 
                                 Linux Multihomed Router 
                                       192.168.0.254 
                                             | 
                                             | 
                                        192.168.0.6 
                                      Internal Server 


The multihomed router sends traffic that arrives on each interface back out on the same interface using packet marking. We want all Office traffic to go through the linux router (so it is traffic shaped), and by setting the default gateway on the 100.100.173.83 to the linux box (100.100.173.82) this works fine for all email, HTTP and other traffic that I've tried.

My question is this: Is there any way to configure the above such that MS PTPP VPN traffic sent to 100.100.173.83 is sent back via 100.100.173.82 and then back over the internet? (i.e. like a normal router might do)

I can get the VPN to work in two ways, neither of which I want to do ideally:

1. Setting the default gateway on 100.100.173.83 to 100.100.173.81, letting the VPN work as normal. I don't want to do this because the VPN then can potentially hog the bandwidth on that connection.

2. Setting the VPN Clients to point to the linux router IP (100.100.173.82), using NAT to redirect to the 100.100.173.83 box, and keeping the default gateway on the 100.100.173.83 box to point to the linux box. (100.100.173.82).

I would normally be happy with just doing things as per (2) but we also want a VPN between an offsite location and the 192.168.0.6 server, to be sent over the same interface (100.100.173.82), so I had intended to use the iptables NAT rules to get the two VPN servers talking. So as far as I can see such a configuration would interfere with the Office VPN.

Hope you can help!

Matt.
