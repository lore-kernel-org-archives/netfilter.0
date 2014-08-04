From: Matteo Croce <technoboy85@gmail.com>
Subject: Re: nftables NAT
Date: Mon, 4 Aug 2014 11:00:11 +0200
Message-ID: <CAFnufp1GrEUkmWVm+1FYGdCfxzJPexecs5J5g9j61N9y1oDFAA@mail.gmail.com>
References: <CAFnufp1kVrtPXm45VRYZK9G+oHBS0Uy9S_sfYzSmapSB5SdR0w@mail.gmail.com>
 <53DF0AE2.5080202@atc.tcs.com> <CAFnufp1WCpouK0xwwqhhM_fZaoVP-otepvwCXvtkx7PzYqSg3A@mail.gmail.com>
 <CAOkSjBiXx7NL0A2RZPzgGHDDWRB0=2OHb6o-uNp776YL_UyOhA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=rnhASwABUA3GGQlkk+N8B7Lc54m0u+R7KbNkbsHkJYs=;
        b=IpX9/BxLZuJdHiN5YMCxKaR9tdnP3Pfw7WE9dVlH2CcHUKuupBOo0rlVshkAn3S6FZ
         Cqx2a3kSu1ulccmI9tjrZQ/t7jA54pHnkM2C2++8g2urku9o35368N9sO6xM+J1iJ1wD
         DFv966eWK1DTnEAmkOA7iVcYBxXR2Qdf3vWhc7AVziEyVvxu2AdPfSqkVV/ei1FdlXXW
         KV1LjmEeIzU8PnDI8j84qzqtNBSpAYJz5Jg0qzT3vukoPDWaOv6ak6n4jhBUW7XLtLQj
         2Pd4s1z4BBaBbnxuLr6s6qPwq6WK7mgE+BX3dfqo/eMm7MqoT46/o/qKfMIy8SOwN7O+
         345g==
In-Reply-To: <CAOkSjBiXx7NL0A2RZPzgGHDDWRB0=2OHb6o-uNp776YL_UyOhA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Vigneswaran R <vignesh@atc.tcs.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

# uname -a
Linux apu 3.16.0-apu #2 SMP Mon Aug 4 01:43:03 CEST 2014 x86_64 GNU/Lin=
ux
# nft -v
nftables v0.3 (Support Edward Snowden)

libnftnl0 1.0.2-1 (Debian package)

2014-08-04 10:51 GMT+02:00 Arturo Borrero Gonzalez
<arturo.borrero.glez@gmail.com>:
> On 4 August 2014 10:46, Matteo Croce <technoboy85@gmail.com> wrote:
>> It started working after loading the module iptable_nat
>> Does nftables rely on iptables?
>>
>
> I guess it should not.
>
> Please provide detailed info about your system: kernel, nft, libnftnl=
, etc..
>
> regards.
>
> --
> Arturo Borrero Gonz=C3=A1lez



--=20
Matteo Croce
OpenWrt Developer
