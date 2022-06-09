From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Thu, 9 Jun 2022 21:23:10 +0200 (CEST)
Message-ID: <c3f2eff0-dca5-bf5d-d343-a8ab4e58a5f6@netfilter.org>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com> <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com> <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net> <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
 <20220608112135.GC11923@breakpoint.cc> <85215dc8-2d1b-7b64-02a9-f0ed1f397bc1@gmch.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <85215dc8-2d1b-7b64-02a9-f0ed1f397bc1@gmch.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Hall <netfilter@gmch.uk>
Cc: netfilter@vger.kernel.org, Florian Westphal <fw@strlen.de>

On Thu, 9 Jun 2022, Chris Hall wrote:

> On 08/06/2022 12:21, Florian Westphal wrote:
> > Chris Hall <netfilter@gmch.uk> wrote:
> > > For input such as "-s 10.0.0.2/24", the 10.0.0.2 simply isn't a valid
> > > network address for a /24 network.
> > > 
> > > I agree: the parser should detect invalid input and reject it.  I can see
> > > no good reason for being sloppy here.
> 
> Perhaps that should have been "...no good reason for _having_been_ sloppy...".

I don't agree. If it have been sloppy, it had been fixed at the very 
beginning. The "firewall" guys originally were "networking" guys and it 
was never a question what 10.0.0.2/24 could mean: apply the mask 
unconditionally.

> I am hoping that it is agreed that it is a mistake for the parser to 
> silently accept unspecified input and proceed to so something 
> unspecified with it.

Nothing is unspecified. If you mean the manpage could be improved, yes, it 
seems so. 
 
> Accepting that "breaking current behaviour" is a cardinal sin, the (obvious)
> alternative to fixing the code is to (retrospectively) fix the specification
> and amend the man page to reflect that.
> 
> Given that (eg) "-s 10.0.0.2/24" is at best ambiguous, and at worst nonsense:
> would a warning message "break current behaviour" ?

Sorry, I don't understand: if it's a warning, then the wording is 
misleading, which current behaviour does break? If it's an error, then 
that is unacceptable as it could really break scripts, without easily 
realise for the operators what happened: firewall scripts run at the very 
beginning at the boot and normally nobody watches the console (if exists).

> Anyway: "20 years later" suggests that this is not a big problem.  I am not
> trying to argue that it is.
> 
> Finally: given what the man page says, my principal issue was with the 
> (repeated) insistence (elsewhere) that what iptables does is both 
> *correct* and *obvious*, and that a "newbie" suggesting otherwise should 
> listen to their "elders and betters" and kindly "go away".

I agree, unfriendly tones do not help at all to understand newcomers 
problems.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
