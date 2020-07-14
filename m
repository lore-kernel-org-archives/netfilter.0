From: "Timo Sigurdsson" <public_timo.s@silentcreek.de>
Subject: Re: Moving from ipset to nftables: Sets not ready for prime time yet?
Date: Tue, 14 Jul 2020 15:27:08 +0200 (CEST)
Message-ID: <20200714132708.B092B6C81CD5@dd34104.kasserver.com>
References: <20200702231812.E43146C80D34@dd34104.kasserver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silentcreek.de;
        s=kas202007021019; t=1594733228;
        bh=1rxS7huMnc1XnpS9Ol8uZLgdE9Bz61W0s4fKXOt0oI4=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=Pwi6/PiIcHrIvYnR9a9+8EFbNhdyrL9B+Vm72OoHmjrzTZ+NCxUvh3lYwobBc+08S
         PFEQB9mcknE4GAnZ2SsSQJ6iLfQKe88sgClnErrOyyb4l8Z+UommC8BbIdzupLpI7K
         aAczh4OzcALGyq1ZKASN4UXaRYfTUyw5sB44pd5tY0WkZpihmwQdNG5G5dc2dbjMkm
         BGAeraXpb2+HX7JW5itoEOvzvtVLpdIn14ofEcO9GMVdduJN3LYqc+UWDe7i4q0DZ8
         Lyqpv04oFyJy4UMuydsgx+a6so086atE1Y+2MVPU82l7XH/EuThxb4qZBS2n/TVPK5
         7MyDYxF8NXoPg==
In-Reply-To: <20200702231812.E43146C80D34@dd34104.kasserver.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi again,

just a quick follow-up: I came across yet another issue trying to replace or reload native sets atomically. It leads me to conclude that the atomic handling of sets is pretty much broken or unusable at this point.

While I was previously under the impression that atomic reloads of sets were only problematic when either using the auto-merge flag or very large sets as describe in my first email, I have now figured out that a much more basic case also does not work and that is attempting to change sets with intervals (without auto-merge).

Quick example - create a test set:
  `nft add set inet filter testset { type ipv4_addr; flags interval; }'

Now create a script file a.nft with the following content to pupulate the set:
  flush set inet filter testset
  add element inet filter testset { 192.168.0.0/16 }

Load the file with `nft -f a.nft' and it will work just fine, even repeatedly.

But now try this example b.nft:
  flush set inet filter testset
  add element inet filter testset { 192.168.0.0/24 }

Trying to run `nft -f b.nft' will result in the error:
  Interval overlaps with an existing one

The reason why I haven't encountered this issue earlier is that in most of my experiments I was trying to either reload the same set, which works fine, or reload a set with changes in terms of added or deleted elements, which also works fine. It only breaks when you try to change the extent of an existing interval despite the flush statement in the beginning of the script file. I found that the issue was already reported by someone else and I have now updated it with additional information:
https://bugzilla.netfilter.org/show_bug.cgi?id=1431

In any case, that pretty much defeats all of my attempts to work around the issues I laid out earlier. The only way around it is to reload the entire ruleset with all the downside that comes with.

I am now thinking about scripting my way around the atomic handling of sets with nft entirely, like creating a new set, populating it, inserting a new rule to match the new set, then flush the old set and populate it with the new contents and then delete the new set and inserted rule again. This would kind of mimic the behavior of `ipset swap' just more complicated and with some overhead...

Regards,

Timo



Timo Sigurdsson schrieb am 03.07.2020 01:18 (GMT +02:00):

> P.S. Sorry, I sent this message to netfilter-devel first as I was already
> subscribed to that list and only realized later that the netfilter list would
> be a better place to post this to. Hence, one more time to this list...
> 
> 
> Hi,
> 
> I'm currently migrating my various iptables/ipset setups to nftables. The
> nftables syntax is a pleasure and for the most part the transition of my
> rulesets has been smooth. Moving my ipsets to nftables sets, however, has
> proven to be a major pain point - to a degree where I started wondering whether
> nftables sets are actually ready to replace existing ipset workflows yet.
> 
> Before I go into the various issues I encountered with nftables sets, let me
> briefly explain what my ipset workflow looked like. On gateways that forward
> traffic, I use ipsets for blacklisting. I fetch blacklists from various sources
> regularly, convert them to files that can be loaded with `ipset restore', load
> them into a new ipset and then replace the old ipset with the new one with
> `ipset swap`. Since some of my blacklists may contain the same addresses or
> ranges, I use ipsets' -exist switch when loading multiple blacklists into one
> ipset. This approach has worked for me for quite some time.
> 
> Now, let's get to the issues I encountered:
> 
> 1) Auto-merge issues
> Initially, I intended to use the auto-merge feature as a means of dealing with
> duplicate addresses in the various source lists I use. The first issue I
> encountered was that it's currently not possible to add an element to a set if
> it already exists in the set or is part or an interval in the set, despite the
> auto-merge flag set. This has been reported already by someone else [1] and the
> only workaround seems to be to add all addresses at once (within one 'add
> element' statement).
> 
> Another issue I stumbled upon was that auto-merge may actually generate
> wrong/incomplete intervals if you have multiple 'add element' statements within
> an nftables script file. I consider this a serious issue if you can't be sure
> whether the addresses or intervals you add to a set actually end up in the set.
> I reported this here [2]. The workaround for it is - again - to add all
> addresses in a single statement.
> 
> The third auto-merge issue I encountered is another one that has been reported
> already by someone else [3]. It is that the auto-merge flag actually makes it
> impossible to update the set atomically. Oh, well, let's abandon auto-merge
> altogether for now...
>  
> 2) Atomic reload of large sets unbearably slow
> Moving on without the auto-merge feature, I started testing sets with actual
> lists I use. The initial setup (meaning populating the sets for the first time)
> went fine. But when I tried to update them atomically, i.e. use a script file
> that would have a 'flush set' statement in the beginning and then an 'add
> element' statement with all the addresses I wanted to add to it, the system
> seemed to lock up. As it turns out, updating existing large sets is excessively
> slow - to a point where it becomes unusable if you work with multiple large
> sets. I reported the details including an example and performance indicators
> here [4]. The only workaround for this (that keeps atomicity) I found so far is
> to reload the complete firewall configuration including the set definitions.
> But that has other unwanted side-effects such as resetting all counters and so
> on.
> 
> 3) Referencing sets within a set not possible
> As a workaround for the auto-merge issues described above (and also for another
> use case), I was looking into the possibility to reference sets within a set so
> I could create a set for each source list I use and reference them in a single
> set so I could match them all at once without duplicating rules for multiple
> sets. To be clear, I'm not really sure whether this is supposed to work all. I
> found some commits which suggested to me it might be possible [5][6].
> Nevertheless, I couldn't get this to work.
> 
> Summing up:
> Well, that's quite a number of issues to run into as an nftables newbie. I
> wouldn't have expected this at all. And frankly, I actually converted my rules
> first and thought adjusting my scripts around ipset to achieve the same with
> nftables sets would be straightforward and simple... Maybe my approach or
> understanding of nftables is wrong. But I don't think that the use case is that
> extraordinary that it should be that difficult.
> 
> In any case, if anyone has any tips or workarounds to speed up the atomic
> reload of large sets, I'd be happy to hear (or read) them. Same goes for
> referencing sets within sets. If this should be possible to do, I'd appreaciate
> any hints to the correct syntax to do so.
> Are there better approaches to deal with large sets regularly updated from
> various sources?
> 
> 
> Cheers,
> 
> Timo
> 
> 
> [1] https://www.spinics.net/lists/netfilter/msg58937.html
> [2] https://bugzilla.netfilter.org/show_bug.cgi?id=1438
> [3] https://bugzilla.netfilter.org/show_bug.cgi?id=1404
> [4] https://bugzilla.netfilter.org/show_bug.cgi?id=1439
> [5]
> http://git.netfilter.org/nftables/commit/?h=v0.9.0&id=a6b75b837f5e851c80f8f2dc508b11f1693af1b3
> [6]
> http://git.netfilter.org/nftables/commit/?h=v0.9.0&id=bada2f9c182dddf72a6d3b7b00c9eace7eb596c3
> 
> 
