From: Florian Westphal <fw@strlen.de>
Subject: Re: Metering is not working with dynamic sets on nft v0.9.2
Date: Fri, 7 Feb 2020 11:17:40 +0100
Message-ID: <20200207101740.GC6466@breakpoint.cc>
References: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
 <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> On 06/02/2020 22:42, darius wrote:
> > Hello,
> > I was using meters by using 'meter' keyword, but apparently it is now
> > obsolete.

Not really, it will continue to work.

> If not mistaken the intention is to replace meter with native set / map
> syntax but meter not yet being depreciated/retired.

Yes.

> > root@HOMEROUTER:/etc/config# /etc/init.d/firewall reload
> > /etc/config/ruleset.nft:416:9-187: Error: Could not process rule: Not
> > supported
> >          ct state new add @mymeter { ip saddr timeout 30s limit rate over
> > 50/second burst 50 packets } counter drop
> > 
> > I'm running OpenWRT, kernel v4.14.167, nft v.0.9.2
> > Could anyone help to find out what I'm doing wrong? It seems that I did
> > it according to wiki.

Its a kernel bug.  The kernel picks the wrong set backend on 4.14, so
when it sees the rule (which requires a set that supports updates) it
will fail.

Contine to use mter syntax if that works for you.
