From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: How to add overlapping CIDR blocks in a set and have a way delete
 them ?
Date: Thu, 7 Oct 2021 12:29:06 +0100 (BST)
Message-ID: <54e6e3f6-d622-f6ed-22f1-a843b3df13c5@jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=date:from:to:subject:message-id
        :mime-version:content-type; s=uk; bh=/fdOah75734lvyuCH0QPC1yZ4jB
        5XTSxkw78Fzxvj78=; b=I8szPL91q7XVxss6c6osGwZkN8vcO8fRrvN8wBCxBEB
        09TS044MAbve4OJnfhF8vDzazH9kr3BiRBD01IODi+1jP2TLIFZ/s69N/deLdf+8
        YGjL8g8xiamReyn5JdeFSViGiBsEFySzHBTWeDJatKgIMt3wsexReAQM6S+Ff+ZV
        Mr13n1YaO1NT1RRDjMISOcNFFsleLmVZvwS7p8WockLQ49+/ujDfnK8YoQPklawl
        1wstTJXu574zBC+WCfdhuElfD7pCvQYOrLfCHiMUcrFlH9ntVhtRDp0lDHm6ttBP
        68BUADqA+yrUmTieB2o9R4qT4vcem+uAOLjLTtqCeAQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shivam Sandbhor via Netfilter mailing list <netfilter@vger.kernel.org>

Hi there,

On 4 Oct 2021 Shivam Sandbhor wrote:

> For context, we are detecting nefarious IP ranges/CIDR blocks by
> parsing the live logs of various services (eg nginx, apache etc) using
> the crowdsec agent. After the agent detects a nefarious IP range, we
> want to block the range using nftables. To do this we tried adding IP
> range to a nftables set, with appropriate rules in place.
> 
> The problem we are facing is when the agent detects IP ranges which
> overlap. In such cases, nftables rejects the newer overlapping range.
> Even if the previous range is smaller.
> 
> We tried using the "auto-merge" flag for the set but it doesn't solve
> the problem because only ranges present in the same
> transaction/command are auto-merged. Also we want to provide users an
> option to delete a range. But this won't be possible if this range was
> merged to some other range by nftables.
> 
> So how do we add IP ranges in a nftables set which are potentially
> overlapping and have a way to delete the originally provided ranges ?

I haven't seen any reply to your message so I'll chime in, although
this might not be quite what you're looking for.

I do this sort of thing a lot with one of my milters.  The milter can
block any IP range or even entire ASNs - which can be thousands of IP
ranges.  The way it does it is to use Net::CIDR::Lite (it's all Perl)
or Net::CIDR to reduce any range to a minimum set of non-overlapping
but contiguous CIDR blocks and then add each of these blocks to a set
which contains *only* blocks of that size.  So There are sets which I
have called

BLOCKSET32 Blocks individual IPs.
BLOCKSET31 Blocks any /31
BLOCKSET30 Blocks any /30
BLOCKSET29 etc.
BLOCKSET28 etc
...
...
BLOCKSET09
BLOCKSET08

For example to block the range 192.0.2.63 to 192.0.2.129 inclusive it
would need to add three elements (not necessarily in this order):

ipset -exist add BLOCKSET32 192.0.2.63
ipset -exist add BLOCKSET25 192.0.2.64
ipset -exist add BLOCKSET32 192.0.2.129

The 'add' commands use the '-exist' option so it doesn't matter if
they're already there.  I don't generally delete ranges, but to do
that you could do more or less the same thing in your code and then
call 'ipset -exist del' instead of 'ipset -exist add'.  You say that
you want users to be able to delete ranges; I don't know what you'll
do if one user wants to block a range and another user doesn't. :/

The 25 sets themselves (together with one or two others and a chain
which calls them all) are created by a shell script at boot.  In my
implementation there's no set larger than /8 which is easily fixed. :)

If you'd like to see some code I'll be glad to let you have it, or to
post something here if there's interest.  It took a while to get this
working right and there were some quirks in early versions of 'ipset'
(I think earlier than about v7.3) which sometimes crashed the kernel
for the odd very large set (a few thousand rules).  As long as you use
recent versions of everything it should be robust, it's been running
here for several years although I've moved on a little from the early
purposes of outright blocking to something a little more, er, flinty.

--

73,
Ged.
