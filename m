From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Matching daddr and saddr in single rule?
Date: Fri, 3 Nov 2017 16:47:04 +0100
Message-ID: <CAOkSjBiRuYj2x4wrQEKTDAOtCwkYOg2=QHpPqrqPq4CHJLLbbw@mail.gmail.com>
References: <a97dd1aa1730955ba8673fd483a53d0a@spoje.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a97dd1aa1730955ba8673fd483a53d0a@spoje.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Mudrunka <mudrunka@spoje.net>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 3 November 2017 at 15:39, Tomas Mudrunka <mudrunka@spoje.net> wrote:
> Hello,
> i'd like to drop all traffic that is related to address. is there way to
> merge these two rules:
>
> nft add rule ip filter output ip daddr 1.2.3.4 counter drop
> nft add rule ip filter output ip saddr 1.2.3.4 counter drop
>
> to single rule like this:
>
> nft add rule ip filter output ip addr 1.2.3.4 counter drop
>
> i think this would be quite useful to simplify my rule set. especialy when
> handling vast amount of addresses.
>

The amount of addresses should be no problem since you can use native sets:

add rule ip filter output ip saddr @badips counter drop
add rule ip filter output ip daddr @badips counter drop
