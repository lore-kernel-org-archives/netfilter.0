From: Chris Frederick <cdf123@cdf123.net>
Subject: Re: Packets not hitting the nat POSTROUTING table
Date: Thu, 09 Jan 2014 17:02:51 -0600
Message-ID: <52CF2A9B.3000903@cdf123.net>
References: <52CF1B40.2070201@cdf123.net> <CAKfDRXg6ikUtbe3WF6EZTPpDSm_-nPSNPGgXGC95A4GPN9YEhw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKfDRXg6ikUtbe3WF6EZTPpDSm_-nPSNPGgXGC95A4GPN9YEhw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Kristian Evensen <kristian.evensen@gmail.com>

On 01/09/14 16:31, Kristian Evensen wrote:
> Hi Chris,
>
> On Thu, Jan 9, 2014 at 10:57 PM, Chris Frederick <cdf123@cdf123.net> wrote:
>> Any ideas would be helpful.
>
> If I have understood things correctly, packets belonging to an
> established connection does not hit any of the chains in the nat
> table. If you want to mangle/filter/manipulate/... these packets, you
> can use for example the POSTROUTING chain in the mangle table or in
> rawpost. The latter requires xtables-addons as well as slight change
> to compilation as rawpost was removed in a recent commit. See:
> http://sourceforge.net/p/xtables-addons/xtables-addons/ci/9414a5df343bf30ba13e76dbd7181c55683b11cb/
>
> -Kristian

When you say "established connection" are you talking TCP level established connection, or is this from contrack identifying the connection?  I 
guess what I'm asking is if doing a NOTRACK in raw would allow the packets through and still pass through nat/POSTROUTING?

I did see that they are hitting the POSTROUTING chain in the mangle table, but I can't SNAT from there.  Does xtables-addons provide this?  I'll 
probably start looking there.

The Changelog from the sourceforge link mentions the code was removed because it was unmaintained.  Is that the only reason, or was this a 
policy decision to remove that functionality to make way for something different?  I would just worry about the future if I patch the system now.

Thanks Kristian,

Chris Frederick
