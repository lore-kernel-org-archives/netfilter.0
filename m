From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: Empirically determined limits on identifier name length
Date: Thu, 24 Aug 2017 06:49:20 -0700
Message-ID: <1c612813-7b28-cbfc-788c-4f5aa3cb2e7e@allycomm.com>
References: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
 <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com>
 <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
 <015d67fd-4453-66df-c4c9-78a17bcbbdd3@wagsky.com>
 <CAOkSjBg2dsA+huYfJRakB8EDMY0_gTSwT9QA7xc8vfDw1eXvDw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBg2dsA+huYfJRakB8EDMY0_gTSwT9QA7xc8vfDw1eXvDw@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Jeff Kletsky <netfilter@allycomm.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

The referenced patch is, in fact, in the build I am using and have been 
using. The deficit in error reporting is *not* resolved.

As Pablo requested, a fresh build was done and reported here that 
confirmed again that the error-reporting problems were present, even 
with that patch in place.

$ git log --oneline 509671dfa03365bba727b8be5e522b737da93a6f^..2017-08-19

where 2017-08-19 is my local build tag, confirms this.

$ git log -1
commit d74eed8c9649e9278b69f2cd0fd92f71e3e19cfb (HEAD -> master, tag: 
2017-08-19, origin/master, origin/HEAD)
Author: Varsha Rao <rvarsha016@gmail.com>
Date:   Wed Aug 16 19:48:17 2017 +0530


My posts are not about the bug itself, but trying to work through the 
untenable combination of incomplete and/or inaccurate documentation and 
arrive with a Linux-based firewall that I trust to work. Determining how 
a security-sensitive process works by "poking at it with a stick" is 
hardly considered best practice. There are things that you can't poke 
and observe response that either need to be trusted (bad plan), or 
documented as part of the nftables "contract" with its users.

When I first started with nftables and found its documentation to be 
sorely incomplete, I asked on the -devel list how I could best help with 
documentation and there was no response.

<https://wiki.nftables.org/wiki-nftables/index.php/Main_Page>
Third line of the main page:
"If you have any suggestion to improve it, please send your comments to 
Netfilter users mailing list <netfilter@vger.kernel.org>."




On 8/23/17 11:33 PM, Arturo Borrero Gonzalez wrote:
>> The error message when the limit is exceeded for the "in-kernel" chain and
>> set identifiers is similar to
>>
>>      nftables.conf:3:1-14: Error: Could not process rule: Numerical result
>> out of range
>>      flush ruleset
>>      ^^^^^^^^^^^^^^
>>
> You complain again and again about this bug (bad error reporting) but
> as Pablo told you already, this has been solved.
> I know the bug is annoying, but this fixed code isn't included in v0.7.
>
> Reference:
>   http://git.netfilter.org/nftables/commit/?id=509671dfa03365bba727b8be5e522b737da93a6f
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

