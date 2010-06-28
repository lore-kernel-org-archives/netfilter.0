From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: nat bypass
Date: Mon, 28 Jun 2010 20:49:50 +0300
Message-ID: <AANLkTinxapgkJ0pc8RdrPJ2Mikmn0H4JpdMYgeP4Dwvb@mail.gmail.com>
References: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=oe8k8THfYVpiHg/2HawIrfzY90+gXezYOc4eU3gon2w=;
        b=wa5V0TVCQNidZ+V7h1dODM5dImGJ9wnXwGlyK6ilGTo0vrx2BGpo+ZqbkEB2dFPveS
         y78npy600B9/36uj2LJ67VLL85BQ4PEeTWJpZx+cMBiVR0URTUGWYkrIw47yDYjz2+fg
         Jvc/DJplwY9JI6opiLl6sCJqX1IEAmA3dB4Ds=
In-Reply-To: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2010/6/28 ratheesh k <ratheesh.ksz@gmail.com>:
> Hi,
>
> =A0A -------> R ------->S
>
> I have a linux machine A is connected to Linux machine R . Machine R
> is having two network interfaces and acting as a router .
> It has a dhcp server running =A0. It will assign ip in 192.168.1.0/24
> subnet to all machine connected on lan side ( A is connected also in
> lan side ) . Wan side of R is connected to HTTP server S . There is
> also a DHCP server running on S to assign ip in 10.232.18.0/24 subnet
> . =A0Is there any way , in which NAT should be bypassed to get ip fro=
m
> DHCP server running =A0on S . My question is : How can A will get =A0=
an ip
> from 10.232.18.0/24 pool ip .?
> ebtables is an option ? How can we make it ?
> Is there any other optimal way ?
>

Suppose you achieve your goal and A got an IP from S pool.
But there appear another problem - what about routing?
Presumably you should track leased IP and dynamically bridge packets
to/from it - and it looks rather complicated.

--=20
Best regards
Anatoly Muliarski
