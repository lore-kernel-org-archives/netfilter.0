From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd and CacheWriteThrough
Date: Tue, 04 Nov 2008 19:58:15 +0100
Message-ID: <49109B47.30802@netfilter.org>
References: <20081029155332.GA20850@bongo.bofh.it> <49102044.8090400@netfilter.org> <20081104160920.GA18489@bongo.bofh.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081104160920.GA18489@bongo.bofh.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco d'Itri <md@Linux.IT>
Cc: netfilter@vger.kernel.org

Marco d'Itri wrote:
> On Nov 04, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
>> Sorry, this setup is no longer supported. At least until we find a sane
>> way to do it. See http://conntrack-tools.netfilter.org/manual.html.
>> Also see: http://marc.info/?l=netfilter&m=122164806109759&w=2
> Indeed I wondered about races between the traffic and state updates.
> 
> Load sharing with a multicast MAC address and sources hashing would not
> help me because each one of my firewalls is connected to two core
> routers with no shared L2 domain between them (i.e. each router is
> connected to both firewalls).
> 
> My real goal is not sharing load but supporting asymmetrical routing,
> because the firewalls announce the customer network to the core using
> an IGP. If I am not missing anything I could use OSPF and give a lower
> cost to the port with the higher VRRP priority.
> This way I would be able to use normal active/passive conntrack
> replication.

If this can guarantee that only one firewall filters all the traffic or
that the packets follow a symmetrical path in the filtering, that should
be fine.

BTW, I'd appreciate if you send me a couple of lines describing how to
do that so that I can add it to the user manual. I get an email about
OSPF/multi-path routing issues and conntrackd working once a month (at
least), others will appreciate if we can document all possible solutions
in this setup.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
