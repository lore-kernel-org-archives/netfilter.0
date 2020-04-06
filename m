From: Laura Garcia <nevola@gmail.com>
Subject: Re: extending element timeout
Date: Mon, 6 Apr 2020 10:13:36 +0200
Message-ID: <CAF90-WiftiMPB1dJX+c4TkmU7a9=JkUJPBsCScpXN1BNXDyyLQ@mail.gmail.com>
References: <CAF90-WiP8pzgXaZB8cE5qkhD6nAtoPrazNLsvkHMBnm4APnpcw@mail.gmail.com>
 <20200405182926.8B32F3651C3@zimbra.mdabbs.org> <CALiBZbwtDbmJbeecWDthpoZ82sS+Oa2t6=7N5D=Lhnthy4q2Nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=voR+iovEf1JDbjblotM180czEo0kPQ1qczMgm3qgs8o=;
        b=SgacwxJ7zwQhgJYGAH97qSX73BnevrxGKapAeTTSYQov2bB9liuC1P9BQQQZXzWtVM
         0eu+pY5lOGP4vYVuYywPGNhbatjAGBf5XF7JViNVQADG3ClYTKaZysbu5IFpL+oy/jDb
         mikl0mPy6GubtinCzouCee9MhPlva43OBeBZ8ikSG4J/h9XtDIVEyT+/20an13QSafEG
         lzilNYgEKyEq5MRm33NSfhTV4LRoL722VdAxT/p/OD7r6a4TmrVfKmI0pWp+5DFj9EZh
         q+mDLuyLsWNJDdq8aa+Fvn9/BGdpE2i7d5pFpjhQ7WBLfiFJgK7VWKcuviFygRa/5KGm
         6OYQ==
In-Reply-To: <CALiBZbwtDbmJbeecWDthpoZ82sS+Oa2t6=7N5D=Lhnthy4q2Nw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alvaro Leiva <alvaroflmiranda@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Sun, Apr 5, 2020 at 10:26 PM Alvaro Leiva <alvaroflmiranda@gmail.com> wrote:
>
> thanks for helping me, would you care to show me a basic example, I
> have been reading the wiki and i got a bit confused, i barely know nft
> since a day ago, thanks again
>

Hi, deleting and adding a new element with timeout and expiration date
is very simple:

% nft delete element inet myfilter myset { 10.0.0.1 }
% nft add element inet myfilter myset { 10.0.0.1 timeout 7s expires 5s }
(according to the wiki example. Please check it out again, I've
completed the page)

Via packet path, please see below an example with connlimit which was
shown in the list time ago. In this case, _dynamic_ flag is set.

table ip my_filter_table {
         set my_connlimit {
                 type ipv4_addr
                 size 65535
                 flags dynamic,timeout
                 timeout 10m
                 elements = { 10.255.255.3 expires 6m16s920ms counter
packets 1848 bytes 173538, 13.55.50.68 expires 7m7s746ms counter
packets 1 bytes 76,
                              216.58.199.34 expires 3m9s590ms counter
packets 2 bytes 120, 216.58.199.78 expires 8m10s1ms counter packets 1
bytes 60 }
         }

         chain my_output_chain {
                 type filter hook output priority filter; policy accept;
// reset the expiration time to the timeout from packet path every
time the same source address hits this rule
                 ct state new add @my_connlimit { ip daddr counter } accept
         }
 }

Cheers.
