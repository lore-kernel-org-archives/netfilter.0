From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
Subject: Re: Bizarre rule requirement
Date: Fri, 31 Dec 2004 15:43:57 -0700
Message-ID: <41D5D62D.5060906@starnetworks.us>
References: <41D5A87C.4040508@starnetworks.us>	<20041231195406.GA7578@bender.817west.com>	<41D5B11C.9060303@starnetworks.us>
	<20041231204004.GA7810@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041231204004.GA7810@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

Jason Opperisano wrote:

> free, seems current, not sure if it meets your requirements:
> 
>   http://siproxd.sourceforge.net/index.php

It very well could... I've been playing with it, but my ultimate goal 
for this is to put the result onto a Linksys WRT54G/GS running the 
Sveasoft customized firmware. There are versions of siproxd built for 
that box, but I am not yet comfortable that it's reliable enough to 
deploy to client sites (siproxd, that is).

> explain to me how the above rules would not successfully forward the UDP
> traffic to your server, because i must be missing something.  whether or
> not it's how you would *like to do it* is immaterial.

Well, unless I'm misunderstanding, the rules you posted will not work in 
this application because:

1) You are forwarding all inbound UDP traffic to a single device. My 
example was simplified; the final application for this technique could 
have tens of phones behind the NAT, each needing to work this way. 
That's why I phrased my original request the way I did; it was 
predicated on learning the outbound port number and other bits related 
to a specific "connection" (even though this is UDP) and basing the 
inbound rules on those details.

2) You assume that the port number assigned when the phone sends out its 
first UDP packet (from port 4000) by the NAT will also be 4000... it 
very well may not be, if that port is already in use on the public side 
of the NAT for another user. In that case, the FORWARD rule can't work, 
because it doesn't know what port number the conntrack code assigned for 
this specific connection (and it could be different for the next 
connection).

I'll spend some more time working with siproxd to see if it can do what 
I need. If not, I suppose it would be possible to create a netfilter 
module that watched for the outbound UDP and created a RELATED 
connection with the appropriate inbound rule. It wouldn't have to peek 
into the packets at all, just use the information already present in the 
conntrack structures.

