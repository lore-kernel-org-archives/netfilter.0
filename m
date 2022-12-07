From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables: origin sport after dstnat
Date: Wed, 7 Dec 2022 12:29:00 +0100
Message-ID: <20221207112900.GA28507@breakpoint.cc>
References: <20221206230347.205a59c1@deskFu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20221206230347.205a59c1@deskFu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Fischer <mail@aaron-fischer.net>
Cc: netfilter@vger.kernel.org

Aaron Fischer <mail@aaron-fischer.net> wrote:
> The problem is that the DOCKER-USER chain is behind the dnat, so I
> can't use "sport", because it is already a random port from the dnat :(
> 
> With a trace in that chain, I got this (sport is 57484, a random port)
> and the filter rule does not work.
> 
> trace id 2a3fb2fd ip filter DOCKER-USER packet: iif "eth0" oif "docker0" ether saddr 52:54:00:8e:37:c7 ether daddr 52:54:00:9c:e5:b7 ip saddr 192.168.122.1 ip daddr 172.17.0.2 ip dscp cs0 ip ecn not-ect ip ttl 63 ip id 57921 ip length 60 tcp sport 57484 tcp dport 5000 tcp flags == syn tcp window 64240 
> trace id 2a3fb2fd ip filter DOCKER-USER rule tcp sport != 8448
> counter packets 6 bytes 360 drop (verdict drop)
> 
> Is there a way to somehow access the origin sport (8448 in my case), so
> I can filter for it in the FORWARD chain?

Yes, the original addresses are stored in conntrack: 'ct original proto-src 8448'
