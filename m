From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Dual WAN setup redux
Date: Wed, 1 Feb 2012 11:51:30 -0500
Message-ID: <201202011151.30910.dyioulos@onpointfc.com>
References: <201201271803.19071.dyioulos@onpointfc.com> <1328030100.2018.1.camel@andy-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1328030100.2018.1.camel@andy-laptop>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: "DiCecca, Caitlin" <cdicecca@onpointfc.com>

On Tuesday 31 January 2012 12:15:00 pm Andrew Beverley wrote:
> On Fri, 2012-01-27 at 18:03 -0500, Dimitri Yioulos wrote:
> > Well, here I am, again, asking for help setting up a dual WAN.
>
> Any chance of an ascii diagram? It's a bit difficult to understand what
> you have and what you are trying to achieve without it.
>
> Andy
>
>

Lloyd, Andy, and others,

Let me see what I can do here:


                                                                WAN2                       
                                ___________   75.x.x.24/29, gw 75.x.x.30
                                |              |---------eth3 (75.x.x.25) 
                                |              |      (eth0:0=75.x.x.26, ...)
Local network           |              |                   
192.168.100.0/22 ----|fw/router|                 WAN1
eth1 (192.168.100.1) |              |   65.x.x.160/27, gw 65.x.x.161
                                |__________|--------eth0 (65.x.x.162)
                                       |             (eth0:0=65.x.x.163, ... )
                                       |                     
                                    DMZ  
                           192.168.1.0/24             
                         eth1 (192.168.1.1)    
                                       |                                       |               
                                       |                      
                                       |
          ___________________|_____________________               
          |                   |                   |                   |
        box1            box2             box3            box4
   192.168.1.2  192.168.1.3   192.168.1.4   192.168.1.5
   (65.x.x.163    (65.x.x.164   
      eth0:0)          eth0:1)

I'd like for boxes 3 and 4 to use WAN2.

The above probably looks like an unholy mess (and it may be; a discussion for 
another day, though), but hope it helps clarify things.  That's what I'm after.

Thanks.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

