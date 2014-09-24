From: Maarten Vanraes <maarten@ba.be>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Wed, 24 Sep 2014 11:35:59 +0200
Message-ID: <4623776.NNCmRlCAkc@localhost>
References: <1955116.aThXd60LEg@localhost.localdomain> <5421B0B4.4040106@ngtech.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5421B0B4.4040106@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

conntrack and conntrack ? i'm assuming this is a typo?

so, even some kind of odd udp reply will still be the same connection if it's 
within 30seconds?

so, i can use connmark on not just TCP, but on all protocols?

Regards,

Maarten

Op dinsdag 23 september 2014 20:41:08 schreef Eliezer Croitoru:
> Hey Maarten,
> 
> As long as I remember conntrack and conntrack are working together.
> Which means that udp traffic will be distinguished the same way as TCP
> as long the connection tracking categorized it under the same connection
> stream.
> (I think for unestablished connection 30 secs and more for an
> "established" one)
> 
> Eliezer
> 
> On 09/23/2014 03:46 PM, Maarten wrote:
> > Hi,
> > 
> > until now, i've done multiple ISPs with nexthop default route, 2 extra
> > tables, ip rule and TCP connmark.
> > 
> > but, how does this involve UDP traffic...
> > 
> > if for example i have in my NAT LAN an NTP server, how would i get the udp
> > packet out the same interface where it was originally coming in from?
> > 
> > please advise...
> > 
> > Maarten
-- 
BA NV
IT & Security
