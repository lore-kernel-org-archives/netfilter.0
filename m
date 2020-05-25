From: "ad^2" <adsquaired@gmail.com>
Subject: Re: Raw Expression for DNS name?
Date: Mon, 25 May 2020 09:56:47 -0400
Message-ID: <CAPdGaa34jj1+S_o7nc5k3f8frFZGSo=-m57B01ULV63AjccEtg@mail.gmail.com>
References: <CAPdGaa3XsTm1rjUFjUoqKG=fO+9w+xOWvxTuQRL8D+3QXk73fA@mail.gmail.com>
 <198ba667-0ebc-ba8b-bbb1-6faf095cbcc7@thelounge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/QtemtpbWu7FKIhKRUtDfGI3t5SYnoqjHRA6rAtd9GE=;
        b=QyxY3VmmfeJRs8Zp000tQLZb2dieE0VWJwC4fOjYKc4HsEjDlGw0Mp/w/2Qy4wBqe+
         O27DAKltTJsw6BO+YKz/7UKhFc5GHmNcQuwOy4CZ3C6p3GB+R5hg8qtl+EugJh2I4EfJ
         290MYEhB1zxcc8Xi9Ygm4/FU+WdemhOCCA0LmoXGoPoeWvchTaTy5aJtsE0xGHZnZJXG
         Kn5mJjS5pAhArLHnTBTGGMnoB+acvMUS1UfCTR/ngPsoLDwRFFOBf5svk5YZJP1exBlY
         uskImGIEh/Sdarx5RJ7zx0ijdZGqhlvp72vVLfOgHQkIOInjR0XQIIVWiJ/Yi1uvD/5n
         6L/w==
In-Reply-To: <198ba667-0ebc-ba8b-bbb1-6faf095cbcc7@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

Terrible or not is besides the point. There are numerous occasions
where people have used software features to design unique products for
special circumstances.

If the software allows it then it should work. If it does not then I
would like to know.

Thanks.



On Sun, May 24, 2020 at 9:44 PM Reindl Harald <h.reindl@thelounge.net> wrote:
>
>
>
> Am 25.05.20 um 03:02 schrieb ad^2:
> > Does anyone have examples showing the use of a raw expression to
> > filter DNS domain name information?
> >
> > I'm trying to DNAT a packet to a specific DNS server's IP address when
> > the domain name in the query is a match.
> >
> > Ex. if the domain in the query is yahoo.com then redirect to 8.8.8.8
> >
> > I am not sure on the hex syntax.
> >
> > What is not working:
> >
> >     add rule mytable prerouting meta l4proto udp udp dport 53
> > @th,160,120 0x057961686f6f03636f6d00 dnat 8.8.8.8
> >
> > and
> >
> > add rule mytable prerouting meta l4proto udp udp dport 53 @th,160,120
> > 0x057961686f6f03636f6d dnat 8.8.8.8
> >
> > I used the hex values directly from the packet capture.
>
> a terrible idea to even consider on netfilter level
>
> that has to be done on the dns resolver and the only job of netfilter is
> forbid outside nameservers at all
