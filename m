From: jon_netfilter@use.startmail.com
Subject: Re: Demystifying sets
Date: Fri, 6 Mar 2020 23:37:54 +0100
Message-ID: <1f4571f2-2a77-d47f-12f8-117e26887db3@negentropy.io>
References: <b125461d-57f9-cdc4-0eab-2332fc53b287@negentropy.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
        s=2017-11; t=1583534276;
        bh=OW6IcKFYU0xMCtAR/WF8/hckWkoW2o4WwnSkMRRwGk4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=qnws7CxqSYYl1X3FmNiBTcBybKUctkbXZ/cnaCpe2/3yBsDX84bhcXe0A0O+DOMFt
         0USY2vypKcZZYEuEOE26RT71BqvZPj3hrGdc+seQuBK4q32vv6KaeURhqKRKWNVdGC
         eQy+z+RIZzMH2K5HZ3MKc87/CVa0UgnfHRyt4L67Qec5pwu7VxirX9v0G4DYnwC7ne
         HYy7HaH2bSsSze3ctiw9UiBoXpL5G5ShS6dG2/9iZe+7fgohmefStw7iumNH3E6xsU
         XkvylIWa9MwqeWjhgKUz5eBB1rFoopv6WTiO0iOIm6S1yvGLMLMifZGvWp8NumzBeJ
         PGxL5RKTf9Z6w==
In-Reply-To: <b125461d-57f9-cdc4-0eab-2332fc53b287@negentropy.io>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Thanks for those pointers! That helps a bunch.

One slight add-on question, in case anyone knows: when using a "limit 
rate" stateful object in a set, as described in the "simple firewall" 
example in the documentation, is there a way to lookup/match on the 
current limit rate without modifying it? I tried things like

 > ct state new tcp dport 22 counter { ip saddr limit rate over 10/hour 
} @myset

, but that (obviously?) doesn't work.

An example of my use-case is to use the same set (and stateful object) 
to first check if an ssh-connection has happened at one interval, and 
then at another. This seems to work fine, except that for each 
match-attempt the counter is updated, such that one packet will actually 
cause the limit rate counter to be incremented twice. The below works 
(seems to correctly check for both intervals, even though only one is 
shown in list ruleset), but the limit counter is incremented twice.


Kind regards,

Jon

Example:

table inet filter { # handle 2
         set blacklist { # handle 67
                 type ipv4_addr
                 size 65535
                 flags dynamic,timeout
         }

         set ssh_attempts {
                 type ipv4_addr
                 size 65535
                 flags dynamic, timeout
         }
          chain input { # handle 1
                 type filter hook input priority filter; policy drop;
                 ct state invalid drop
                 ct state established accept # handle 76
                 ip saddr @blacklist jump dropchain

                 # Block anyone trying more than 10 times per hour for 24h
                 ct state new tcp dport 22 counter update @ssh_attempts 
{ ip saddr timeout 1h limit rate over 10/hour } counter update 
@blacklist { ip saddr timeout 24h} drop
                 # Block anyone trying more than 5 times per minute for 2m
                 ct state new tcp dport 22 counter update @ssh_attempts 
{ ip saddr timeout 1h limit rate over 5/minute } counter update 
@blacklist { ip saddr timeout 2m} drop

                 # Accept surviving ssh connections
                 ct state new tcp dport 22 log prefix "NEW_SSHCON_" 
accept # handle 77
         }
}




On 01/03/2020 17.33, jon_netfilter@use.startmail.com wrote:
> Hi everyone!
>
> I have been trying to transition to nftables from iptables, and I have 
> some questions regarding the syntax and usage of sets and their 
> nature, to which I could find no answers in the documentation on the 
> nftables wiki or the man page of my distribution (debian sid). Thanks 
> in advance for those reading!
>
> My versions:
>
> - nftables v0.9.3 (Topsy)
> - kernel 5.4.13
>
> 1) what is the most up-to-date documentation or version of the man page?
>
> For instance, the man page at netfilter.org says it was updated on 
> march 21 2018, and doesn't mention things like the dynamic flag for 
> sets. I see that there's been a commit adding an explanation for the 
> "ct count" expression at [1], but I don't see it included in any man 
> page I could find.
>
> 2) what does the dynamic flag for sets actually do?
>
> In debian sid's nft man page, it says this:
>
> > The set statement is used to dynamically add or update elements in a 
> set from the packet path. The set setname must already exist in the 
> given table and **must have been created with the dynamic flag**.
>
> Note my emphasis. However, I've tried this, and rules which modify set 
> contents from "the packet path" work without having to set the dynamic 
> flag for the set that is used (see [2]). After some more 
> experimentation, it seems that the dynamic flag *is* required for 
> using the limit and conntrack expressions. Which brings me to my next 
> question.
>
> 3) What are the rules for the expressions provided to the set 
> statement? (add, update)
>
> On "my" man page, the statement is defined thus:
>
> > {add | update} @setname { expression [timeout timeout] [comment 
> string] }
>
> I've been experimenting with rate limiting, using the limit and ct 
> count expressions (statements?). In most examples, they are put inside 
> the curly braces, for instance like this [3]:
>
> > ct state new add @my_connlimit { ip daddr ct count over 20 } counter 
> packets 0 bytes 0 drop
>
> or
>
> > add rule my_filter_table my_input_chain tcp dport 22 ct state new 
> add @my_ssh_meter { ip saddr . tcp dport timeout 60s limit rate 
> 10/second } accept
>
> From the man page, I would've assumed that something like "{ ip saddr 
> limit rate over 1/minute timeout 60s}" would be correct, since it only 
> lists "expression [timeout timeout]". How are the expressions "ip 
> saddr timeout 60s" and "limit rate over 1/minute" combined? What are 
> the rules for this? Is the "timeout 60s" bit part of the "expression", 
> or is it separate? Should the documentation say something like
>
> > {add | update} @setname { expression [timeout timeout] [expression] 
> [comment string] }
>
> ?
>
> 4) Finally, what's in a set?
>
> I can specify the type of a set, for instance ipv4_addr. I can then in 
> addition set the flag to dynamic, which allows me to use rules adding 
> a "limit rate" or "ct count" expression to the add/update statements 
> modiying the set. Then, when I list the contents of the set, the set 
> seems to not only contain the ipv4_addr, but also this "thing" which 
> is the "limit rate over 1/minute" part, or "ct count over 2" or 
> whatever. What is this part? Can there only be one? How should I think 
> of this? The "limit rate" expression/statement seems to not remove the 
> entry automatically when the condition no longer matches, but the "ct 
> count" statement/expression on the other hand *does* remove the entry 
> automatically when the condition no longer holds.
>
> If you've read this far, thanks again! I have high hopes for nftables 
> and hope someone has the time and energy to answer some of these 
> questions. I'd be more than willing to update docs or wiki examples, 
> for instance to clarify the relationship between what requires a 
> dynamic flag and its relationship to whether a set is a "dynamic set".
>
> With kind regards,
> Jon
>
> 1 
> https://git.netfilter.org/nftables/commit/?id=fe573574fcb2605bc9011c621f44654707180765
> 2 
> https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path
> 3 https://wiki.nftables.org/wiki-nftables/index.php/Meters
>
