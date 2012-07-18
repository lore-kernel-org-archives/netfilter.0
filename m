From: kay <kay.diam@gmail.com>
Subject: Re: conntrackd and TCP flow recovery
Date: Wed, 18 Jul 2012 18:13:55 +0400
Message-ID: <CANaOhebE4yvW5wjecC-222hkMBJz042JmYsR9=Xv6xLH8Z0acQ@mail.gmail.com>
References: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com>
 <515168F006F2D643952F8FFD24F2E073016D566704@sonne2.gw.bringe.net>
 <CANaOheYxQb0QC4g1VbWYNtv_uc8-TE0qmxv8BFp1Kp3p4KEq7Q@mail.gmail.com> <CAJygYd1uK29fk0LRtEMUZ5keRnXGMFpRU0G9fQcTPk+tRmC40A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=6cNuQwarZTYbazSZWimDKE5VaynT2BPzmJ9nuuyE/88=;
        b=vzDiyBJq7GbXaWwKpgB9AEvvsevFyprI1e9wgASMJR2F7mjCm3z62hO/pKlnOWXOGA
         2tkJYRKMiohYbugP/TuXbZ03vxXvX6RZ3tLH9DGiBQdt27iJnKTtedJSqK49mrSMZSnJ
         r9IyXdBlWzxGZ5znXxXJWPPZTuZpE/gMgY97x114XK+Lv/hlPBgw3ooPMDu3c+fD4qpj
         Gwl5FWGh1hbv46lx0VdNus+oEawbtjbzvnU5PBG1iOjybMy/bgoScgGR1EeG39vqv13G
         Q2LL4H6AVcbb0S/qYvMHTKj+ZNCFTW1TrlzG/vJEQ99D6wlnKo0vs6Y2E0v/5EcsB1lv
         zK1w==
In-Reply-To: <CAJygYd1uK29fk0LRtEMUZ5keRnXGMFpRU0G9fQcTPk+tRmC40A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

IPVS and etc can't send handshake packet to one server and rest
packets to second one. At least I was not able even change server in
keep-alive HTTP connections, I had to Ctrl+R in Firefox to change
server.

2012/7/18 Yucong Sun (=E5=8F=B6=E9=9B=A8=E9=A3=9E) <sunyucong@gmail.com=
>:
> I know what you mean, and I said in my email , this is what I see mos=
t
> close to it.
>
> http://dragon.linux-vs.org/~dragonfly/htm/tcpha.htm
