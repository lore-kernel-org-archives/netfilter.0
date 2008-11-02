From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Basic Routing
Date: Sun, 02 Nov 2008 10:43:22 -0800
Message-ID: <490DF4CA.1010808@amfes.com>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <013f01c93d0c$f4a47410$dded5c30$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Rob Sterenborg wrote:
>> To act as a router, where a box has two NIC's, and is connecting a
>> LAN with 192.168.0.0/24 to the Internet - is SNAT required?  Or can
>> this be accomplished without NAT?
>>     
>
> 192.168.x.x is private space IP. You cannot route private space IP's on
> the internet: you need NAT to give internet access to your clients (or a
> proxy if you only need protocols for which proxies are available). This
> can be done with SNAT, MASQUARADE (some people need this instead of
> SNAT) and I've read somewhere it can also be done using "ip" but I'm not
> familiar doing that.
>   
Thanx.  I'm still not sure of the vocabulary with which to phrase my 
"true" question - so I'll try it with more words (although I think 
you've already answered me - I'm just looking for confirmation).

Given:
1.  A linux box "router" that has ip-fowarding enabled, and no 
restrictions via iptables.
2.  This box has a routing table that lists two or more networks

If another host on network 'A', lists the box "router" as its default 
gateway, and tries to contact network 'B' through the router - will the 
router automagically pass along the packets?  Or this simply doesn't 
work, because of a basic networking concept I haven't grasped - and NAT 
is the technique to accomplish this?

I guess part of my difficulty lies in a lack of experience configuring 
non-linux routers.  Behind-the-scenes, as it were, do all/most routers 
use NAT to accomplish the goal of linking networks?  It always seemed to 
me NAT was a 'kludge' that was somehow unnecessary when "more 
expensive?" equipment was involved.
-- 
Daniel
