From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: typo on wiki
Date: Tue, 23 Sep 2014 09:01:29 +0200
Message-ID: <CAOkSjBjUQ-RyB2pp53af87XxmZdoNmYn-VB_d4C-XvDBVRSgjw@mail.gmail.com>
References: <20140923012420.GA6301@vega.jjdev.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=FBlQqqpK85EGj5TI9wH49O8NHFTvbYQoj9JomnJpF04=;
        b=ZI1094HiwNgGR6WpHCBEL+w5qjMpgGrV/ywhXJVbFc4YukZ34PNjFI7II554JmurwI
         XnGSUnzpjwPaTGo/Q3mQqYxYZepJ1VeAwk3NyE2RIsQ4h3KjDVwi6xxhhJVT+NJ8LYkV
         c9lY4M8o+h+OZZbT14s9bs5QRT+y1aQXNazSrs37u5ZeEFfM/NrqTFI6W6jt/RpTt60e
         bcAWSEwVp2gzUEG7T1flrI5Nd8AZa2JnXj8YJjYb5x63dP2zdKo64WQdgNsrfmtzWwiK
         Kl/QzAEg4By8sxgANGShcaCP/cM9RWAVBHgbkl56qF7Fq9mhBoJ5feVqqTJyTa8Wg0Tj
         z19A==
In-Reply-To: <20140923012420.GA6301@vega.jjdev.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: John de la Garza <john@jjdev.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 23 September 2014 03:24, John de la Garza <john@jjdev.com> wrote:
> http://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains
>
> it says:
>
> Deleting chains
>
>    You can delete the chains that you don't need, eg.
>    % nft add chain ip filter input
>
>
>
>
> should read
>
> Deleting chains
>
>    You can delete the chains that you don't need, eg.
>    % nft delete chain ip filter input

=46ixed,

thanks for the report.
--=20
Arturo Borrero Gonz=C3=A1lez
