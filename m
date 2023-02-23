From: Mathew Heard <mat999@gmail.com>
Subject: Re: ipset: update timeout when IP matches
Date: Thu, 23 Feb 2023 23:04:57 +1100
Message-ID: <CAE5sJtT0xRMUHRoa3aSAvn=dpwMSdGfoGXUJK5UHORKjLDeY8g@mail.gmail.com>
References: <f326e979-1506-1685-6858-8a1d9746cb93@gmx.ch> <20230223113406.ac79681eb436e15c44b0a6a2@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvscq91/qyhIUfMHoN6CbnIfeFCWVyTCmy95RJvRlLc=;
        b=Loadr5vBP/X3NdMQbGg7svhUjClIYNAOu+6SCJAC28N9RROu/l5SuChQnVLNh/a1C6
         mSplZzX9E8uehivyzTESs8IwdK83h5ZD+kfKjhzVcTpWP1NOUhvr2PTMETuf3AFLEEPu
         ngbr3judagK1l2JPvt1/ahlVb1tANoZSygsmfkawAyDHAxVWUsv8MBL8vx+2w3pPJtZ0
         stETP4LAQnzfbTfm67ySGmwO+wDRMjEQUbgYAUspuDnq/xP8/hY8pgdg5okaSNEwVAf8
         iUJN/WoWMCp5dyl8teDcH9+6jOnqsPBAa5kkw37NCZpvIPYW4T3FzwyPcX+s8u80UBt3
         bwxg==
In-Reply-To: <20230223113406.ac79681eb436e15c44b0a6a2@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

We built a module for that for our usage (it's open source too).

https://github.com/splitice/xt_setset

On Thu, 23 Feb 2023, 10:34 pm Kerin Millar, <kfm@plushkava.net> wrote:
>
> On Thu, 23 Feb 2023 12:04:44 +0100
> Fourhundred Thecat <400thecat@gmx.ch> wrote:
>
> > Hello,
> >
> > I have an ipset named "PORTSCAN".
> >
> > I allow traffic to legitimate ports, but if any IP tries to access
> > (scan) any other port, I add it to PORTSCAN.
> >
> > The purpose is to protect my hidden services, here in this example
> > listening on 22222:
> >
> >
> >    -A INPUT -m set --match-set PORTSCAN src -j DROP
> >    ...
> >    -A INPUT -p tcp -m tcp --dport 22222 -j ACCEPT
> >    ...
> >    -A INPUT -j SET --add-set PORTSCAN src --timeout 3600
> >
> >
> > So, now when IP is alredy in PORTSCAN, in addition to DROP, I need to
> > update the timeout (reset to 3600 again), so that if IP continuously
> > tries to scan me, the timeout gets constantly extended/reset.
> >
> > This was possible when I was using the "-m recent" module:
> >
> >    -A INPUT -m recent --rsource --name GREYLIST --seconds 3600 --update
> > -j DROP
> >
> > how can I update the timeout of IP in ipset?
>
> The following option is detailed by iptables-extensions(8).
>
> --exist
>        when adding an entry if it already  exists,  reset  the  timeout
>        value  to the specified one or to the default from the set defi=E2=
=80=90
>        nition
>
> --
> Kerin Millar
