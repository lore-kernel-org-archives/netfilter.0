From: Robert White <rwhite@pobox.com>
Subject: Re: Problem with ipset and --in-interface
Date: Mon, 27 Mar 2017 18:29:05 +0000
Message-ID: <f22d3b15-a879-0147-a339-a31ebf413363@pobox.com>
References: <237f8db1-1a60-c97f-f965-8ed363860731@howitts.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <237f8db1-1a60-c97f-f965-8ed363860731@howitts.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Howitt <nick@howitts.co.uk>, netfilter@vger.kernel.org

On 03/26/17 08:06, Nick Howitt wrote:
> I have the following rule in my iptables:
> 
> iptables -w -I INPUT -i enp2S0 -m set --match-set country-list src -p
> tcp -m multiport ! --dports 25,80,443 -m state --state NEW -j DROP
> 
> but I've noticed it is not blocking. I tried checking using GRC's
> Shields Up test scanning port 993. If instead, I do:
> 
> iptables -w -I INPUT -m set --match-set country-list src -p tcp -m
> multiport ! --dports 25,80,443 -m state --state NEW -j DROP.
> 

There's nowhere near enough information in that post. In particular,
where are you running the "shileds up" test? If it's not coming from
another computer on the enp2S0 adapter then it would, of course, not hit
this rule for not arriving on that adapter.

Now my suspicion is that upper-case letter "S". The default naming
scheme uses lower case letters. The name match is not checked at install
time because it's a wildcard enabled text match. So for instance I can
paste that command line in on my host:

iptables --append FORWARD -i blarg -j DROP

and it will go into my rule set just fine even though I don't have an
interface named "blarg". The rule will simply hang out, doing nothing,
until I rename an interface to "blarg".

So I'd guess that you need to double-check that argument for correctness.

The rule isn't matching because the interface name doesn't match.

--Rob.
