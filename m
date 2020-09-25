From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables] log flood protection?
Date: Fri, 25 Sep 2020 11:31:19 +0200
Message-ID: <20200925093119.GB31471@breakpoint.cc>
References: <a3a88c99-9164-f56a-6368-d59230c647e6@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a3a88c99-9164-f56a-6368-d59230c647e6@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> Trying to limit log entries as a preventive measure for log flooding with
> 
> log flags all prefix "foo DROP: " limit rate 1/second

This applies the limit after the log has taken place.

limit rate 1/second log flags ...
