From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: load balancing between ppp0 and ppp1, private IPs
Date: Sun, 12 Apr 2009 23:03:56 -0600
Message-ID: <op.usa60utux1lyi3@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I want to use load balancing to allow simultaneous use of 2 relatively slow GPRS (ppp over GSM cellular phone) modems.  I have a custom-compiled Ubuntu kernel 2.6.20.3 with Debian Etch, iptables v1.3.8.

The modems are seen by the system as regular serial modems, ppp0 and ppp1.  I also have a LAN (eth0). 

My interfaces, ppp0 and ppp1 have dynamically assigned *private* IP numbers.  For example:

ppp0: 10.60.32.71
ppp1: 10.40.89.42

My strategy for load balancing is to use conntrack to save the mark of the *first* packet, and mark all subsequent packets for that connection the same way.  Two custom routing tables are set up, each set to push traffic to one of the 2 interfaces, according to the packet mark:

TABLE    INTERFACE    MARK
rt_link1   ppp0                1
rt_link2   ppp1                2

My efforts to do load balancing between the 2 interfaces have not been successful.  Before I go into details, a major question:  Will load balancing work without public, routable IP numbers for my outward-facing interfaces?

--
Lloyd


