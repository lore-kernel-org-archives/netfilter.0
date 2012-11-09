From: Alex Bligh <alex@alex.org.uk>
Subject: Re: Use iptables to force next hop
Date: Fri, 9 Nov 2012 16:50:30 +0000
Message-ID: <DE2D4F81-EE7D-4208-AB4A-F63E6744292E@alex.org.uk>
References: <FABE6FFC-E757-421A-BB4B-F18975F31E9B@alex.org.uk> <509C2EA5.6050201@ziu.info>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <509C2EA5.6050201@ziu.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Soltys <soltys@ziu.info>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org


On 8 Nov 2012, at 22:13, Michal Soltys wrote:

> You can do hybrid of sorts - that is set mark in iptables (with all the
> matching power of iptables), then use fwmark match in ip rule.
> 
> Not precisely what you're after, but gives you the same - unless of
> course you want to avoid ip rule at all cost. Once in the past there was
> ROUTE target, but it was dropped at some point (I think). Besides, ip
> rule fwmark provides essentially the same.

I thought there used to be a ROUTE target but had concluded I was
imagining things.

The situation is (essentially) that I have interfaces that appear and
disappear quite dynamically. iptables seems to cope well with
interfaces that disappear occasionally, whereas the routing table
stuff does not. Actually I don't need to know what interface
I am routing out of, I want to simply route anything matching
my iptables rule to a next hop with a particular IP address (however
that is reached).

So I can do that with fwmark and ip rule, with a routing table
which routes everything to one IP, but that means one routing table
per rule, which isn't going to scale quite the way I'd like (I'm
presuming generating several hundred routing tables is not a
fantastic idea).

-- 
Alex Bligh




