From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: still can't route using fwmark
Date: Sat, 18 Apr 2009 15:49:29 -0600
Message-ID: <op.uslqwresx1lyi3@localhost>
References: <op.uskfabufx1lyi3@localhost>
 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
 <20090418205802.GA16790@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090418205802.GA16790@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, 18 Apr 2009 14:58:02 -0600, Thomas Jacob <jacob@internet24.de> wrote:


> Are you forwarding packets via this box, or do you want to loadbalance
> packets from the local machine? In the latter case the PREROUTING
> stuff needs to go into INPUT/OUTPUT.

Well, I want to load-balance packets from the local machine, which is serving as gateway for a home LAN (eth0).  The local machine is 192.168.1.1 on the LAN.

Might this point you made be my problem?  I will try removing the network 192.168.1.0 and just use lo, to see what happens.

>> > Also you could try to remove those two routes in the default table, which I
>> > gather from your description are routes for $gw0=$gw1=10.60.255.254 (btw, the
>> > second will normally never be used anyway), I remember having problems before
>> > when routes matched after the policy route tables in the main table.
>>
>> Do you mean the routes in the rt_link1 and rt_link2 tables?
>
> no, the ones in the "main" routing table (that you displayed using "ip route show [table main]).
>

When I remove the default route in the main routing table, I completely lose Internet connectivity.   My logic tells me that a default "main" route should not be necessary at all if all packets are marked and sent to my 2 custom routing tables (rt_link1/2), each of which has a default route.


> Yes, if you have a way to find your gateway (which is sort of implicit
> when both gateway are on the same ethernet link with mask /24 for instance), but
> in your case you seem to need host routes to designate where your default
> gateways are (the first route in rt_link1/2), 

>and the two routes in main
> are the same as the first route in rt_link1 and 2 combined, right?
YES

The gateways are assigned at the time the ppp0 and ppp1 links are established.  I get it by:
debiandesk:/home/lloyd/data/loadbal# ip route show dev ppp1
10.60.255.254  proto kernel  scope link  src 10.60.9.178

So, I can use this shell script line to get the gateway for ppp1 into variable gw1:
gw1=`ip route show dev ppp1 | head -n1 | cut --delimiter=" " --fields=1`

The only experience I have with iptables is simple firewall stuff for my Internet-connected server.  My grasp of routing is weak, and this trouble is good experience in an area I would like to become expert in.  

>
> But maybe one does not need gateways for ppp since there should be no one else
> on that link anyway (as you suggested with your "default dev pppX" routes).

I don't think I understand your comment.   I need a gateway IP to forward Internet queries to... 
>
>
> I am running out of ideas, sorry, maybe someone else on the list
> can chime in, I've only ever done policy routing with public IPs and
> broadcast networks, and there it always worked without problems
> on stock Debian Etch, CentOS 5.X or custom built kernels.

I really appreciate your advice.  I'm a networking novice so my ideas are not rooted in experience, but I think it should not matter that the gateway IP is a private IP.

