From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Rules
Date: Mon, 21 Jun 2021 18:41:24 -0400
Message-ID: <CANf9dFMU7Bw+Hrz+c9wOKFNU=p=tWybwCHOgERMX_YxpUSpYTQ@mail.gmail.com>
References: <d72262d1-261c-f827-7c2d-420a6746a06c.ref@att.net>
 <d72262d1-261c-f827-7c2d-420a6746a06c@att.net> <CANf9dFOpUOcDuUbSu_hpgu386032iUoAa+_+NBA57FF4_n+E-Q@mail.gmail.com>
 <59ec8b34-5e6e-0288-100c-3a6fd40ecc20@att.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9IS5L2henicV9CKs6DUgEOMTO0sEHkDPVCP0OYTqoAE=;
        b=NbFL46vK834zSL5idyLOSkshA+eJtDidvMK8/hOSor+8sv+TnusSHkqyqzoftxXY7g
         YgfBzg72Ro5fSM9iO5ERQWPe2dDnMKoIphSkRMhpWAjZ1QZrxe7e6+9jepiJ29ujEEyn
         KoBZimgLs1Y/Wae6Quivb14a+6tBFeWDigxIMAzt0gHNW8VexCu3d2Zd7mOdI2nM0U1a
         FO/drVO2R99CHzKrvrBpapbKZ9KHH7gdezSL357YQByLFD2sQuZtoWnVReB9wpndG3tw
         8X1moJ7MkaB35U2aFDWTfFu2562lrrt54mYDXjv+uIfdnT43+8qyczuqcltr5Gr/uVQo
         r3SQ==
In-Reply-To: <59ec8b34-5e6e-0288-100c-3a6fd40ecc20@att.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: slow_speed@att.net
Cc: david@hajes.org, netfilter@vger.kernel.org

Yes, it only tells you *if* rules were created in either, not *what*
created them. Many services on a given Linux distro could create rules
in either iptables or nftables: Docker, Kubernetes, firewalld, etc.
Someone more knowledgeable than me might know if there's a way to tell
what these systems use aside from looking at the iptables/nftables
rules and deducing what service creates them, or reading up on the
service itself and trying to find documentation where this is stated.

-Martin

On Mon, Jun 21, 2021 at 6:17 PM <slow_speed@att.net> wrote:
>
> So those commands verify if one or the other is being used; not if the
> services exist.  Correct?
>
> On 6/21/21 5:12 PM, Martin Gignac wrote:
> >> How can a user tell if the system is using nftables or iptables?
> > You can check if you have iptables rules defined with "iptables -nvL",
> > and check if you have nftables rules defined with "nft list ruleset".
> >
> > -Martin
>
>
