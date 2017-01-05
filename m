From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: How to programmatically implement a firewall rule
Date: Thu, 5 Jan 2017 12:03:30 +0100
Message-ID: <CAOkSjBjd3V4pK6bnjs66CZNxSi9mLye-n4mb5N6h8Bdpj-O=2w@mail.gmail.com>
References: <CAE0moyf85VpysmmCLa+dX4wtFZhDv+AVcxkM=BcCr=2hJ0mMBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE0moyf85VpysmmCLa+dX4wtFZhDv+AVcxkM=BcCr=2hJ0mMBQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Khawar Shehzad <shehzad.khawar@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 5 January 2017 at 11:56, Khawar Shehzad <shehzad.khawar@gmail.com> wrote:
> HI,
> I hope all are fine, and happy new year.
>
>
> I want to implement a rule using libnftnl in C programming. This rule
> specifies that a packet with a specific source address and a specific
> destination address SHOULD be allowed. All other packet which does not
> have that source and destination address MUST be dropped.
>
>
> Just a little hint would suffice. I need to implement it. Any
> direction would be much appreciated.

Take a look at libnftnl examples. In nft-rule-add.c [0] a rule that
does 'tcp dport 22 counter' is added.

[0] http://git.netfilter.org/libnftnl/tree/examples/nft-rule-add.c
