From: Florian Westphal <fw@strlen.de>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Wed, 8 Jun 2022 13:21:35 +0200
Message-ID: <20220608112135.GC11923@breakpoint.cc>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
 <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
 <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Hall <netfilter@gmch.uk>
Cc: netfilter@vger.kernel.org, Reindl Harald <h.reindl@thelounge.net>

Chris Hall <netfilter@gmch.uk> wrote:
> For input such as "-s 10.0.0.2/24", the 10.0.0.2 simply isn't a valid
> network address for a /24 network.
> 
> I agree: the parser should detect invalid input and reject it.  I can see no
> good reason for being sloppy here.

It breaks current behaviour; we cannot change this 20 years later.
Its as simple as that.
