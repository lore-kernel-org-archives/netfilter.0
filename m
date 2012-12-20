From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Thu, 20 Dec 2012 16:03:14 -0500
Message-ID: <201212201603.15121.neal.p.murphy@alum.wpi.edu>
References: <50D01F13.7030707@nottheoilrig.com> <201212201054.25174.neal.p.murphy@alum.wpi.edu> <alpine.LNX.2.01.1212202003130.26093@nerf07.vanv.qr>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1212202003130.26093@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, December 20, 2012 02:35:44 PM Jan Engelhardt wrote:
> Again: where in the Ethernet/IP packet would that be recorded? Don't
> guess; *construct* one. Your favorite IP reference (be that a book,
> the RFCs, Wikipedia, ...) can tell you what fields exist and need to
> be filled out. Consider yourself a Linux machine sending a packet,
> fill in the fields, in the direction from TCP to IP to Ethernet (i.e.
> backwards). Once done, parse it (in the forward direction), like a
> Linux machine receiving the packet.
> 
> The exercise here is that one sees that it is (im)possible.

I think I begin to see your point. Bouncy packets don't necessarily work very 
well, especially when there are loops in the path. If the goal is to 
transparently proxy web connections, the least complex solution is to run the 
proxy either on the firewall or on a bridge between the firewall and the LAN.
