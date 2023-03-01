From: Binarus <lists@binarus.de>
Subject: Could somebody please explain priorities correctly and in an
 understandable way?
Date: Wed, 1 Mar 2023 11:55:13 +0100
Message-ID: <53517f61-03d3-d196-0b5b-8ef5a76833d7@binarus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=binarus.de; s=b201601;
        t=1677668114; bh=6cINm+mxbJA9BSWunYTjA8QFXLdz5WrjCddE3eKd6go=;
        h=Date:To:From:Subject:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
         Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
         List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
         List-Archive;
        b=IjL1pDXCw1IKjyDa7Lb8AAUncDyviGKA33FdsIfvqdBitjPgkGYb7zuabmsBQG9PD
         FI5qAf3mi/1Dnu+6cNWhX7zz5j3wqDt2t0Ks+fmmDDd8sopvNqdzw6xyDUHxCB+lBH
         8IaL0PmsLkJcNxEr0DHRe3c+2+thNE/JsG6j55Ul+86tOatIJcEhBV+Q8MuhAuJtXu
         Xz8sJurYja4Rsr1DiNFzlJJVmwqQ6J8IRP3Q6qGgd/gYTZBVzm+s7yLZYBSqIvpNhp
         AlzHmztY7J1bgkUB62/fMtfgMqvP2xDogHashj/nM2Rl/sxeOg+iO/cH4t5pguzgBc
         GHBMi4dLMQrpipMTSTpYRKyYWlhWVGoTbWUnKV38T8Utk5jWRJZzYM+WgQMbagWmiE
         UuJV8Anh1tC8gfGyOVnIRCJiL1ILvgjyT33wgCo3z 
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
