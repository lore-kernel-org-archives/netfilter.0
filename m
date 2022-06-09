From: Chris Hall <netfilter@gmch.uk>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Thu, 9 Jun 2022 18:52:34 +0100
Message-ID: <85215dc8-2d1b-7b64-02a9-f0ed1f397bc1@gmch.uk>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
 <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
 <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
 <20220608112135.GC11923@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
In-Reply-To: <20220608112135.GC11923@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Florian Westphal <fw@strlen.de>

On 08/06/2022 12:21, Florian Westphal wrote:
> Chris Hall <netfilter@gmch.uk> wrote:
>> For input such as "-s 10.0.0.2/24", the 10.0.0.2 simply isn't a valid
>> network address for a /24 network.
>>
>> I agree: the parser should detect invalid input and reject it.  I can see no
>> good reason for being sloppy here.

Perhaps that should have been "...no good reason for _having_been_ 
sloppy...".

> It breaks current behaviour; we cannot change this 20 years later.
> Its as simple as that.

You snipped the bit where I said:

 >> It can be argued that it is too late to fix the parser, on the basis 
 >> that this could stop existing configurations from working.  But that 
 >> doesn't mean that the parser is not broken.

I am hoping that it is agreed that it is a mistake for the parser to 
silently accept unspecified input and proceed to so something 
unspecified with it.

Accepting that "breaking current behaviour" is a cardinal sin, the 
(obvious) alternative to fixing the code is to (retrospectively) fix the 
specification and amend the man page to reflect that.

Given that (eg) "-s 10.0.0.2/24" is at best ambiguous, and at worst 
nonsense: would a warning message "break current behaviour" ?

Anyway: "20 years later" suggests that this is not a big problem.  I am 
not trying to argue that it is.

Finally: given what the man page says, my principal issue was with the 
(repeated) insistence (elsewhere) that what iptables does is both 
*correct* and *obvious*, and that a "newbie" suggesting otherwise should 
listen to their "elders and betters" and kindly "go away".

Chris
