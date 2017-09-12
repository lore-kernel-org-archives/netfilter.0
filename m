From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: nftables: difference between "meta l4proto tcp" and "ip protocol tcp"
Date: Tue, 12 Sep 2017 09:49:01 +0200
Message-ID: <CAOkSjBg43kSPTM2=FLKDDqM5bFGH5gLJE+Unx3M5CVOMWaX10Q@mail.gmail.com>
References: <ba8e2901-5aea-8e5e-9bc7-0d79bda82968@gmail.com>
 <CAOkSjBhb3X7y+Vu39Z9rhSV7y5s7kFJCh33bxkEb5x-x4vscog@mail.gmail.com> <936e7a0c-59e7-6a88-1ed4-f9227b906f4e@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <936e7a0c-59e7-6a88-1ed4-f9227b906f4e@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Louis Sautier <sautier.louis@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 12 September 2017 at 09:35, Louis Sautier <sautier.louis@gmail.com> wrote:
> On 12/09/17 08:32, Arturo Borrero Gonzalez wrote:
>> On 11 September 2017 at 23:10, Louis Sautier <sautier.louis@gmail.com> wrote:
>>> Hello,
>>>
>>> I noticed that I can not use "ip protocol tcp" for IPv6, I assume that
>>> this is due to IPv6 packets not having a protocol field.
>>> However, I also noticed that "meta l4proto tcp" works for IPv4 and it
>>> seems to match exactly the same packets as "ip protocol tcp".
>>>
>>> The only relevant piece of information that I could gather is a message
>>> (https://patchwork.ozlabs.org/patch/593221/) stating that (for "meta
>>> l4proto" and "ip protocol") "However, the two statements are
>>> redundants... the second implies the first".
>>>
>>>
>>> If those expressions are different, what exactly do they use to match
>>> packets? Is one more efficient?
>>>
>>
>>
>> Both are similar in term os efficiency.
>>
>> ip protocol tcp checks the IPv4 header looking for the l4 protocol number.
>> meta l4proto tcp checks packet meta information (not header) to know
>> about the l4 protocol, regardless of l3 protocol.
>>
>> Obviously, meta l4proto tcp can be used in IPv4/IPv6 while the first
>> only makes sense in IPv4.
>> You should read 'ip protocol tcp' as if it was explicit about l3
>> protocol, like 'ipv4 protocol tcp': this wont match any IPv6 packet.
>>
> Thanks for the reply.
> So if I understand correctly, "ip protocol" refers to an actual IPv4
> packet field whereas "meta" refers to metadata that does not necessarily
> have an associated packet field (such as all the unqualified meta
> expressions like "skuid").

Yes.

> I guess in the case of IPv4, "meta l4proto" is obtained from the
> protocol field whereas in the case of IPv6 it is obtained from the "next
> header" field. But it doesn't matter to us because we use this "meta"
> abstraction, is that right?
>

In case you want concrete details, here a few pointers in the source code.

meta l4proto fetching into a register:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nft_meta.c#n53

In case of IPv6 packet, here is how the metainformation is filled:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree//include/net/netfilter/nf_tables_ipv6.h#n8

At the end, we are using ipv6_find_hdr()
http://elixir.free-electrons.com/linux/latest/source/net/ipv6/exthdrs_core.c#L185

Searching for the packet metainformation is happening per packet at
runtime, not matter your ruleset, just when a packet enters a hook:
http://elixir.free-electrons.com/linux/latest/source/net/ipv6/netfilter/nf_tables_ipv6.c#L19
