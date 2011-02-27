From: Jason <netfilter@lakedaemon.net>
Subject: ebtables arp size error on tap iface
Date: Sun, 27 Feb 2011 10:20:58 -0500
Message-ID: <20110227152058.GA12185@titan.lakedaemon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

All,

I'm trying to filter out some multicast traffic on an openvpn interface
(tap2).  The goal is power conservation, since the vpn client is my
phone and the multicast/broadcast traffic keeps unecessarily waking it
up.  So, at my server, I'm trying to prevent these packets from going
down the pipe.

my end goal is to have something like this:

### start fw_up.sh ####################################################
#!/bin/sh

DEV=tap2
IP=${1}

# allow arp requests for destination ip
ebtables -A FORWARD -p ARP -o $DEV --arp-opcode 1 --arp-ip-dst $IP \
	-j ACCEPT

# drop all multicast/broadcast
#ebtables -A FORWARD -o $DEV -d 01:00:00:00:00:00/01:00:00:00:00:00 \
	-j DROP

# allow all else
#ebtables -A FORWARD -o $DEV -j ACCEPT

exit 0
### end fw_up.sh ######################################################

Unfortunately, the first rule fails to load and I get a message in my
logs:

kernel: eb_tables: arp match: invalid size 56 != 52

So, my dilemma is this is an old kernel (2.6.30.2) on my primary server
at home.  It handles everything.  I plan to upgrade the kernel, but not
right now.

Am I doing something wrong with my ebtables call?  Is there something I
can set on my tap2 interface (checksum perhaps?) to fix this?  Or do I
have to hold off until I upgrade my kernel?

thx,

Jason.
