From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: External IP addresses on internal network
Date: Thu, 28 Aug 2003 16:52:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008e01c36d7c$6218ca70$6401a8c0@int.thorcom.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au> <3F4C0519.8000109@Loudoun-Fairfax.com> <Pine.LNX.4.53.0308270944480.7868@simba.math.ucla.edu> <3F4CFD8C.5020404@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, Jim Carter <jimc@math.ucla.edu>
Cc: netfilter@lists.netfilter.org

> 
> A point of interest for list members. Most sample scripts and some 
> production configurations do little if any filtering of traffic from the 
> LAN out to the Net. The theory being that the LAN is trusted. IMHO this 
> is a mistake. Malware can get in from e-mail, laptops, wireless 
> connections, floppies, etc. and there's no way we can stop all of it. 
> IDS is great but pretty pricey for SOHO use. I recently found a worm on 
> a client that had gotten in despite our best efforts. The only way I 
> knew it was there was by iptables logging (and rejecting) outgoing 
> traffic on unauthorized ports. I'll never know if the worm was able to 
> find an open port to reach the net, but internally it was contained to 
> one box and no harm was done. Just my 2 cents.
> 
> Jeff
> 

I filter outbound stuff in the OUTPUT table (packets from my firewall
host to the net) and the FORWARD table.

What you should be filtering is packet egress, that is your 192.168 or
whatever internal LAN leaking 'naked' (un-NATted) to the internet at
large.

I do this in two places, on the main firewall box between out "inside"
and "outside" in iptables and then again at the Cisco router facing
PSInet with an ACL that drop & log any packets from anything other
than our PSInet Class-C, so there's no way we can "leak" on to the 'net.

Doesn't everyone do this?

Mike


