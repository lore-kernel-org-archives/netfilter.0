From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: Creating a Hybrid Connection to Balance Traffic
Date: Sat, 26 Oct 2002 21:25:28 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210262119170.3576-100000@laptop1.agatha>
References: <20021026190433.24795.qmail@web40607.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Aumer-Ryan <raptorion@yahoo.com>
Cc: netfilter@lists.netfilter.org

Hi Paul,

Your story sounds like you are looking for assymetric routing, which 
should be doable with policy routing. Check out 
http://www.policyrouting.org where Matthew Marsh is currently working on 
getting his excellent book "Policy Routing using Linux" online. 

Note that it isn't fully up on the net yet, so if you need to find out how
it works quickly, you may want to buy the book. 

Other resources that may be of interest is http://www.lartc.org,
http://www.netfilter.org and http://www.frozentux.net. The last two sites
contains information on iptables in linux kernel 2.4, which you may want
to upgrade to if you are still running kernel 2.2.

Hope this is of some help.

----
Oskar Andreasson
http://www.frozentux.net
mailto:blueflux@koffein.net

On Sat, 26 Oct 2002, Paul Aumer-Ryan wrote:

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
> 
> __________________________________________________
> Do you Yahoo!?
> Y! Web Hosting - Let the expert host your web site
> http://webhosting.yahoo.com/
> 
> 



