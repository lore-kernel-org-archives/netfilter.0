From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: Using DNAT with multiple upstreams
Date: Tue, 18 Dec 2012 15:51:44 -0800
Message-ID: <CAJygYd1Emv_3M7nDLD8c2XwO=hc8OOMeTm1M-M4R4CDEOmi1ew@mail.gmail.com>
References: <4B5F9CC88C3B87ECDEAD7A5D@Ximines.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=yrM5OF/+zLBBXV5mVL51Ge3GCwKyLNpXYia3F9LwkL4=;
        b=auw/RvxrnTxZ/skeAVDe4Q1Koc+hcU8el4zGsrGXKcowsIjpyEZpn9yuGHgiBcVO6v
         daYYxi4wphnpIpUgK1ELiUGG9zn6dpCQB9cB6d1dsSNbrBvvmiDeqv7TXjXhPJ/SDIRW
         EHBPunb+WYKUZaI1n705yctGvohVQP8c5UiLtlCnP+Ibe9nsKVY5pafAIPPwUi38mOsW
         wDg/glcBs/B1q6DFrsvV1U8WfPFgH2eCZelFgQFbjz0mEqtF+1C/81kLh2X1aERAmUrH
         v5oiFsvgSgATSwGW3u8oj6RSBjpuL4OY5pEb0AVpLDmDVY0ndTKriVBEOODJgWphXtDq
         khxQ==
In-Reply-To: <4B5F9CC88C3B87ECDEAD7A5D@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Bligh <alex@alex.org.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

That should be implemented with creating a seperate route table, and
create a rule to match source address to that table.

Something like:

edit /etc/iproute2/rt_tables to add a new table

ip route add table <table_name> default via xxxx dev xxx
ip rule add from xxxx table <table_name>

This will give you ability to choose nexthop base on source ip.

On Tue, Dec 18, 2012 at 12:46 PM, Alex Bligh <alex@alex.org.uk> wrote:
> I have a multihomed configuration as follows:
>
>            Provider A     Provider B
>               ^              ^
>          eth1 |              | eth2
> 192.200.0.2/24 |              | 192.200.1.2/24
>              ROUTERRUNNINGLINUX
>                      | eth3
>                      | 10.10.10.1/24
>                      |
>                   ---+----
>                          |
>                         10.10.10.99/24
>
> Internet connections A and B both inject default routes when
> they are up. I use SNAT on eth1 and eth2 to NAT the range
> on eth3 to the appropriate IP address (well, SNAT on one
> and MASQUERADE on the other for boring reasons). Connection
> B is faster so injects its default route with a lower distance.
> This gives me resilience and uses the fastest connection.
> So far so good.
>
> Now, I also want to use DNAT on eth1 so that incoming connections
> to 10.200.0.2:1234 get mapped to (say) 10.10.10.99:5678. When
> the connection to provider B is down, all this works just fine.
> However, when the connection to provider B is up, the connection
> fails. As far as I can tell, this is because return traffic
> to the external host initiating the connection follows the
> default route with the lowest distance, and goes out provider B
> instead (who knows how it gets NATted).
>
> What I'd really like to do is say "if the connection is in
> your DNAT table, send it out the way it came", but I think
> the DNAT is undone after the routing decision. I can think
> of a pile of ways to solve this, many of which involve
> ugly source routing. I could use the connmark stuff I think.
> I could also (conceivably) SNAT the incoming connection
> to be originated by 192.200.0.1 so that the route out would
> always be via provider A (as that's an interface route).
> I know I have a million options. My question is what is the
> fastest way to do this (with minimal impact on other traffic).
> I'm loathe to go down the ip rule route unless I really need to.
>
> --
> Alex Bligh
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
