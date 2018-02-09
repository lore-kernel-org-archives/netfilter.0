From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: ENOENT when adding conntrack rule
Date: Fri, 9 Feb 2018 14:03:07 +0100
Message-ID: <CAOkSjBiobmHugBduUJ6g4ynzDGt5KTvEhXcZUQ+N-Un8t4Mbkw@mail.gmail.com>
References: <trinity-11d633c5-2d36-4425-857e-b629141f910d-1518180464419@3c-app-gmx-bs51>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <trinity-11d633c5-2d36-4425-857e-b629141f910d-1518180464419@3c-app-gmx-bs51>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Koller <kollergefahr@gmx.de>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 9 February 2018 at 13:47, Andreas Koller <kollergefahr@gmx.de> wrote:
> Hi,
>
> I'm trying to add the following rule:
> nft add rule filter input ct state established,related accept
> but continue getting ENOENT (no such file or directory)
>
> Both the table and the chain are existing:
>
> table inet filter {
>         chain input {
>                 type filter hook input priority 0; policy accept;
>         }
> }
>

Try:

nft add rule inet filter input [...]

you are missing the family, which is by default 'ip'.
