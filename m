From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptable how many rule can manage iptable
Date: Wed, 12 May 2010 22:47:03 +0200
Message-ID: <4BEB13C7.2040600@chello.at>
References: <l2vf1cc03e01005121009j3ce0e30cj56ac615688a58916@mail.gmail.com> <20100512200954.3f53f3f6@catlap>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100512200954.3f53f3f6@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: e2ia.ci@gmail.com


>> i'd like to know how many rule can manage iptable.
>> I'm asking that because i'd to drop all traffric from my localnet to
>> porn site. I've a database of porn site witch contain about 900 000
>> domains. I know there are solutions like squidguard. But for my linux
>> box i'd to use iptable to prevent users access to porn site and other
>> blacklist site.
> 
> It's not feasible to implement 900 000 long ruleset in iptables
> even with ipset extension or with fancy hierarchical chains. The
> other problem is that iptables works on ip addresses and your database
> is comprised of domains. There can be more then one site on single ip
> address. Blocking IPs and not domains could cut access to some legit
> sites.
> 
> Squid+squidguard is good option. I've heard of some dns based
> solutions (domain blacklisting on dnscache level), but I don't know any
> actual software.
i.e.

http://www.peereboom.us/adsuck/

adsuck is a small dns server that spoofs blacklisted addresses and
forwards all other queries. The idea is to be able to prevent
connections to undesirable sites such as ad servers, crawlers, etc. It
can be used locally, for the road warrior, or on the network perimeter
in order to protect local machines from malicious sites.

