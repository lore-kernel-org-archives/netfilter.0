From: Ugis <ugis22@gmail.com>
Subject: ipset v6.11: Kernel error received: maximal number of sets reached,
 cannot create more.
Date: Thu, 13 Sep 2012 20:20:45 +0300
Message-ID: <CAE63xUNRi97dFJN77Mo+RSRmh_XjBsMoBkHE7vrnVr8VGAE=_g@mail.gmail.com>
References: <CAE63xUNELpSFDOJEd1Bs8XV8TE+bqJmp4dReMe74Gv-SVzYM6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=QPeKZA9yQ0rLaZfqR0Vt8AZSYgiVqKLTv9GoKT5AWAc=;
        b=tlNV6526Eh/yta/cVno0XF58yqXnZJtGzA+mKhOnI0VZvORBdirHhOO8gpzErcFctF
         oTHrHpHRU8Oy1bH/ZRONRmvo4QeMe0JcOE9xRWIUVN7NVovMY+QB7lrBqWNLyPLjKOOm
         48ZhkKPUmkGcnmHMa5IO+nWjTnBglqSNsb+hmhl+qiGPhrfDyJl244128e1xyUHlo6N1
         bbbCK7a4qez8AKJsl5GB0KCe8oHKB1X5o9mVpwE90EovU1InkbR0ViiAK/r75qHpcE8F
         ya2PbKxAYM6rcSChwGJYb8Djn+Z/7s3ce/yUfEP21tiSfZL8oOMRcPZXFEhs13thxyRj
         wS+A==
In-Reply-To: <CAE63xUNELpSFDOJEd1Bs8XV8TE+bqJmp4dReMe74Gv-SVzYM6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello!

There was a plan to write ipset+iptables config with many
ipsets(combination of hash:net + bitmap:port).
To test how many sets can I add - I have written little script to
create and populate ipset rules in a loop.

When executing script I hit the error:"ipset v6.11: Kernel error
received:maximal number of sets reached, cannot create more."

I was really surprised that this error hit already on 254 set limit
with type hash:net sets(last lines of "ipset save" follows)
create NET-254 hash:net family inet hashsize 1024 maxelem 65536
add NET-254 10.1.1.0/24

If I added type bitmap:port set creation in loop - I got exactly half
count of every type(last lines of "ipset save" follows):
create NETs-127 hash:net family inet hashsize 1024 maxelem 65536
add NETs-127 10.1.1.0/24
create PORTs-127 bitmap:port range 1-35635
add PORTs-127 80


Questions:
1)what parameters can I tune to get more ipsets(couple thousands I
guess)? sysctl? RAM size?. Recompiling kernel is not an option this
time.

2)statistically there would be sets of type hash:net(1-3 members each)
+ bitmap:port sets(1-5 members each) and lots of iptables rules with
combinations of those as src,dst + protocol match. Probably count of
iptables rules can grow over 1-2 thousand. What would be less harm to
packet latency(assuming match on last iptables
rule) - less iptables rules+ipsets(let's say 1K iptables rules + 2K
ipsets(if possible) ) OR no ipsets at all and lots of iptables
rules(let's say 5K iptables rules)?

3)Anybody seen any benchmarks iptables rule count vs packet latency -
what is the reasonable limit for iptables, ipset rule count after all?
Any CPU core must scan all ipset rules anyway(I guess), so more cores
would just multiply packets being processed paralelly, but not speed
up single packet latency, right?

Linux: 3.2.0-29-generic x86_64
Mem:   1994316k total
OS=Ubuntu 12.04.1 LTS

Thanks for clarification in advance!

Ugis
