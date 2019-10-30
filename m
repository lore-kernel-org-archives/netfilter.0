From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Named sets with timeout
Date: Wed, 30 Oct 2019 12:12:57 +1100
Message-ID: <878sp3nihy.fsf@goll.lan>
References: <cd3973f01a86ebc50a7fae9da40f29ce@mailtower.de>
        <87wocowgab.fsf@goll.lan>
        <CAF90-WiguQF4PfU=8jGBSeC+PrbizWj8hXNAUQUkzOpsoLcYjA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Laura Garcia <nevola@gmail.com> writes:

> On Tue, Oct 29, 2019 at 8:00 AM Trent W. Buck <trentbuck@gmail.com> wrote:
>> I think you are right, but see [...]
>> https://git.netfilter.org/nftables/commit/?id=24f33c7
>> ...which sounds like there is a new (as-yet-undocumented?) keyword for
>> changing (as opposed to initializing) the timeout of a set element.
>
> No new or undocumented keyword, [...]
> "update" is what you're looking for. [....]
> [2] https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path

Thanks!

I apologize for my wrong & misleading answer. :-{

