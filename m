From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: Creating a Hybrid Connection to Balance Traffic
Date: Sun, 27 Oct 2002 10:14:41 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39397.192.168.7.14.1035674081.squirrel@iw.k1k2.com>
References: <20021026190433.24795.qmail@web40607.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021026190433.24795.qmail@web40607.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I've got a peculiar situation that I hope you all
> would listen to and offer feedback on any possible
> implementations.
> 
> So I've recently broke down and purchased a DSL
> connection for my home computer, and I've just
> discovered the joys of p2p file sharing (i.e., being
> able to download television shows that my local
> stations have stopped carrying, like Enterprise). 
> Anyway, as you can guess, these video files are rather
> large, and other users also grab them from my computer
> as well, so my upload speeds are rather high.  Since
> I've subscribed to DSL service through a local ISP,
> and since local ISPs are big on service but not on
> resources, I got a call from them recently asking me
> to tone down my upload bandwidth usage on the DSL
> line.  I've pretty much got to listen or I will lose
> my service.
> 
> My local setup consists of a linux box acting as a
> gateway for my home network of (gasp!) one computer
> and a laptop.  The linux box currently uses ipchains
> to perform the necessary IP masquerading for the
> connection.  Some quick stats:
> 
> eth0: external network connection (to ISP)
> eth1: internal network
> ppp0: modem attached, but not currently used.
> 
> So here comes the question: since I've got to reduce
> my upload usage, I'd like to try to use the linux box
> to do a special form of SNAT routing.  I would like
> all outgoing data to leave through the attached ppp0
> interface (the modem which I can hook up to a dialup
> ISP) and all incoming data to come back in through the
> eth0 interface (the broadband connection to my local
> ISP).  Basically, I need to do a form of SNAT routing
> that overwrites the source address of packets leaving
> on the ppp0 interface with the IP address of the eth0
> interface, so when their replies come back the will
> come on the faster broadband connection.  This way the
> upload bandwidth usage on the DSL connection will be
> effectively zero, while I will still be able to enjoy
> the fast download speeds of the DSL line, satisfying
> both me and the ISP.
> 
> My issues include the current usage of SNAT routing
> (masquerading) since my local network connects to the
> internet through the linux box's one IP address, and
> how to use ipchains, iptables, or ipnatctl (or others)
> to perform this extra set of SNAT routing.  Does
> anyone have any ideas on how to implement this?
> 
> Sorry for the long story, and I thank everyone in
> advance for their time.  Have a good one,
> Paul

Not sure how to MASQUERADE a connection and to specify a
differnet IP address (which I guess is what you want to do)
but you also need to check that the dialup ISP does not do
egress filtering - coz if they do - it will not work anyway.

Use google to look up egress, but basically it means that they
may only allow the source IP of outgoing packets to match the
IP address they supply you and they drop all other packets.
This is apparently common in the USA.

If they don't do egress then you should be able to do it - but
not sure how :-) I can think of things to try - but no idea if
any are correct - basically using the "-t nat" table,
"-A POSTROUTING" and something like -j SNAT
but that would also require changing the rule every time the
dialup DHCP IP changes and I'm not sure about what happens to
return packets.

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


