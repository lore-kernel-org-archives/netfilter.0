From: jeev <smallpox@gmail.com>
Subject: Re: DUAL wan issue, destination-based routing
Date: Wed, 28 May 2008 13:26:42 -0700
Message-ID: <840713630805281326i59d129bch27e06228295feef2@mail.gmail.com>
References: <840713630805271644hff81960m5c6bea1b612a973c@mail.gmail.com>
	 <840713630805271651r116edbb8y58973325c2f7fa49@mail.gmail.com>
	 <483CE789.40806@trash.net>
	 <alpine.LNX.1.10.0805281350010.1470@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=AwBUSRCJHm/MqCTU407jS0PHwZnKKuiHkfzRikAiS90=;
        b=PuEolW05Ke4HrlFjv8qWVdlV4zKI7XwpaWW4MbNHi7OTRV1/as/KzesyBE8MvNSUwF6SsIdm6skJ3sZeaqhvB9rAsUakGov45LQHwwTtLuyb6tuoqANdmqmM8zPfvQQZ9oRItbNNdnrVTOw75g9vn0bgGJZSAPWJm91lfjpHY4k=
In-Reply-To: <alpine.LNX.1.10.0805281350010.1470@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org

ok.

i sort of understand..

i've managed to get it working with the following:
ip route add 69.17.117.0/24 via GATEWAY-OF-ETH2 src IP-OF-ETH2

AND adding this to iptables before the default route.

-A POSTROUTING -t nat -o eth2 -s 192.168.2.0/24 -d 67.17.117.0/24 -j MASQUERADE

i do understand the link you gave me but do not understand where i
input details of the networks in question.

i want to route everything out the default connection which would be
eth3, EXCEPT for what i define in ip blocks like i listed above.

and as far as the commands i ran up there to get them working. i have
2 cable modems, node is running great right now, i should be able to
get 10mbit from each but when i run a speedtest using one ip and then
start the other.. it slows down.. (making me believe that it's still
riding off one ip somehow) so when i get home, i'm going to look at
graphs i guess.

also, i have a viatalk linksys adapter at home and it's set up as following:

ip route add table 10 dev eth2
ip rule add from 192.168.2.5/32 table 10 priority 1
and
    0     0 MASQUERADE  all  --  any    eth2    viatalk  anywhere

and as i just restarted the adapter

   10   563 MASQUERADE  all  --  any    eth2    viatalk  anywhere

the adapter does pick the correct external ip now but it's still
having trouble connecting to the login server.

any help would be appreciated.

i really am considering dropping back to PFSENSE on bsd.. i was also
having some minor issues there but it was about something else
although it was rock solid for about 2 months.

thanks everybody.

On Wed, May 28, 2008 at 4:50 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Wednesday 2008-05-28 07:03, Patrick McHardy wrote:
>
>> jeev wrote:
>>> Hey guys, i was reading on the netfilter site.
>>>
>>> I saw Patrick McHardy wrote about having 2 cable modems... i'm in the
>>> same situation... my only problem is that I dont want to do load
>>> balancing, i've just come from using PFSENSE/freebsd to use
>>> ClarkConnect on CentOS i guess.. i've never used iptables before. i've
>>> tried things like:
>>>
>>> "iptables -A POSTROUTING -t nat -o eth2 -s 192.168.2.0/24 -d
>>> 67.17.117.0/24 -j MASQUERADE" and it still doesn't work.
>>>
>>> 192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.1
>>> 24.x.x.0/23 dev eth2  proto kernel  scope link  src 24.x.x.23
>>> 71.x.x.0/23 dev eth3  proto kernel  scope link  src 71.x.x.6
>>> default via 71.x.x.1 dev eth3
>>>
>>> so right now i have all traffic go out eth3, i'd love to have the ips
>>> and ipblocks i select and have it go out one of the cable interfaces.
>>> so for the example above, i want www.speedtest.net (because it shows
>>> the ip) to go out eth2 but it's still going out eth3.
>>
>>[...]
>> You can use any criteria you like for distribution, the important
>> thing is to make sure connections stay on one connection when using
>> NAT (since many providers don't allow spoofed addresses), [...]
>> Dealing with incoming connections on both internet connections
>> is trickier because you need to make sure they go out the same
>> way they came in, so I'll skip this because I'm short on time
>> right now :)
>
> As described in http://dev.medozas.de/NF-Cookbook.txt.
>
>
