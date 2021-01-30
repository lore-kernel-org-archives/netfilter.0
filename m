From: =?UTF-8?Q?Laura_Garc=C3=ADa_Li=C3=A9bana?= <nevola@gmail.com>
Subject: Re: nftables typeof concatenation support for vmap?
Date: Sat, 30 Jan 2021 18:48:21 +0100
Message-ID: <CAF90-WgNpsT9dNZjQaPo18MjQCLUDieP+=8moNy0g81DRwkv0Q@mail.gmail.com>
References: <96359217-05e8-53e7-5700-14484043506d@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vtkVjuvR2b1nH/5KVSA6QnFco6u8+M0qecU/xygQF2g=;
        b=tKWlLlCouug3MvN9pTeryVGZpN17YCIeu9MikIYMT/CRtVvIWgVi4bVx/0GNtTH+GJ
         w/P45E2eXj6RRNRsGhGDaFvA9aOsTPjjc4ggcPmyLV1yQ6Am1mgbqcrwA+hpy6mhtAv2
         HS0Yt2PC8A1wYhLB2f3ckg0kctYDlykp/Qe+HqOC+q2XKxOBGt/EVYb+nGTKykvOZXFv
         tJmvZUPXjsqZ1m75Uit/aWDeOix8JHrHB1cOtIJpjXIl+jGTjwh35eFcfUzDKl3du3Xn
         UKwkPSnJUplbLfWBL8GFq27w0H9exRK+gjIi9ZT9UeLsXCYiGMDJwDpe7nOf/MtX0fPW
         wGmQ==
In-Reply-To: <96359217-05e8-53e7-5700-14484043506d@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Frank,

On Sat, Jan 30, 2021 at 6:37 PM Frank Myhr <fmyhr@fhmtech.com> wrote:
>
> Hi,
>
> The typeof concatenation supported by map since nftables 0.95 got me
> excited about using it to goto a chain based on incoming interface and
> requested service. There are some service requests I want to dnat, so I
> tried defining a vmap:
>
> table ip ip_nat {
>    map dnat_srv {
>      typeof        iifname . ip protocol . th dport : verdict
>    }
> }
>

Try this:

table ip ip_nat {
    map dnat_srv {
        type ifname . inet_proto . inet_service : verdict
    }
}
