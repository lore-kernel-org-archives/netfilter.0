From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ebtables complains about the speeding up example
Date: Sun, 10 Apr 2022 17:24:48 +0200
Message-ID: <YlL2wNZ9badE33qi@salvia>
References: <CAMjZu9NUzT__WUyb0jzX=oeAiJrzp6oaPJwY=UHwN_PDhPtBiw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMjZu9NUzT__WUyb0jzX=oeAiJrzp6oaPJwY=UHwN_PDhPtBiw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?Q8OpZHJpYyBNYXJ0w61uZXo=?= Campos <cedricmartinezcampos@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, Apr 09, 2022 at 04:13:53PM +0200, Cédric Martínez Campos wrote:
> Hi, there!
> 
> In one of the basic examples of ebtable's documentation, "Speeding up
> traffic destinated to the bridge itself", it is suggested to issue the
> command

Where is this documentation? If you could point to the URI, I can
update it and remove it.

>     # ebtables -t broute \
>                -A BROUTING \
>                -d $MAC_OF_BR0 \
>                -p ipv4 \
>                -j redirect \
>                --redirect-target DROP
> 
> This however returns the error
> 
>     ebtables: No chain/target/match by that name
> 
> 
> I guess it is because there is no chain called BROUTING. Is this
> really necessary? In such a case, how could I solve this?

What is your usecase? Or maybe you just found that documentation and
you added this rule?
