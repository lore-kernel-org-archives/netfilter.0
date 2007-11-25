From: =?ISO-8859-1?Q?J=F6rg_L=FCbbert?= <j.luebbert@login-lanstation.de>
Subject: Re: Policy Routing with fwmark and iptables -j MARK
Date: Mon, 26 Nov 2007 00:50:02 +0100
Message-ID: <474A0A2A.7000107@login-lanstation.de>
References: <62183.64.81.58.143.1195982779.squirrel@calmail.berkeley.edu>    <47497869.4000901@login-lanstation.de> <1532.128.32.225.98.1196030079.squirrel@calmail.berkeley.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1532.128.32.225.98.1196030079.squirrel@calmail.berkeley.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

> $IPTABLES -A PREROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
> to catch the generic packets just in case?

I don't know your full ruleset, but I don't see a point in making a rule 
here to accept packets that have any mark set but the mark 0?

I suggest you to read up about marks some more.

- A connmark is a mark that is present on a whole connection
- A mark is only present on a single packet
- tc filter can only handle normal marks. It doesn't know about connmark
- ip rule can also only handle normal marks

> No, I don't want to make a routing decision with L7, rather I want to use
> the marks it sets with tc. I'm using the userland version of L7-filter, so
> since L7 defaults to queue number 0, I have the
> $IPTABLES -A FORWARD -j NFQUEUE rule so that it gets everything there. 

Right

> But L7 edits the mark itself - of
> all the packets in a connection if I understand correctly - 0 for not
> looked at, 1 for looked at, 2 for gave up, and other marks signify
> identification.

I'm not aware of the fact that l7 filter uses fwmark for internal packet 
processing.

Anyways. As far as I can see, you want to use l7 filter in combination 
with tc and you want to use packet marks for routing.

I already explained about the routing part. So here comes the other:

Since tc filter rules are evaluated after the postrouting chain, you can 
use -m layer7 matches in the mangle table of the postrouting chain and 
set -j MARK the way you like. tc filter will pick them up and it will 
not interfere with the routing decissions. ie.

$IPTABLES -A POSTROUTING -t mangle -m layer7 --l7proto httpaudio -j MARK 
--set-mark 20

