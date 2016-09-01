From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: nf_conntrack_max
Date: Thu, 1 Sep 2016 12:05:40 -0500
Message-ID: <20160901170540.GQ28999@harrier.slackbuilds.org>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <20160831224731.GP28999@harrier.slackbuilds.org>
 <20160901105911.GA2779@salvia>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160901105911.GA2779@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Pablo, thanks for taking the time to reply.

On Thu, Sep 01, 2016 at 12:59:11PM +0200, Pablo Neira Ayuso wrote:
> On Wed, Aug 31, 2016 at 05:47:32PM -0500, /dev/rob0 wrote:
> [...]
> > One more thing I can add: I believe it is possible to set 
> > different conntrack timeouts based on protocol/port.
> 
> Right, this is possible.
> 
> > I don't know exactly how to do that, but it would make sense for
> > udp/53 to shorten that to something like 15 seconds; just a bit
> > beyond the nameservers' and resolver clients' timeout values.
> 
> Setting custom timeout policies per address/protocol/port (any 
> selector basically) is possible through -j CT --timeout name from 
> the raw table.
> 
> You have to create the timeout policy in first place through 'nfct' 
> that comes in the conntrack-tools package. I think there are 
> examples for this already, otherwise let me know and we can place 
> it on the manpage.

Okay, here's what I'd try for udp/53:

# nfct timeout add dns-udp inet udp established 15 close 1 close_wait 1
# iptables -t raw -A PREROUTING -p udp --dport 53 -j CT --timeout dns-udp
# iptables -t raw -A OUTPUT -p udp --dport 53 -j CT --timeout dns-udp
# iptables -t raw -A PREROUTING -p udp --sport 53 -j CT --timeout dns-udp
# iptables -t raw -A OUTPUT -p udp --sport 53 -j CT --timeout dns-udp

(Understood that not all sites would need both the --dport and the
--sport sets of rules.)

root@tp:~# nfct version
nfct v1.4.2: utility for the Netfilter's Connection Tracking System

Perhaps I am looking at an older version of the man page (Slackware 
14.1, still have not upgraded to 14.2), but indeed more discussion of 
the conntrack states and other arguments would help.

The example for TCP has:

nfct <subsys> <cmd> <args>

where <args> are:

<name> <L3-proto> <L4-proto> <ctstate> <secs> [ <ctstate> <secs> ... ]

The subsys and cmd are documented, but args are not.

It would be ideal to have some information about each argument and 
the various conntrack states which can be set; if possible even some 
words about what default values exist for various protocols, and also 
about what changing these values might do.

What I don't know (can't tell from the man page) is if there is any 
way to clear out the conntrack entry after a reply has been received.  
Again/still we are talking about UDP DNS here, where a complete 
"connection" consists of exactly two packets: the query (--dport 53) 
and the reply (--sport 53).

After the reply is sent (from a nameserver, or received, on a client) 
there is no need for that conntrack entry to remain.

> Now that nft has come, the plan is to unify all these command line 
> tools such as conntrack and nfct into nft, so we end up using one 
> single tool to interface with the netfilter subsystem in the 
> future.

This sounds good.  For the time being, however, I continue to relax 
in the comfort of iptables-land. :)
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
