From: Pandu Poluan <pandu@poluan.info>
Subject: Re: ipset -R
Date: Fri, 25 Feb 2011 21:19:31 +0700
Message-ID: <AANLkTi=_igg_4QXup3uU1A-UhhTNPXG_GOBvSqGMLzgW@mail.gmail.com>
References: <4D645BC7.7030306@googlemail.com>
	<alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu>
	<4D659102.8090501@googlemail.com>
	<AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com>
	<4D664C9F.3020701@googlemail.com>
	<alpine.DEB.2.00.1102250915200.20179@blackhole.kfki.hu>
	<4D67AE2C.3010902@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D67AE2C.3010902@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Feb 25, 2011 at 20:27, Mr Dash Four <mr.dash.four@googlemail.com> wrote:
>
>> However with hash:net type
>>
>> # ipset -N test hash:net
>> # ipset -A test 10.1.1.0/24
>> # ipset -D test 10.1.1.12
>> ipset v6.0: Element cannot be deleted from the set: it's not added
>>
>
> Well, that's plain wrong, isn't it? The 'element' 10.1.1.12 does exist and it is added (albeit implicitly as part of 10.1.1.0/24). I also presume 'ipset -T test 10.1.1.12' will return a positive result, so there is something which isn't quite right.
>
>> and that's also right, because the hash types do not magically figure out overlapping ranges and collapse those or break up ranges into parts when deleting intersecting elements.
>>
>
> I do not know the reasons for removing this as it was a nice 'feature' though I now understand the 'deletion' part even if I do not agree with it.
>
>> The hash:*net* types could be extended to store non-matching elements, something like this:
>>
>> # ipset -N test hash:net
>> # ipset -A test 10.1.1.0/24
>> # ipset -A test 10.1.1.12 --nomatch
>>
>> That way overlapping entries with different "access right" could be stored in a single set. But any coding needs time and testing.
>>
>
> I am not sure I understand the above - is this already implemented (in 6.0?) or is this on the 'drawing board' so to speak? What do you mean by 'access right'?
>
> On a separate query relating to my initial post of this thread - Pandu Poluan proposed a nice 'get-out-of-jail' solution to my problem, which I already found a way to optimise a little, but need to make sure I am doing the right thing: if I have my whitelist, blacklist-1, blacklist-2 ... blacklist-x sets registered and they have (quite a lot of) members can I then do this:
>
> ipset -N list blacklist-all
> ipset -A blacklist-all blacklist-1
> ...
> ipset -A blacklist-all blacklist-x
>
> and then add my iptables statement:
>
> (1) -m set ! --match-set whitelist src -m set --match-set blacklist-all src -j DROP
>
> Would that be the equivalent of (2):
>
> -m set ! --match-set whitelist src -m set --match-set blacklist-1 src -j DROP
> ...
> -m set ! --match-set whitelist src -m set --match-set blacklist-x src -j DROP
>
> In other words, I combine all of my blacklisted sets into one of type 'list' where I assume 1) that all sub-set elements of the 'list' set are queried for a match; and 2) executing one iptables statement with a set match/mismatch (i.e. 1 above) is better, performance-wise, than (potentially) traversing through multiple iptables statements with a set match/mismatch (as shown on 2 above)?
>
> If so, how is the blacklist-all set stored - do you copy all the elements of all the sets into a separate memory space or do you just reference the set (which means that if I alter, say, blacklist-2, the changes are 'automatically' applied to blacklist-all as well)?
>
> I can't combine all elements of my blacklist-x sets into one big one because 1) I use separate blacklist-x sets elsewhere in my ip chains; and 2) my blacklist-x sets are not of the same type.
>

I haven't perused netfilter code yet, so what I'll say is highly conjectural.

IMO, the single (1) rule will be a lot faster:
* Only 1 (one) check for whitelist
* x checks for blacklist-checks

Total checks (worst-case): 1+x (and if the negated result of whitelist
check == false, no need for x blacklist-checks)

Best case: 1 check ( IP in whitelist, so ! whitelist == false,
iptables' rule is short-circuited )

Rule (2):
* A total of x times ( whitelist check + blacklist-check )

Total checks (worst-case): x * 2

Best case: x * 1 ( only check against whitelist, but repeated for x rules )

IMO, iptables lookups are much more expensive than ipset lookups. (
IOW, n * iptables checks is much more expensive than 1 * iptables
check against a setlist with n members ). So, the speedup of (1)
against (2) will be even more significant.

CMIIW

Rgds,

--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
Google Talk:    pepoluan
Y! messenger: pepoluan
MSN / Live:      pepoluan@hotmail.com (do not send email here)
Skype:            pepoluan
