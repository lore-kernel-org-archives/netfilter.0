From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Empirically determined limits on identifier name length
Date: Thu, 24 Aug 2017 08:33:48 +0200
Message-ID: <CAOkSjBg2dsA+huYfJRakB8EDMY0_gTSwT9QA7xc8vfDw1eXvDw@mail.gmail.com>
References: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
 <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com> <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
 <015d67fd-4453-66df-c4c9-78a17bcbbdd3@wagsky.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <015d67fd-4453-66df-c4c9-78a17bcbbdd3@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kletsky <jmk@wagsky.com>
Cc: Jeff Kletsky <netfilter@allycomm.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 23 August 2017 at 23:58, Jeff Kletsky <jmk@wagsky.com> wrote:
> At least working with the HEAD version of nftables v0.7, current library
> versions, and kernel 4.9,
> the limits on identifier length that I have determined empirically (I have
> not examined the code):
>
> * chain, set -- 31 characters
> * table -- (not examined, but *guessing* 31 characters as well)
>
> * define -- limit in excess of 65 characters
>

Yes, we have limits in the name of the objects. Probably raising
limits in the future.

> The error message when the limit is exceeded for the "in-kernel" chain and
> set identifiers is similar to
>
>     nftables.conf:3:1-14: Error: Could not process rule: Numerical result
> out of range
>     flush ruleset
>     ^^^^^^^^^^^^^^
>

You complain again and again about this bug (bad error reporting) but
as Pablo told you already, this has been solved.
I know the bug is annoying, but this fixed code isn't included in v0.7.

Reference:
 http://git.netfilter.org/nftables/commit/?id=509671dfa03365bba727b8be5e522b737da93a6f
