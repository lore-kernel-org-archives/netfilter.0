From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd questions
Date: Thu, 21 Feb 2013 19:37:11 +0100
Message-ID: <20130221183711.GA6061@localhost>
References: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
 <20130219195237.GA3208@localhost>
 <CAHPDOiFpF2+F8CTJ_fF26bXaCtTCUMDPV8JtZT-HX+m2u1j3AA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHPDOiFpF2+F8CTJ_fF26bXaCtTCUMDPV8JtZT-HX+m2u1j3AA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <listaddr@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Marco,

On Thu, Feb 21, 2013 at 01:23:30PM +0100, Marco wrote:
> 2013/2/19 Pablo Neira Ayuso <pablo@netfilter.org>:
> 
> > There are several things that you can check to troubleshoot
> > conntrackd:
> 
> Ok, I think I see what's happening. To understand, I captured traffic
> both on the client, and on the upstream router (upstream to fw1 and
> fw2).
> On the client, I just see that when wget stops downloading, the
> traffic stops in the middle of the TCP flow. The client is just
> waiting for the server to send more data.
> 
> But on the capture taken on the upstream router, I see that, at the
> point when the client hangs, there are many RST packets directed to
> the website from which the client was downloading. Obviously, this
> resets the connection and the client has a hard time waiting for more
> data. I suspect these RST are coming from one of the firewalls. For
> example, while there is a failover from fw1 to fw2, but fw2 hasn't
> synchronized the full conntrack table yet, data comes back from the
> website; fw2 doesn't know anything about it yet, so it sends RSTs.

Thanks, that's a much more accurate report, I can help you better with
that.

> Could a race like this be possible? I can probably live with that, but
> I'd like to understand if my analysis is correct.
> If I disable external cache, it still happens, although less frequently.

The firewall sends an RST if it finds no state information / the
traffic is considered to be invalid by the TCP tracking code.

In your previous config, assuming you use a 3.x kernel, I saw you did
not enabled TCPWindowTracking On. That allows the new primary to
recover TCP window tracking from the middle.

Another possibility is to disable disable TCP tracking.

echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal

I think they are documented in the official docs, let me know if not.

It's also good to have a "sane" stateful rule-set, ie. one that drops
invalid traffic, see the rule-set in:

http://conntrack-tools.netfilter.org/testcase.html

for instance.

Regards.
