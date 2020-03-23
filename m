From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: Ipv6tov4 address Dnat
Date: Mon, 23 Mar 2020 09:05:25 +0300
Message-ID: <623a7bed-5213-0467-346d-6e68d3f369d5@gmail.com>
References: <CAG1z+7_CKA90Yd_AFkw+Jh7zJsxWE21Vnbso7fh3y9a_wcjSFg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=1j9mpXCCOSUQi1edV72pweb2SiUc8qFG9oA0EmR+yCY=;
        b=jGMsWvORXLaoGEZxoZpAkc97gujZEaQi1tWVjrvwMsdse5H0DdWekzANWjTbCb0o/p
         GvAOe/sGvqVmK877+H7M6S/ezcxQN5fh3cyfvMThI5UkCr1sxAHZiLKL0ELkDWtOknRh
         bBNROa5IHjUgVvqMbEAMWiF7Rz6PhATkM9oCe1drw2e46UepbHWqee107DIG9MuSBSvl
         sJaMT1WKfVjge2EMHG05NUqoRUYRUN6Jrou2DFXBb8ms9vU3hVDytrR/lCqZFoMst8Xw
         gxSwwZ7w5I/Aq5YFLSQ6+8Bn9ZrT93Qw3IQkMH2ZP3vPZWjWoIxSGx2S38eqbTFPRtQv
         H04Q==
In-Reply-To: <CAG1z+7_CKA90Yd_AFkw+Jh7zJsxWE21Vnbso7fh3y9a_wcjSFg@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zheng konia <konianet@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>


Hi,
I'm not sure nftables is native supports for nat64.
You may use jool. But jool supports iptables and netfilter modes for now.

nft issue(WIP) https://github.com/NICMx/Jool/issues/285


Fatih USTA

On 23.03.2020 08:35, Zheng konia wrote:
> Hi ,
>
>       I want to do the dnat like
>
>              match IPV6  udp dport 9999 dnat to  IPV4:9999
>
>       However, the rule bellow didn't work.
>
> table inet nat {
>
>     chain prerouting {
>         type nat hook prerouting priority 100; policy accept;
>                  ip6 nexthdr udp udp dport 9999 dnat to  192.168.1.11:9999
>          }
>
>       chain postrouting {
>           type nat hook postrouting priority 100; policy accept;
>          masquerade
>     }
>
>    Could you show me how to config ipv6 dnat to ipv4 ? Thanks.
>
> ---------------
> konia
> 2020/03/23
