From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Subject: Requirements for nft nat pre/postrouting chains?
Date: Wed, 27 Jul 2022 17:03:32 +0900
Message-ID: <YuDxVBz7FVqk+FHz@atmark-techno.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I was reported that on our custom kernel some script didn't work with
iptables-nft (default in debian for a while), and after investigating it
looks like the nat rules for postrouting and prerouting are just not
considered.

I've boiled down the reproducer to this:

---
nft add table ip test
nft chain ip test test '{ type nat hook prerouting priority -100; policy accept; }'
nft add rule ip test test log prefix "test-pre-" counter packets 0 bytes 0

# at this point do some network activity;
# since there is no match specified new connections should trigger
# the log and increment counters for the rule
nft list table test

# (and cleanup)
nft delete table test
---


But while this works on my laptop, I can't get this to work in a minimal
kernel, the rule stays stuck at zero:
---
table ip test {
        chain test {
                type nat hook prerouting priority dstnat; policy accept;
                log prefix "test-pre-" counter packets 0 bytes 0
        }
}
---


I've made everything a module and aligned loaded modules from standard
debian to that VM to no avail, also tried naming the table 'nat' and
chain 'PREROUTING' in case names are special (which would surprise me
but you never know) with no difference either...

(I've also seen on the internet that for older kernels iptable_nat is
incompatible with nft nat chains and tried taking it out, but that
shouldn't be relevant anymore)


I'm starting to think it's just some silly setting somewhere and the way
I'm testing it is wrong, but I'm out of ideas.


Am I missing something obvious?


Thanks!
-- 
Dominique Martinet
