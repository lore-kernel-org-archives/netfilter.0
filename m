From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Correction to nftables wiki
Date: Thu, 31 Dec 2020 09:50:51 +0000 (GMT)
Message-ID: <alpine.DEB.2.21.2012310910060.20603@piplus.local.jubileegroup.co.uk>
References: <76cb4d39d82626ab3d03df4c112ebaf6bdec17de.camel@datahenge.com>         <5be52cd79aed99af1b11cbf1400534aa60c849d8.camel@datahenge.com>         <58b7d4f9-f7a7-dc06-01d9-d1bad5e3b8af@plushkava.net>
 <6427cda436b129e110022c59830bb73a5c461543.camel@datahenge.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=date:from:to:cc:subject:in-reply-to
        :message-id:references:mime-version:content-type; s=uk; bh=gIsXD
        ChxGfPP+R8hBmz7Z4dNLh0ghFenjoVJ5Wj/PkM=; b=bWr2JJV1lzHaUXKiEl+/X
        0ZlnXwHnsILXmbRaTEn8IKZow2PYOjgk/ZILw+oGt1zQ8DI7ZqCqIMZUwR6wIvLw
        fqbMKCDyK5yYFwZ7jBjY73xfRXRVqpogBP8Sdgryd/X6f/8CUCMAe5Nqxi37eSmq
        g85xtduX/OQ1bVVx4z1m7w+Yi9AbDwRlWieYCpsCsRQd5xwCCfFbno9F6ikyH8C5
        KBOH3GRsVTkZgbPyX4bMnsb+Bn4g2AoG+jethtz3mPOTObJq4yYQHmLSXjWDQuGX
        CizmGE8UZ59tKCPZblSVu3zJVcwZuYIgolTOl/1rHwHjCMHJ2vZjKsyLt1HClLZU
        w==
In-Reply-To: <6427cda436b129e110022c59830bb73a5c461543.camel@datahenge.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Brian Pond <brian@datahenge.com>
Cc: netfilter@vger.kernel.org

Hi there,

On Wed, 30 Dec 2020, Brian Pond wrote:

> ... I've been working a lot on firewall tooling this past year.
> It's been much easier (and better) using nftables versus the legacy
> iptables system.

Do you think that you could jot down the main reasons that you've
found for the improvements?  Mail to the list would be fine for me.

I ask because I've found the change in syntax quite bewildering, and,
whenever I want to do more or less anything, most of the time I don't
even know where to start using nft commands so I find myself reverting
to iptables - because I can do that without really thinking about it,
and get the job done.  I don't know that I'd ever want to do anything
that I could do with nft that I couldn't do with iptables.  I don't
even know if there are such things, nor what those things might be.  I
have no clue if the things I do could be more efficient with nft.

If it will make any difference to your observations for my purposes,
typically I use just iptables and ipsets; a couple of dozen iptables
rules, for example

# iptables -L BLOCKSET --line-numbers
Chain BLOCKSET (1 references)
n  targ prot opt source   dest 
1  DROP tcp  --  anywhere anywhere match-set BLOCKSET08 src
2  DROP tcp  --  anywhere anywhere match-set BLOCKSET09 src
3  DROP tcp  --  anywhere anywhere match-set BLOCKSET10 src
4  DROP tcp  --  anywhere anywhere match-set BLOCKSET11 src
5  DROP tcp  --  anywhere anywhere match-set BLOCKSET12 src
6  DROP tcp  --  anywhere anywhere match-set BLOCKSET13 src
7  DROP tcp  --  anywhere anywhere match-set BLOCKSET14 src
8  DROP tcp  --  anywhere anywhere match-set BLOCKSET15 src
9  DROP tcp  --  anywhere anywhere match-set BLOCKSET16 src
10 DROP tcp  --  anywhere anywhere match-set BLOCKSET17 src
11 DROP tcp  --  anywhere anywhere match-set BLOCKSET18 src
12 DROP tcp  --  anywhere anywhere match-set BLOCKSET19 src
13 DROP tcp  --  anywhere anywhere match-set BLOCKSET20 src
14 DROP tcp  --  anywhere anywhere match-set BLOCKSET21 src
15 DROP tcp  --  anywhere anywhere match-set BLOCKSET22 src
16 DROP tcp  --  anywhere anywhere match-set BLOCKSET23 src
17 DROP tcp  --  anywhere anywhere match-set BLOCKSET24 src
18 DROP tcp  --  anywhere anywhere match-set BLOCKSET25 src
19 DROP tcp  --  anywhere anywhere match-set BLOCKSET26 src
20 DROP tcp  --  anywhere anywhere match-set BLOCKSET27 src
21 DROP tcp  --  anywhere anywhere match-set BLOCKSET28 src
22 DROP tcp  --  anywhere anywhere match-set BLOCKSET29 src
23 DROP tcp  --  anywhere anywhere match-set BLOCKSET30 src
24 DROP tcp  --  anywhere anywhere match-set BLOCKSET31 src
25 DROP tcp  --  anywhere anywhere match-set BLOCKSET32 src

and a few tens of thousands of ipset matches to DROP packets from the
more troublesome netblocks.  The ipsets are created by a boot script,
then (most of the time) populated automatically by a Sendmail milter
as mail is processed; for example when some joker tries to send HTTP
requests to the mail server his IP will be DROPped for a few days.

There are timeouts on most of the ipset entries.  The main issue I've
found is that there's an approximately 25 day limit on the timeout, so
if I want something longer I have to jump through some hoops, but it's
no big deal.

> Happy New Year!

The same to you, and all.

-- 

73,
Ged.
