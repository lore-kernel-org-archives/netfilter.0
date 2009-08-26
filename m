From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: What category of Firewall does Netfilter fall under?
Date: Wed, 26 Aug 2009 09:53:22 +0100
Message-ID: <56378e320908260153s34603098s34debbf22f0c9b43@mail.gmail.com>
References: <f66b95be0908260147k3676be79h10842cc9a49754ef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=tCoRRqUbQqvm6zmtl127+s9YieDODlh4GuU59HgycXI=;
        b=GPW+vT8QdwbNJx9OFbr+K2bDDqAIbQCizdvsqbjK+qj1T5v7bCfo6IaCeIBaYcnPWq
         jLeqscv0nJRMbos5piySGr/e3qxxowA0n+4BgmGiMfetCcheCt965Bx/ZfROaxjUFb1S
         h7ITDnC9AocO9Ablq3hk0yQgPA1wb5uyiZVag=
In-Reply-To: <f66b95be0908260147k3676be79h10842cc9a49754ef@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tom murphy <tommurphy105@gmail.com>
Cc: netfilter@vger.kernel.org

2009/8/26 tom murphy <tommurphy105@gmail.com>:
> Dear experts,
>
> How would one classify netfilter?
>
> Its seems there are at least 3 categories of firewall:
> 1) packet filter (stateless filtering)
> 2) stateful filter
> 3) appliaction-level filter (aka. proxy filter)

And as outlined by yourself and below by me... ipt is atleast 2 of the 3.

[snip]
> Any opinions or comments on helping me pigion hole Netfilter/iptables.
> Perhaps stateful filter implies packet filter also.

Just my personal opinion but for a firewall to be a stateful firewall
it must by definition carry out packet filtering.

iptables in its base form is a packet filtering firewall. Add the
conntrack support and it becomes a stateful firewall. Add the advanced
matching abilitiy and the L7 capability and it becomes an application
firewall.

I'd be inclined though to classify ipt as a stateful firewall though
for most uses as the application firewall ability is provided by
additional components and may, depending on definition, not fully
qualify as an application firewall.





-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
