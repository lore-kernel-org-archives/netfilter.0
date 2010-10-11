From: mad_stuff@gmx.de
Subject: force specific interface / late DNAT
Date: Mon, 11 Oct 2010 12:10:13 +0200
Message-ID: <20101011101013.66800@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I've some strange requirements for my setup: my box (2.6.24) holds a bunch of outgoing ppp-connections (ppp0-ppp15) but all of these use the same IP subnet (192.168.1.0/24; 192.168.1.100 is my side, and 192.168.1.1 is the IP of the server on the other side; so in the end, I've got 16 ppp-devices with IP 192.168.1.100 belonging to completely different networks).

Now I want to connect (SFTP using OpenSSH) to some servers (IP: 192.168.1.1 each) on the oposite sides, so I thought about NAT to make this mess a bit handier:

-> I had the following idea to distinguish the different connections for userspace programs: for each device pppX create an alias pppX:1 with IP 10.0.X.2/24 so that I can connect to 10.0.10.1 if I want to talk to 192.168.0.1 connected via ppp10 and 10.0.9.1 if I want to use 192.168.0.1 connected via ppp9 etc.

So I added two rules: 

iptables -t nat -A OUTPUT -o ppp9 -d 10.0.9.1 -j DNAT --to-destination 192.168.0.1
iptables -t nat -A POSTROUTING -o ppp9 -j MASQUERADE

But this doesn't work (tested it with two ethernet cards in the same segment) since after applying the DNAT rule the routing decision is changed, so Linux searches for a route to 192.168.0.1 and just uses one of the pppX interfaces and not ppp9.

I can't do any DNAT in POSTROUTING chain, but exactly there I would like 

I thought about doing some research in the tun/tap direction, but didn't find anything usable yet.

Can you give me some points in the right direction?

Can this scenario be solved?

I appreciate any comments,

thanks,
-Chris


-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail
