From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] logging protocols in inet
 family table require explicit protocol statement?
Date: Wed, 5 Feb 2020 17:21:04 +0100
Message-ID: <20200205162104.GK26952@breakpoint.cc>
References: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
 <20200205142935.GG26952@breakpoint.cc>
 <03b849bc-48f3-0e47-2d94-47b2a74f988a@gmx.net>
 <20200205144833.GH26952@breakpoint.cc>
 <6a254067-bad5-4a72-25f3-a14ded823097@gmx.net>
 <20200205153734.GI26952@breakpoint.cc>
 <9fbdca2d-2ebd-a558-7d09-7ceb102ac19d@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9fbdca2d-2ebd-a558-7d09-7ceb102ac19d@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> Not directly related to the subject but curious about concentrating log
> flags, level and prefix, is this valid syntax (within context of course):
> 
> log flags all level debug prefix
> 
> or does it require
> 
> log flags all log level debug log prefix

The last form specifies multiple log statements,
which is probably not what you want:

log flags all
log level debug
log prefix

Which would log 3 times.
So, first version is what you want/need.

