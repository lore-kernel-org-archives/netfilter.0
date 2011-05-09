From: Ed W <lists@wildgooses.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 09 May 2011 23:49:16 +0100
Message-ID: <4DC86F6C.7020600@wildgooses.com>
References: <4DC7F632.9020105@wildgooses.com> <1304977533.1921.305.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1304977533.1921.305.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On 09/05/2011 22:45, Andrew Beverley wrote:
> On Mon, 2011-05-09 at 15:12 +0100, Ed W wrote:
>> Hi, I have a slightly peculiar requirement to track very accurate *per
>> user* traffic for a small remote userbase.  The internet connections
>> these users have available will be one or more of: a) circuit switched
>> satellite phone (ie per second billing), data volume billed (ie GPRS
>> style) satellite phone or a 3G cell phone - all of these will have non
>> trivial bandwidth costs and we want to attribute very exact costs back
>> on a per user basis.
>>
>> To do this I'm using a small custom built embedded router, and we will
>> use some form of 802.11x or captive portal style user authentication but
>> I have two areas I need advice on solving:
>>
>> 1) Best way to do per user traffic accounting *per* internet gateway. ie
>> each gateway will have quite radically different costs to run and so we
>> need to also count traffic per route.  My current thinking is to use
>> packet marking to choose the route and my tests suggest that I can
>> pickup this mark via conntrack and therefore account using ulogd/pmacct
>> or similar?  Anyone got any thoughts on other ways to slice this or
>> anything I am missing?
> 
> That sounds good. Using marks is a pretty flexible way of achieving most
> things. I don't think I fully understand your setup though without a
> diagram. How are you identifying individual users within each route? By
> IP address?

The "per user" part is still under experimentation.  The main option
seem to be some kind of authentication which then marks a MAC/IP combo
as "authenticated" and we track traffic to that device (being aware of
the limitations of that). However, if I use 802.11x auth then I appear
to get my traffic automatically put into it's own vlan - this might be
interesting, but vlans don't appear to give me a whole lot of options to
filter within iptables?

The basic scenario is a small number of guys in a remote location with
only a satellite connection to the internet.  Lets imagine they are on a
tanker steaming across the Pacific say.  The crew in this scenario might
be "sold" or otherwise allocated a quantity of data that they can use,
where the owner of the satellite connection will be paying between
$10-100/MB of data (it actually tends to be one end or the other
depending on the system used - fairly pricey anyway).  However,
occasionally the unit will be within reach of an alternative connection
such as cell phone range - at that point we want to switch over to a
cheaper circuit and adjust our billing.

Essentially it's a captive portal scenario, but most captive portals
have the luxury of billing based on all traffic crossing the internal
network, whereas we want to track usage only across the expensive link
(and track each link separately).

Suggestions and comments welcome!

Ed W
