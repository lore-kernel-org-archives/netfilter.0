From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: Re: nftables and connection tracking
Date: Mon, 22 Jun 2020 23:35:11 +0200
Message-ID: <CAChjPdQVpDHSY7-PCOBNrY=BqRhouFPtmWDv1Gyeo=5ZjU57Lw@mail.gmail.com>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200622120636.GA17558@salvia> <CAChjPdTfBB4x9AuQhdhuU_z+Zp=iPHUUDy_+5+YEhhdu+V-oiw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GxVwX01y7TeSgLisqlksO+FzBslUKE1KDv5b4DiGXJ8=;
        b=bqFKTrdC4mNs0WKzCVm5SjYCOimkSaKHb6DCUahVBZGvPK4kVuBxx5l05XB8fsys5X
         +H2Qf2Go6s9yw4Bp5y6LZZZhn3Y0uPO9T7tGjtIjnjZo+shatYHgnU11jnXvJVL5TyOs
         ncJklWxcpZJHD6STidd8gkUgg14kN+SKnWYQQlu9PCkORq3TlsLPb+HbLzkmmSL7rGaA
         JnwanWJ5FMnDKXybJMC+rAOU3SOrxyecQ14zl6kftWRCbzVoHcM1ofeF1gS9pO4oKtKG
         /GaCmXZUP/ak53HYjLWqSvBpLcAElX95sF8mBK2FrHGOor2rScKT9237kjh7ietqocGT
         6Tvw==
In-Reply-To: <CAChjPdTfBB4x9AuQhdhuU_z+Zp=iPHUUDy_+5+YEhhdu+V-oiw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hello Florian,

I am just thinking about what I did now when I changed the priority to
filter. For prerouting it is clear, since there is no other chain with
hook prerouting. But for output there is another one in the table
filter. Which one is proceeded first if they are the same priority?
what is they have conflicting policy? If the first one is drop, the
second chain will not proceed if not allowed in the first one?

If these priorities should be filter would not it be making more sense
to move the rules to the chains in the table filter?

Marek


2020-06-22 19:18 GMT+02:00, Marek Gre=C5=A1ko <mgresko8@gmail.com>:
> Hello,
>
> after changing priority it is working. It was a configuration error or a
> bug?
>
> Marek
>
>
> 2020-06-22 14:06 GMT+02:00, Pablo Neira Ayuso <pablo@netfilter.org>:
>> On Sun, Jun 21, 2020 at 07:54:14AM +0200, Marek Gre=C5=A1ko wrote:
>>> Hello,
>>>
>>> I have problem to get connection tracking work when using nftables. I
>>> have this setup on my fedora 32:
>>>
>>> table ip raw {
>>>         chain PREROUTING {
>>>                 type filter hook prerouting priority raw; policy accept=
;
>>
>> Could you try from the filter (0) priority instead ?
>>
>>                   type filter hook prerouting priority filter; policy
>> accept;
>>
>> Thanks.
>>
>
