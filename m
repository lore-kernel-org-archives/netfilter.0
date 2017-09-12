From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: nftables: difference between "meta l4proto tcp" and "ip protocol tcp"
Date: Tue, 12 Sep 2017 08:32:49 +0200
Message-ID: <CAOkSjBhb3X7y+Vu39Z9rhSV7y5s7kFJCh33bxkEb5x-x4vscog@mail.gmail.com>
References: <ba8e2901-5aea-8e5e-9bc7-0d79bda82968@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ba8e2901-5aea-8e5e-9bc7-0d79bda82968@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Louis Sautier <sautier.louis@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 11 September 2017 at 23:10, Louis Sautier <sautier.louis@gmail.com> wrote:
> Hello,
>
> I noticed that I can not use "ip protocol tcp" for IPv6, I assume that
> this is due to IPv6 packets not having a protocol field.
> However, I also noticed that "meta l4proto tcp" works for IPv4 and it
> seems to match exactly the same packets as "ip protocol tcp".
>
> The only relevant piece of information that I could gather is a message
> (https://patchwork.ozlabs.org/patch/593221/) stating that (for "meta
> l4proto" and "ip protocol") "However, the two statements are
> redundants... the second implies the first".
>
>
> If those expressions are different, what exactly do they use to match
> packets? Is one more efficient?
>


Both are similar in term os efficiency.

ip protocol tcp checks the IPv4 header looking for the l4 protocol number.
meta l4proto tcp checks packet meta information (not header) to know
about the l4 protocol, regardless of l3 protocol.

Obviously, meta l4proto tcp can be used in IPv4/IPv6 while the first
only makes sense in IPv4.
You should read 'ip protocol tcp' as if it was explicit about l3
protocol, like 'ipv4 protocol tcp': this wont match any IPv6 packet.
