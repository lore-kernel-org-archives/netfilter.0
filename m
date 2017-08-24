From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Create set and/or chain accessible across multiple tables
Date: Thu, 24 Aug 2017 08:46:25 +0200
Message-ID: <CAOkSjBgZ_YDpe5+F8pkvEaVvBHwC+08J2AFP32xzk=jvhtF8fA@mail.gmail.com>
References: <02c72729-72ab-1947-53b7-0a3cbaff4d7a@wagsky.com>
 <CAOkSjBiqzd5PHuFU=_sctb4JxRC0_ibmgcVkgDL8C9qANrCFMQ@mail.gmail.com>
 <CAOkSjBjkO8J7RGUqGSb_nqTTe7roeoMgqd0FnC7+0h_4iz9FQw@mail.gmail.com> <06974758-bdb2-125f-2d39-bb9ca8529fd9@wagsky.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <06974758-bdb2-125f-2d39-bb9ca8529fd9@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kletsky <netfilter@allycomm.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 23 August 2017 at 20:51, Jeff Kletsky <netfilter@allycomm.com> wrote:
> Thanks, yes, a define at the top-level can be accessed throughout.
>
> I chose to select an approach to declare the set in a file that can be
> "included" within any table.
>

As sets are per-table, this is not possible unless you use the
variable trick I mentioned in the previous email.

> The question about atomic changes comes from my familiarity with and use of
> FreeBSD's ipfw
> and its support for atomic operations on only *parts* of a rule set, such
> as:
>

great, then I hope you find nftables better than ipfw regarding this :-)

>
> As an example of an application of this, consider that there are two
> possible packet flows that need to be "switched" between.
>
>     /---- path A ----\
> ---X                  Y--->
>     \---- path B ----/
>
> To provide uninterrupted flow, the "switch" point at Y needs to be
> simultaneously changed with that at X
>
>

If I understand well and X, Y are the same box/firewall, then atomic
replacement using 'nft -f' is the way to go.

In case they are different boxes/firewalls, we have a tool in mind
(nft-sync) which is under (slow-)development to handle cases like
this.
