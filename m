From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: [ANNOUNCE] Release of iptables-1.4.3.2
Date: Fri, 10 Apr 2009 09:21:14 +0200
Message-ID: <49DEF36A.8010509@chello.at>
References: <49D9E9A6.7010303@netfilter.org> <49DA0F49.4090802@conversis.de> <49DAD5E0.9020303@caf.com.tr> <49DDB24A.80400@chello.at> <49DDF84E.2010302@caf.com.tr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DDF84E.2010302@caf.com.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Eray Aslan wrote:
> On 09.04.2009 11:31, Mart Frauenlob wrote:
>   
>> what about the 'policy' in the 'nat' table? Will it allow 'DROP'?
>>     
>
> # /sbin/iptables -V
> iptables v1.4.3.1
> # /sbin/iptables -t nat -P OUTPUT DROP
> iptables v1.4.3.1:
> The "nat" table is not intended for filtering, the use of DROP is
> therefore inhibited.
>
>
> Try `iptables -h' or 'iptables --help' for more information.
> # echo $?
> 2
> # /sbin/iptables -t nat -L|grep OUTPUT
> Chain OUTPUT (policy ACCEPT)
>
>   
>> what about the other non 'filter' tables?
>> Will it be possible to 'DROP' in the mangle table? Or set it's policy to
>> 'DROP'?
>>     
>
> Yes
>
>   
>> Isn't dropping in the mangle table almost the same thing as doing that
>> in the nat table?
>>     
>
> No.  Not all packets in a connection traverse the nat table.
>   
Yes I know...

>> At least it violates the concept of filtering in the filter table.
>>     
>
> Yes.  Correct place to filter in in the filter table.  But if you insist
> on doing the "wrong" thing, who is to interfere?
>
>   
The programmer...
It's not me insisting in doing the wrong thing. I know these things.
I write this, because of all the people who do not.
And this lack of knowledge must be the reason why filtering in the nat 
table was prohibited.
Because people were doing the wrong thing, because they do not know 
better...

So now we have:

- filter table - DROP allowed and right - DROP policy = good
- mangle table - DROP allowed but wrong - DROP policy = bad
- nat table - DROP prohibited and wrong - DROP policy = prohibited
- raw table - DROP allowed and right for avoiding conntrack - DROP 
policy = bad?

That is a little chaotic...

More continuous would be IMHO:

- filter table - DROP allowed and right - DROP policy = good
- mangle table - DROP  prohibited - DROP policy = prohibited
- nat table - DROP prohibited - DROP policy = prohibited
- raw table - DROP allowed and right for avoiding conntrack - DROP 
policy = prohibited

> [...]
>   
>> I've seen quite some people (mostly unexperienced) mess up their box
>> with that, most of them ending up asking for public help.
>> It seems misleading to me, to make that options available.
>>     
>
> Well, software does not grow on trees.  Someone has to write it but is
> it really worth the effort to ban filtering in mangle et al?  Filtering
> in the nat table was especially wrong because it didnot give the
> expected result and I suppose that is reason for the patch/revized
> behaviour.
>   
Again, why allow, what is considered wrong?
If you know what you are doing, filtering in the nat table will do what 
you want, because you know about the special behaviour.
Only the lack of knowledge makes things go wrong.
And that is the point. If you know iptables, you do your filtering in 
the filter table, or in the raw table (to avoid conntrack for some 
blacklist kind of stuff).
If you don't, it happens... You may start setting mangle, raw policies 
to DROP, filter in mangle table, do weird stuff, an experienced user 
would (most likely) never do.

Is it really worth the hassle for approx. hundreds of people every year 
falling into those pitfalls?
Many end up here or on similar places, needs effort for anyone involved.
Iptables is installed on like any linux box out there, and there's  
always a lot of people trying to write their own ruleset.
Many of them are unexperienced. Therefor the concept should be clear, 
continuous and error messages should be understandable.
Preventing the user from doing nonsense. It's about the security, not 
some trivial thing...

Well, just thoughts about my favorite software... :)

btw: if I could (write C), I'd become a software tree... :-;


Good day

Mart

