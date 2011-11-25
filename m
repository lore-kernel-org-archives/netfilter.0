From: Andy Furniss <andyqos@ukfsn.org>
Subject: Re: PortalShaper - details of scripts for a captive portal and traffic
 shaper
Date: Fri, 25 Nov 2011 12:58:48 +0000
Message-ID: <4ECF9108.4030506@ukfsn.org>
References: <1321999757.2382.2523.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321999757.2382.2523.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Andrew Beverley wrote:
> Hi all,
>
> I'm posting this for people's interest, in case it is of use to anybody.
>
> I have created a set of scripts (called PortalShaper) to do the
> following:

>    * Traffic shape the internet connection to optimise its speed

Just looking at this bit.

Generally, I think doing Qos on low bandwidth lines is in need of 
tweaking on a per case basis, depending on requirements and the usage 
patterns of the users.

I've only ever played with my home dsl and go for game latency as top 
prio, with any bulk traffic of whatever nature easily classified.

So the points below really apply just to my personal experience - for 
other use the script looks fine and is as good as any. None are going to 
be perfect without tweaking for individual cases and getting a lot of 
users sharing low bandwidth dsl is never going to be nice.

Random observations.

I've never used squid, but it looks like it is exempt from shaping.

You could tweak things so you don't have to back off more than a few 
kbit/s on upstream and it wouldn't fail if there were lots of small 
packets. I can't say from personal use because I do it with patched TC, 
but it is possible to specify atm and an overhead with htb and tc will 
use the atm size of the packets.
The reason I don't use it is that I shape for pppoa vc mux on an eth 
interface and tc on eth sees packets as iplen + 14 so I would need a 
negative overhead. For ppp tc sees ip length. It's tricky for a general 
script, of course, because you need to know exactly the overhead to use 
which is different for different ppps and shaping interfaces.

On bulk btb classes I found it best for latency to set burst and cburst 
to 10 - effectively off (can't remember why I didn't use 1 - I know 0 
didn't work).

To get the best possible latency with htb it's best to allocate way more 
bandwidth than the class needs and set big bursts, this is not so good 
if your classification fails though.

