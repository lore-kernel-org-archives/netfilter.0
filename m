From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Using NFQUEUE from userspace with seteuid
Date: Mon, 01 Mar 2010 21:10:00 +0100
Message-ID: <4B8C1F18.8010902@netfilter.org>
References: <1267410505.18948.46.camel@r1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1267410505.18948.46.camel@r1>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: backup95 <backup95@netcabo.pt>
Cc: netfilter@vger.kernel.org

backup95 wrote:
> Hello,
> 
> I wrote a daemon to do packet filtering using libnetfilter-queue.
> 
> It works well except that I ran into problems trying to run it
> seteuid/setegid to an unpriviliged user.
> 
> Setup and teardown proceeds as root but when I try running the main loop
> seteuid/setegid to a regular user (just processing IP addresses and
> calling nfq_set_verdict really) everything slows to a crawl. I don't get
> any software errors (packets are apparently received and accepted/denied
> as usual) but all my connections time out or error out (not sure which
> yet). Like I said, works fine as root.
> 
> I'm at a loss to explain this because as far as I can tell the
> underlying netlink socket mechanism should not depend on root
> priviledges to send messages. It's strange enough that there's a
> significant slow down but no hard errors (and by that I mean
> nfq_set_verdict returning a negative value).
> 
> Can anyone at least please confirm that it should work fine and it is
> worth investigating or else just forget it and run the whole thing as
> root?
> 
> Any comments would be greatly appreciated.

Could you post the code or a sketch with the relevant section that I
could use to reproduce the problem here?
