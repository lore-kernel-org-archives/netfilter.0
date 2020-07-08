From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Moving from ipset to nftables: Sets not ready for prime time yet?
Date: Wed, 8 Jul 2020 12:16:18 +0200
Message-ID: <44067eef-0cfe-ac29-f3e6-463c20d8e38d@thelounge.net>
References: <20200702231812.E43146C80D34@dd34104.kasserver.com>
 <alpine.DEB.2.21.2007030758180.6006@piplus.local.jubileegroup.co.uk>
 <a140ef1f-b238-3c8b-d8ec-3e266a893aea@thelounge.net>
 <874kqih2ca.fsf@goll.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <874kqih2ca.fsf@goll.lan>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Trent W. Buck" <trentbuck@gmail.com>, netfilter@vger.kernel.org



Am 08.07.20 um 09:51 schrieb Trent W. Buck:
> Reindl Harald <h.reindl@thelounge.net> writes:
> 
>> Am 03.07.20 um 09:04 schrieb G.W. Haywood:
>>> On Fri, 3 Jul 2020, Timo Sigurdsson wrote:
>>>
>>>> ... I use ipsets for blacklisting.
>>>>     I fetch blacklists from various sources
>>>> ... This approach has worked for me for quite some time.
>>>> ... some of my blacklists may contain the same addresses or ranges,
>>>>     I use ipsets' -exist switch when loading
>>>> ... I don't think that the use case is that extraordinary ...
>>>
>>> +6
>>>
>>> FWIW I'll be following this thread very closely.
>>
>> it turned out at least with recent kernel and recent userland
>> "iptables-nft" can fully replace "iptables" and continue to use "ipset"
>> unchanged
> 
> I tested this and you're right - it is working.  This surprised me!
> 
> I saw these "commented out" rules in iptables-translate, where
> I (wrongly) assumed that meant the rule was completely inactive.

"iptables-translate" comments out much more than just upset related
stuff, in my case xt_recent and connlimit rules are also just comments

given that the backend is "nftables" just with what you had before on
the frontend side with all the shiny scripts and expiereience
iptables-nft is for me clearly the way to go

but as said i would love "ipset-nft" to make the transition complete and
also keep on that part the scripts which are designed to work outside
the ruleset itself by intention

----------------------

BTW: in my (complex) ruleset when i show the rules with "nft" all that
stuff is still commented out as it would be with the translate stuff

that's pretty sure a userland implementation given that the kernel knows
what to do and is nothing missing according to "iptables-nft -L"
----------------------

one reason i would prefer to sta with iptables-nft forever is the really
nice output format of "iptables.nft -t raw --list --numeric --exact
--verbose" where i generate with grep and bash magic stats like these

it's simple parseable

23M   23M   0  100   100   0   ALL
13M   13M   0  58.3  58.3  0   DENY
12M   12M   0  50.2  50.2  0   DENY SCAN
10M   10M   0  44.5  44.5  0   DENY IPSET
9.6M  9.6M  0  41.7  41.7  0   ACCEPT
5.1M  5.1M  0  22.2  22.2  0   ACCEPT IN
4.5M  4.5M  0  19.4  19.4  0   ACCEPT OUT
1.1M  1.1M  0  4.9   4.9   0   HONEYPOT
857K  857K  0  3.7   3.7   0   INVALID
761K  761K  0  3.3   3.3   0   RL + CL
748K  748K  0  3.3   3.3   0   RATELIMIT
13K   13K   0  0.1   0.1   0   CONNLIMIT
12K   12K   0  0.1   0.1   0   DENY TIME
1.7K  1.7K  0  0     0     0   OUT RESTRICT
889   889   0  0     0     0   OUT DENY
