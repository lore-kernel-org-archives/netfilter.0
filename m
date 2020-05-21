From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: Re: nftables: defining variables containing ipv6 adresses
Date: Thu, 21 May 2020 13:29:15 -0400
Message-ID: <CAMOPTEz6tBM2gNat+GAwf=eweyf7czWigYL83W==PD4sbtZyag@mail.gmail.com>
References: <20200521122720.3a6c264a@kaperfahrt.nebelschwaden.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u/ZGAMQnHqSviLhxua6Dwydx82weDRVyJdYwarT46EQ=;
        b=QejRLi+CZphxxXnD0O5LvG73AHbP85zxnRbVASBkKTkF0G3urA/dUYw1CDXuNSzSbJ
         FDnWaF4XMEsHH37SPs245iQ1BKB5Anup33VV9BfDS58J4xDYphlbGdCW1FoR44GSaqSH
         GYUIXVyozndfg03i+Dazx/YgPwOvojqL7G9muZUlHWn6gkIWxvxHsytJQgST/y65frcy
         fa1YuGIRziRoWb28cWzqNfqCiNyUKoifO9wIM91xAMazoi0MpBJk2Cuid00zzAMcT0vn
         Ddl/vQyy3uwZk6rP6I9BSIVuiqXw+YIc1Fp7Zo2kIFemOPOOUezCQiAxkmTaOBFA6SGu
         IvQQ==
In-Reply-To: <20200521122720.3a6c264a@kaperfahrt.nebelschwaden.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Weberstaedt <thomas.weberstaedt@nebelschwaden.de>
Cc: netfilter@vger.kernel.org

You need to use a valid ipv6 address. E.g.:

define IP6ADDR = 2607:f8b0:400b:80f::2004    <-- a single address with no CIDR
define IP6PREFIX = 2607:f8b0:400b:80f::/64       <-- prefix with CIDR

If you're referencing the IP6PREFIX variable in a set, then you need
to set the interval flag in the set. E.g.:

set IP6PREFIX_SET {
    type ipv6_addr
    flags interval
    elements = {
        $IP6PREFIX
    }
}

otherwise you do not need the interval flag for single addresses:

set IP6ADDR_SET {
    type ipv6_addr
    elements = {
        $IP6ADDR
    }
}

Oliver


On Thu, May 21, 2020 at 6:38 AM Thomas Weberstaedt
<thomas.weberstaedt@nebelschwaden.de> wrote:
>
> Hi,
>
> I am wondering, how may I define IPv6 variables?
>
> The obvious idea:
>
> define IP6PREFIX = fdaa:bbbb:cccc:dddd
>
> produces an error:
>
> /etc/nftables/setup.conf:7:29-29: Error: syntax error,
> unexpected colon, expecting newline or semicolon
>
> define IP6PREFIX = fdaa:bbbb:cccc:dddd
>                             ^
>
> What would be the proper way to do so? Any documentation on this?
>
> Thanks
>
> Ede



-- 
:o@>
