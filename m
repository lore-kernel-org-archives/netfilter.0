From: Alvaro Leiva <alvaroflmiranda@gmail.com>
Subject: Re: extending element timeout
Date: Mon, 6 Apr 2020 08:55:10 -0400
Message-ID: <CALiBZbxh-zMF4XBc+HcZeug1tNeq0rot71_y-qDiFtVuTp0oqA@mail.gmail.com>
References: <CAF90-WiP8pzgXaZB8cE5qkhD6nAtoPrazNLsvkHMBnm4APnpcw@mail.gmail.com>
 <20200405182926.8B32F3651C3@zimbra.mdabbs.org> <CALiBZbwtDbmJbeecWDthpoZ82sS+Oa2t6=7N5D=Lhnthy4q2Nw@mail.gmail.com>
 <CAF90-WiftiMPB1dJX+c4TkmU7a9=JkUJPBsCScpXN1BNXDyyLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ukWS1G1EqVucpG3PVp34o2rEhU/AE0KlxyFnYBAQaRM=;
        b=JUsTRLwrWuD0GFxwcufVtiL4plVuEl/rBcF5m3k4laJ/yrcvDa9N7GUM+MaxscFOWN
         s0e+bayoeh/Du6T2CsLnK+Cy7BVeEdaDOPzcCutZJ1SWbV5ruNKueFIlwLR4A2MTWjRl
         qKfroL/V9+B03xnsO8B/JK/3DvQyC8af72xKTeQUgihn0PzvjysilrGp1h2Ezf4qcm+J
         VZMIr9EEMBBTweWXqv747Le7Cmp/PXsKOSt6fYQrX3c81iqWYDh3R62lkhvUSyqOusih
         f1Miw5vSuYRv5gZ5FboZsC2j2M1Ch2/+BNN6bmmWt8GmCLrlLKvGaly5C3LgJxNT6o2D
         nq3w==
In-Reply-To: <CAF90-WiftiMPB1dJX+c4TkmU7a9=JkUJPBsCScpXN1BNXDyyLQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Laura Garcia <nevola@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thank you so much Laura !
one last thing =F0=9F=98=AC: this delete and and add operation is atomic?,
ensures that no packet would be dismissed ?


On Mon, Apr 6, 2020 at 4:13 AM Laura Garcia <nevola@gmail.com> wrote:
>
> On Sun, Apr 5, 2020 at 10:26 PM Alvaro Leiva <alvaroflmiranda@gmail.com> =
wrote:
> >
> > thanks for helping me, would you care to show me a basic example, I
> > have been reading the wiki and i got a bit confused, i barely know nft
> > since a day ago, thanks again
> >
>
> Hi, deleting and adding a new element with timeout and expiration date
> is very simple:
>
> % nft delete element inet myfilter myset { 10.0.0.1 }
> % nft add element inet myfilter myset { 10.0.0.1 timeout 7s expires 5s }
> (according to the wiki example. Please check it out again, I've
> completed the page)
>
> Via packet path, please see below an example with connlimit which was
> shown in the list time ago. In this case, _dynamic_ flag is set.
>
> table ip my_filter_table {
>          set my_connlimit {
>                  type ipv4_addr
>                  size 65535
>                  flags dynamic,timeout
>                  timeout 10m
>                  elements =3D { 10.255.255.3 expires 6m16s920ms counter
> packets 1848 bytes 173538, 13.55.50.68 expires 7m7s746ms counter
> packets 1 bytes 76,
>                               216.58.199.34 expires 3m9s590ms counter
> packets 2 bytes 120, 216.58.199.78 expires 8m10s1ms counter packets 1
> bytes 60 }
>          }
>
>          chain my_output_chain {
>                  type filter hook output priority filter; policy accept;
> // reset the expiration time to the timeout from packet path every
> time the same source address hits this rule
>                  ct state new add @my_connlimit { ip daddr counter } acce=
pt
>          }
>  }
>
> Cheers.
