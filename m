From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Subject: Re: [HEADS UP] Migrating ebtables and arptables to netfilter.org
Date: Thu, 29 May 2014 01:37:43 -0700
Message-ID: <CAHo-OoxDb6rREH1kZNKSGWzVL6pwwuzgEgYbHWA-NAUX9fRJqg@mail.gmail.com>
References: <20140527083359.GA4342@localhost>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=RYLXyj1OoyxEcwFRyIan0wkEa7wIHZWiG/LuNonXiNE=;
        b=JRYYmBloS/Fa+4SO6+D6KAHUH9lDY3TOu/0jXKg2PVuDjEwW76ewWf3q34lE49rLAN
         +iURHNUSx64hIPWaGcBwmFnclV6zaTp1wR/1XIB+NRcGP0nsRfLnUZUqfT8cRZu13PWG
         yER2SrbDgBT0mBE8pkkrjw5w4cl1V3wYPlYL6FE2wZH2K6oHXi6E6dh594hUWI6lQh0C
         goZYCAfwVqd3XXSvjM5ijVXIXPT1LM5LQD31aa42UrPR2X73eeFWoLHHI2nT5zRnp0Km
         WcjekHeq8cbmsklM0CENOqGcpqqKoLymPuX3uUmLQBxXl9fqVLGZJ/JMZxW7FReyoz9E
         ilhA==
In-Reply-To: <20140527083359.GA4342@localhost>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, bridge@lists.linux-foundation.org, Bart De Schuymer <bdschuym@pandora.be>

Missing tags if there were any previously.

On Tue, May 27, 2014 at 1:33 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Hi!
>
> We're migrating arptables and ebtables to git.netfilter.org. The new
> location for the repositories are:
>
> 1) arptables:
>
>         git://git.netfilter.org/arptables
>         http://git.netfilter.org/arptables/
>
> 2) ebtables:
>
>         git://git.netfilter.org/ebtables
>         http://git.netfilter.org/ebtables/
>
> Originally, these two applications were located in the same repository
> which has been kept at:
>
>         http://git.netfilter.org/ebtables.old-history/
>
> just for the record.
>
> I have git-filter-branch the original repository to separate the
> ebtables and the arptables in two independent repositories.
>
> Let me know if you experience any problem in this migration,
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
