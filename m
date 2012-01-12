From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Dual WAN set-up
Date: Thu, 12 Jan 2012 17:48:51 -0500
Message-ID: <201201121748.51479.dyioulos@onpointfc.com>
References: <201201121651.18887.dyioulos@onpointfc.com> <1326407319.2182.2.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1326407319.2182.2.camel@andrew-desktop>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday 12 January 2012 5:28:39 pm Andrew Beverley wrote:
> On Thu, 2012-01-12 at 16:51 -0500, Dimitri Yioulos wrote:
> > Hi, folks.
> >
> > Please bear with me.  I may have asked something similar in
> > the way-back, but am going to ask again, because I really
> > need to get this set up, have absolutely no idea how, and am
> > pertrified at the prospect:
> >
> > I currently have an iptables/Netfilter firewall router
> > configured thusly:
> >
> >                                WAN
> >
> >  (192.168.x.x) LAN --  fw -- DMZ (10.x.x.x)
> >
> > OK, pretty basic.  And, it has worked well for a long time.
> >
> > Now, I need to add a second WAN (provided by a second
> > provider). I need it to serve specific boxes in the DMZ, both
> > inbound and outbound.  Currently, all boxes in the DMZ are
> > served by the single WAN connection.  I'm not sure what other
> > information I need to provide you, but I'm hoping you all can
> > help with very specific instructions or a very detailed
> > how-to
>
> If you check the list archives there's been a few discussions
> on this recently (search for load balancing).
>
> One way of doing it is marking each connection and balancing
> those, as described in this excellent web page:
>
> http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-n
>etfilter-load-balancing-using-connmark
>
> Andy
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


Thank, Andy.  I'll give it a read.  I'm not sure I'm after load 
balancing, though, but rather dedicating one WAN to a specific 
set of machines, if that's even possible.  Also, I've seen 
how-to's on the NET, but all assume that you're starting fresh, 
and adding two WAN connections.  I already have one in place, and 
working fine.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

