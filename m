From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Why can't we use DNAT in the INPUT Chain?
Date: Sat, 19 Aug 2017 08:28:27 -0500
Message-ID: <20170819132827.GY2027@harrier.slackbuilds.org>
References: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Aug 19, 2017 at 01:36:20PM +0100, khawar shehzad wrote:
> I have a simple question,

But the question seems to lack necessary understanding.

> but I have a very compeling application which
> requires this feature.
> 
> I want to do DNAT in the INPUT chain. I am doing filtration at the
> PREROUTING chain (getting rid of some source IPs based on a vmap).
> 
> Those IPs which are accepted after the prerouting filter, I need
> to DNAT them only. I don't want to use router to do it in the
> FORWORD chain.

The thing you seem to be missing is the concept of tables.  Refer to 
the iptables(8) manual discussion about tables.

Network address translation (NAT) only happens in the "nat" table; 
this table has no "INPUT" nor "FORWARD" (note: spelling counts! ;) ) 
for your use.

Filtering is done in the "filter" table, which likewise, has no 
"PREROUTING" chain.  To some extent you could filter in the "raw" 
table, but there's not much benefit to that.

You did not describe your use case very well, but from the little 
which did come across, perhaps you could drop certain source IP 
addresses in raw/PREROUTING.  Then do DNAT in nat/PREROUTING as 
normal.  These connections will be seen again in filter/FORWARD.

(If the list of blocked source addresses is large and/or dynamic, 
consider ipset(8) and the -m set match.)

http://inai.de/images/nf-packet-flow.png might help you to see how 
packets flow through the various tables and chains.

Try describing your problem and goal a bit better (what does "don't 
want to use router to do it in the FORWORD chain" mean?  What's the
problem with normal DNAT?) then perhaps we can offer more and better
suggestions.
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:

