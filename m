From: Florian Westphal <fw@strlen.de>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
Date: Tue, 23 Jun 2020 23:52:39 +0200
Message-ID: <20200623215239.GT26990@breakpoint.cc>
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Florian Westphal <fw@strlen.de>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> On 23/06/2020 21:23, Florian Westphal wrote:
> > ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> > > Since the ruleset that worked with kernel 4.19 did not anymore with kernel
> > > 5.4 (throwing segfault) I started from scratch to see what gives.
> > > 
> > > nft add table inet filter
> > > nft add chain inet filter input { type filter hook input priority 0 \; }
> > > nft add chain inet filter forward { type filter hook forward priority 0 \; }
> > > nft add chain inet filter output    { type filter hook output priority 0 \;
> > > }
> > > nft add table inet nat
> > > 
> > > Thus far good and then things go awry and the output does not help to
> > > understand what might be wrong:
> > > 
> > > nft add chain inet nat prerouting { type nat hook prerouting priority \-100
> > > \; }
> > > nft: unrecognized option: 1
> > If you use the shell, you should use single-quote for the entire
> > arguments.  nft 'add chain ...'
> > 
> > here, nft thinks you passed '-1' as an option.
> 
> Thanks for the pointer, I just copied that from the wiki though...

I've changed quoting style to nft 'add chain ...'.

> > > Error: Could not process rule: No such file or directory
> > inet nat depends on CONFIG_NF_TABLES_INET.
> 
> That is apparently enabled in the kernel
> 
> xzgrep NF_TABLES /proc/config.gz
> CONFIG_NF_TABLES=m
> CONFIG_NF_TABLES_SET=m
> CONFIG_NF_TABLES_INET=y

yup, looks good.
