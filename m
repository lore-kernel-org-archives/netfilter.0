From: Don Hoover <dxh@yahoo.com>
Subject: Re: Port forward/bounce no external interface
Date: Mon, 9 Feb 2009 12:00:02 -0800 (PST)
Message-ID: <59052.37611.qm@web65501.mail.ac4.yahoo.com>
References: <498CA85D.1020609@chello.at>
Reply-To: dxh@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <498CA85D.1020609@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hey that worked.. Thanks.



---
Don Hoover
dxh@yahoo.com


--- On Fri, 2/6/09, Mart Frauenlob <mart.frauenlob@chello.at> wrote:

> From: Mart Frauenlob <mart.frauenlob@chello.at>
> Subject: Re: Port forward/bounce no external interface
> To: netfilter@vger.kernel.org
> Date: Friday, February 6, 2009, 4:15 PM
> Mart Frauenlob wrote:
> > Don Hoover wrote:
> >> I want to forward all connections on a port to
> another box on the same internal network.
> >> 
> >> For instance, I want to forward all traffic on my
> server:5000 to go anotherbox:9000
> >> 
> >> I have little experience with iptables, and I am
> currently not using it at all on this server, so I will need
> to setup a small iptables configuration from scratch
> including any required setup before whatever command is
> needed to do this.
> >> 
> >> This will all be in the same network and not
> actually be going across interfaces...the client, server,
> and otherbox are all located on the same internal network.
> >> 
> >> I am sure this is probably easy for someone what
> really knows what they are doing.... AND...I have been
> reading as much as I can on this, and all the examples I
> have found via extensive google searching all deal with the
> apparently much more common case of forwarding incoming
> connections on a external facing network interface to a
> different port for a different IP on an internal facing
> interface, ala firewall router.  And that just does not
> apply here.  I kinda thought maybe what I wanted was a
> variation on that and I tried some different things but none
> of them worked.
> >> 
> >> Any help?
> >>   
> > Hello,
> > 
> > Please try:
> > 
> > iptables -t nat -A PREROUTING -s your-network -d
> server -p tcp --dport -j DNAT --to-destination
> anotherbox:9000
> 
> sorry, I missed the port string.
> should be:
> 
> iptables -t nat -A PREROUTING -s your-network -d server -p
> tcp --dport 5000 -j DNAT --to-destination anotherbox:9000
