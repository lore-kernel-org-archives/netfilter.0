From: =?UTF-8?Q?Niko_Kortstr=C3=B6m?= <niko.kortstrom@gmail.com>
Subject: Re: Fwd: IP daddr filtering not working for non-routable address
Date: Wed, 1 Sep 2021 19:31:05 +0300
Message-ID: <CADjU3L=iHW9-WB-J3rd-H2CYkU8abfNCAF0vrPHYszXdrQZatw@mail.gmail.com>
References: <CADjU3LmddfsRShNVx-hArmivM=iUGvEFg28Gd90qyg7VRGqvbw@mail.gmail.com>
 <CADjU3LkCskd4XSEWKX_WzWbwMmhd6hPhLT+zqGDE_-Ubch4V2Q@mail.gmail.com>
 <20210901110659.9cd84a2f7aa484bfe76a9a62@plushkava.net> <CADjU3LnN_uLqZ1LKJcjBCotv+OVJiL7v8xdsdt89_nxHOqHJjw@mail.gmail.com>
 <20210901122446.ff7367368ead217fd01996f0@plushkava.net> <CADjU3L=Q=rxK6Oy37SbN=ANXN6ig+rKdkZ_6iU+3j3AYkrY4sQ@mail.gmail.com>
 <20210901161307.fe9c7ca2ada8635ec0f7e301@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BloPRZJIC1BgjXdGMhCLo1xfY1YrrCH8wRUs4Ziiyho=;
        b=k1mOo/ylJSAAWB0pxwnEZs6jKx3NsH2buxo9aZEAkb1aFOXoLQXyX+30EDJ6vNx6wS
         y8NjWdLw7sAy+93mjf+MmcVGRNsJglb3RvuY+RLPPuN54PBDtgFft6XdHWH95O/wPLqP
         EJrwfCUcXCpI7sJ3hAQyl/FG3hcGtHFlFoyE7aMlvFbSB49waFqFbmr3lqvJb4y6SKox
         rGh5wUuNCrcHSPry125SB09SrQGZQtZYuxTMz1K/Svn3USoRYRXVj2LH8okB+Z47pUsB
         4MuY8mvfq9zKp4uJKYlu1jWjIwCASKyxdGat9hPsF73vmqk87a0xMRMcWnlJKdrqEBAs
         d9aw==
In-Reply-To: <20210901161307.fe9c7ca2ada8635ec0f7e301@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

Hi!

Thanks a lot! With this nft tracing we can see that the packets are
visible in prerouting but not in the forwarding chain, so they are
dropped in routing before reaching it. So we can either move filtering
to prerouting to count non-routable packets as well or just let them
silently fall off.


Niko Kortstr=C3=B6m

On Wed, Sep 1, 2021 at 6:13 PM Kerin Millar <kfm@plushkava.net> wrote:
>
> On Wed, 1 Sep 2021 16:59:44 +0300
> Niko Kortstr=C3=B6m <niko.kortstrom@gmail.com> wrote:
>
> > Hi
> >
> > Sorry on we're making some changes and changing the names, on target
> > ip-filtering has been changed to ecpri-ip-filtering. We're wondering ho=
w do
> > the packets filtered not increase counters past the accept rule if they=
 are
> > not accepted by it.
> >
> > # ip netns exec radions sysctl -a | grep '\.rp_filter'.
> > net.ipv4.conf.all.rp_filter =3D 2
> > net.ipv4.conf.default.rp_filter =3D 0
> > net.ipv4.conf.rfoe4.rp_filter =3D 0
> > net.ipv4.conf.rfoe4/295.rp_filter =3D 0
> >
> > No martians seem to be logged by the kernel.
>
> For them to be logged requires that net.ipv4.conf.*.log_martians be set t=
o a value of 1, where * is either "all" or the link name in question.
>
> Also, you could try adding something like this:-
>
> chain prerouting {
>         type filter hook prerouting priority raw; policy accept;
>         ip daddr 10.0.0.0/8 meta nftrace set 1
> }
>
> In the case that the packet is being processed by Netfilter, you may then=
 determine how it traverses your ruleset by executing "nft monitor trace".
>
> --
> Kerin Millar
