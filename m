From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: How to restrict torrent download  ?
Date: Fri, 17 Feb 2012 14:31:27 -0600
Message-ID: <op.v9ubapr5x1lyi3@debiandesk2.net>
References: <20120216160904.2ea59e26@shiva.selfip.org>
 <1329389715.3296.12.camel@ns014530.dcyb.net> <4F3CE276.4010500@cloudways.com>
 <20120216171502.78212a3e@shiva.selfip.org>
 <20120216171909.3a3cd4c1@shiva.selfip.org>
 <1329393715.3296.18.camel@ns014530.dcyb.net>
 <1329411784.18690.463.camel@andrew-desktop>
 <op.v9saw7z7x1lyi3@debiandesk2.net> <1329502816.30413.28.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1329502816.30413.28.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Andrew Beverley <andy@andybev.com>
Cc: "Rob Sterenborg (lists)" <lists@sterenborg.info>, "J. Bakshi" <joydeep@infoservices.in>, netfilter@vger.kernel.org

On Fri, 17 Feb 2012 12:20:16 -0600, Andrew Beverley <andy@andybev.com> wrote:

> 2. Doing the prioritisation elsewhere to the rate limiting. This doesn't
> work, as you can only prioritise when you have too much traffic,
> otherwise all the packets just pass straight through. So, if you were to
> do this, you'd have to force a queue at your router, probably by
> rate-limiting (maybe with HTB as above). This is the same as when you
> traffic shape inbound traffic - you have to rate-limit to a slower speed
> than the uplink to force a queue. I'm struggling to get my head around
> this properly, so am not sure whether that could also work somehow with
> rate-limiting at the user's radio.

Hi Andy,

I may be wrong, but I thing prioritization at the load-balancing router will work, even though there is rate-limiting at the users' radios.  I'll call the load-balancing Linux router the "central router," to distinguish it from the routers in each user's radio.

The central router gets traffic from, say, 75 users and distributes it over the 5 uplinks.  I'm using connmark to mark the NEW packets from the LAN at random (with statistics module in probability mode).

(As an aside, this gives great load-balancing but breaks sessions.  That's because sites such as yahoo.com can't cope with a constantly-changing IP.  I'd rather use a load-balancing method that uses route-caching, such as that given by "ip route add default ... nexthop via ... nexthop via...", but that has resulted in mysteriously breaking connections.  I think I'll have to post here for help on that, in a separate post of course.)

So the central router establishes lots of simultaneous connections balanced over its 5 uplinks.  Each uplink is only 600 kbit, limited to maximum 500 kbit by an HTB qdisc on each uplink, to avoid queuing at the ISP.  Even though each individual user is rate-limited, the combined egress traffic can easily exceed the uplink bandwidth, and would start getting queued in the central router.

With the PRIO qdisc, if bittorrent traffic is put in the lowest priority band, bittorrent upload packets would only be dequeued when there are no packets waiting in the 1st and 2nd PRIO bands.  If all traffic except bittorent is in 1st and 2nd bands, it seems to me that no bittorrent would get out if there is any other kind of traffic waiting (queued).

As far as bittorrent download goes, I understand that bittorent will not allow a user to download (much) more than he or she uploads.  So I think it should not be necessary to prioritize the incoming traffic.  In fact I am using only a policing qdisc on ingress (again, to avoid queuing at the ISP.)

Does this plan sound reasonable to you, or am I overlooking or misunderstanding something?

Regards,
Lloyd
