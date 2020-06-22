From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: Re: nftables and connection tracking
Date: Mon, 22 Jun 2020 19:18:05 +0200
Message-ID: <CAChjPdTfBB4x9AuQhdhuU_z+Zp=iPHUUDy_+5+YEhhdu+V-oiw@mail.gmail.com>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200622120636.GA17558@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CRGxhO3ZYNBhgIdiL1oGYL/R9KBQbUwyj7Hqc+IJ1/Q=;
        b=kpL4S0SkOi33fOv7hrKTHfahg7jkQAgJ2bFr9oVnrMvEPiHO2LMhSAWC4CM3lqokRk
         Ek00vHt78MlCjVQax0rbNJrjHRlgxHbQKKw7Ef0j3geH9wrIYuW+gdLP2vyMopxEQaLh
         43D0Ajexd8Or4HoBbrEtBBtKmqYibVXl7pvDKzT1JefhqSdAmcJwxftdxbPgEpeAJfuh
         bagmGExDxmzGZiYWX6SbzlKbpdtaTEJseUGW41FHAPArhN7jxlR7T0tMyb1wgA0FDKLH
         TsdoLsEq4azToev5Wnl330fzMGAg9ZBEDUg/xXKcKZR+GCokB7loI3VJ7laZ/NR+pMN7
         g6Dw==
In-Reply-To: <20200622120636.GA17558@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hello,

after changing priority it is working. It was a configuration error or a bu=
g?

Marek


2020-06-22 14:06 GMT+02:00, Pablo Neira Ayuso <pablo@netfilter.org>:
> On Sun, Jun 21, 2020 at 07:54:14AM +0200, Marek Gre=C5=A1ko wrote:
>> Hello,
>>
>> I have problem to get connection tracking work when using nftables. I
>> have this setup on my fedora 32:
>>
>> table ip raw {
>>         chain PREROUTING {
>>                 type filter hook prerouting priority raw; policy accept;
>
> Could you try from the filter (0) priority instead ?
>
>                   type filter hook prerouting priority filter; policy
> accept;
>
> Thanks.
>
