From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Thu, 9 Jun 2022 20:38:06 +0200
Message-ID: <3530fa1d-0ce3-37a8-884d-921907b780e2@thelounge.net>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
 <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
 <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
 <20220608112135.GC11923@breakpoint.cc>
 <85215dc8-2d1b-7b64-02a9-f0ed1f397bc1@gmch.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <85215dc8-2d1b-7b64-02a9-f0ed1f397bc1@gmch.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Hall <netfilter@gmch.uk>, netfilter@vger.kernel.org
Cc: Florian Westphal <fw@strlen.de>



Am 09.06.22 um 19:52 schrieb Chris Hall:
> I am hoping that it is agreed that it is a mistake for the parser to 
> silently accept unspecified input

it is *not* unspecified input

with /24 you *clearly* say "only use the first 3 octets of the address"

when you use a netmask you are supposed to know what it does and if not 
just don't specify it - the address alone would have had the assumed result

it's dead simple and there is nothing to agree
