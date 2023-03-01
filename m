From: Binarus <lists@binarus.de>
Subject: Could somebody please explain priorities correctly and in an
 understandable way?
Date: Wed, 1 Mar 2023 12:16:37 +0100
Message-ID: <50521c01-3751-3882-1dd8-cd86be205d7b@binarus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=binarus.de; s=b201601;
        t=1677669398; bh=6cINm+mxbJA9BSWunYTjA8QFXLdz5WrjCddE3eKd6go=;
        h=Date:From:Subject:To:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
         Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
         List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
         List-Archive;
        b=dzy3Qh7WRWce6sr7RwDIFBdo/cnFYgL+7T0nfa40e5NpSLrJCkKsKG1TnL17h35vR
         kJxcwn863tNUqKIS20PJcNR81tLPPc/ZZX2K4O6zWlVxtbSQmE/8zQsj7Xtl6tfKHb
         QFreWmeIgmCy/In8Gc3mIISzw4+bLCHPZ3lfdAh4X6V5lBf+HnzIQU8Tj6WByGSoWP
         Q5yDWcwVsu6p5+l+580xPB8keFlEUE0ZwVH3bZmci3kqEbXdvsH6fpvXORrTbclI+T
         S4HsddffhBk0gEu/Ch+Uqgq/Y023qCXTUQhKY/mRMbmX7Ry3IGELOPSFyk5Jn4aHi4
         HfaZbrqO45RIerGeOCJxjbNubnd4tvKxVCCWCx4B/jBfkOV8kdiBlF9YKZdfQnaM5m
         elj5TXJhzTtmfumOj1RpdCpoNZDygE0qb9NsyTj3O 
Content-Language: en-US, de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear all,

I am currently migrating our iptables-based firewall scripts to nft / netfilter, and I am having an extremely hard time with trying to understand priorities. Let's start with a citation from the manual (https://www.netfilter.org/projects/nftables/manpage.html):

"The priority parameter accepts a signed integer value or a standard priority name which specifies the order in which chains with same hook value are traversed. The ordering is ascending, i.e. lower priority values have precedence over higher ones."

Well, that should be clear so far. At least I thought.

My problems began when I had the following configuration file (nonsense of course, just for testing)

table ip t_IP {
   chain nat-prerouting {
     type nat hook prerouting priority -500; policy drop;
     log prefix "foo: " drop;
   }
}

and tried to load it:

nft flush ruleset
nft -f nftables.conf

Output:

nftables.conf ... Error: Could not process rule: Operation not supported
nftables.conf ... Error: Could not process rule: No such file or directory

Because of respective hints in the netfilter wiki, I spent the next few hours with checking whether my kernel had all modules and with re-reading the documentation to verify that nat chains provide a prerouting hook. (Of course they do, and everything was OK with my kernel).

Several hours later I noticed by accident that no more errors occurred with a slight change in the test configuration:

table ip t_IP {
   chain nat-prerouting {
     type nat hook prerouting priority -200; policy drop;
     log prefix "foo: " drop;
   }
}

So the reason for the errors was the wrong priority; that took me half a day to find out due to the misleading description of possible sources of that error in the wiki.

Now this error is quite beyond my horizon. According to the docs (see citation above), the priority only effects something at all when there is the same hook in multiple chains. This is clearly not the case here, because there is only one table with one chain. Second, I am understanding that citation in the sense that the priority only changes hook evaluation order; that is, I can freely choose that order. But this is obviously not the case; instead, there seems to be one or several undocumented rules which must be followed when choosing priorities.

Could somebody please explain priorities correctly and in an understandable way, or direct me to a reasonable documentation? The netfilter wiki and manual are misleading or wrong in this respect, unless I'm just not able to get it (which might very well be the case). I am particularly interested into the (undocumented) rules mentioned above (if they really exist).

Thank you very much in advance, and best regards,

Binarus
