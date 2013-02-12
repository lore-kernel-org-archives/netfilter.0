From: Ambroz Bizjak <ambrop7@gmail.com>
Subject: Re: --and-mark while matching?
Date: Tue, 12 Feb 2013 13:25:00 +0100
Message-ID: <CAOA3yKJiV6nd-pP8bJSRyGAxA09re5z7HOp6SSsxVgJfRN7-ow@mail.gmail.com>
References: <20130212094723.GB20707@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=8BczhY7Z/TEk6+vJH+o0EZGJxAIEPVYTKSPLGGc+OfI=;
        b=xCy0VS2vZaQL2xYgoLVgiu7KU7UHPkZpwIFmCz3ZVCM00h2zRnUfzm4GHv1i/JeWO9
         xr5SvyZ0hYHVoxd21yYYNMC/2NY7IoeQTkG/BLptevhRlAuQuvzCDFfYyf9TJ7ho3ZJp
         VbFxNzOPfbEbfn/bukwIABe/uOEfhW84A0OoSt26Px/6nkZ8r6zukxjbEOJO/kcJb4MR
         RR0fYjBDp2RoGrn8ao1HCqoKI9ZLGrsBKdNcgofx7SmZIcIhVM0XoUf2ZzffvLOKKFic
         C3/KrPCuurDO2oZ5fOHWWYx8TuZcuZLlOuarKDkFiTX2eJCSg0lSkry/bvOhNDhzVJRk
         up1A==
In-Reply-To: <20130212094723.GB20707@devnull>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

iptables -I INPUT -m mark --mark 0x20/0x20 -j REJECT

See the description of the mark match. If you specify "-m mark --mark
A/B", the mark is first and'ed with B and then the result is checked
for equality to A.

On Tue, Feb 12, 2013 at 10:47 AM, Aaron Lewis
<the.warl0ck.1989@gmail.com> wrote:
> Hi,
>
> Looks like the mark module doesn't support "and" matching mechanism,
>
> iptables -I INPUT -m mark --and-mark 0x20 -j REJECT
>
> I want to match the packet when the mark has all bit of 0x20 set,
> possible?
>
> --
> Best Regards,
> Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
> Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
