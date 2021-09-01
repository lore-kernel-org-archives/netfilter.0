From: =?UTF-8?Q?Niko_Kortstr=C3=B6m?= <niko.kortstrom@gmail.com>
Subject: Re: Fwd: IP daddr filtering not working for non-routable address
Date: Wed, 1 Sep 2021 17:59:13 +0300
Message-ID: <CADjU3L=hxwj5=Oe4jBprzV5Erpvbgbw+n9SoeQDmt+Bfy2oZNg@mail.gmail.com>
References: <CADjU3LmddfsRShNVx-hArmivM=iUGvEFg28Gd90qyg7VRGqvbw@mail.gmail.com>
 <CADjU3LkCskd4XSEWKX_WzWbwMmhd6hPhLT+zqGDE_-Ubch4V2Q@mail.gmail.com>
 <20210901110659.9cd84a2f7aa484bfe76a9a62@plushkava.net> <CADjU3LnN_uLqZ1LKJcjBCotv+OVJiL7v8xdsdt89_nxHOqHJjw@mail.gmail.com>
 <20210901122446.ff7367368ead217fd01996f0@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OzwhmRUs0hJ1RqQEwD4eQZXzv2clMLmJi37I0n0Qy1c=;
        b=YdBSRhprexxkQbfr9Idhmmw6SnRobEXWLSp28fd7nApp2Q3Xf4b8hwQUe8rLrNt+Oo
         dZKWiZAUOmOj2DceSjmlr7XxPOjI92B1Bt3aaEgFBjbrSRyNsgs6fDacxW8Vj/btwG6E
         lEAavo2bIyq8hIAbQD5UPjHXMmSJng6+yZwMw9kkLbEI2vRoNJWLWlbMTIxMTprjBYci
         j/I8g9V8xTzvIvkpvGgLUjQ+ueUuW1v4KCPBkMDKNK0Uh1alnu185e/IfNguwXcuuxQb
         0W+EbaW92mjEJil1tPYtemyLA6ed9sBjIFTtrc4CG4Ht17RqFjOCx1f0F1FTNmclfOvJ
         TEPQ==
In-Reply-To: <20210901122446.ff7367368ead217fd01996f0@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

Hi

Sorry on we're making some changes and changing the names, on target
ip-filtering has been changed to ecpri-ip-filtering. We're wondering
how do the packets filtered not increase counters past the accept rule
if they are not accepted by it.

# ip netns exec radions sysctl -a | grep '\.rp_filter'.
net.ipv4.conf.all.rp_filter =3D 2
net.ipv4.conf.default.rp_filter =3D 0
net.ipv4.conf.rfoe4.rp_filter =3D 0
net.ipv4.conf.rfoe4/295.rp_filter =3D 0

No martians seem to be logged by the kernel.


Niko Kortstr=C3=B6m


On Wed, Sep 1, 2021 at 2:24 PM Kerin Millar <kfm@plushkava.net> wrote:
>
> On Wed, 1 Sep 2021 13:54:51 +0300
> Niko Kortstr=C3=B6m <niko.kortstrom@gmail.com> wrote:
>
> > Hi
> >
> > Sorry on we're making some changes and changing the names, on target
> > ip-filtering has been changed to ecpri-ip-filtering. How do the packets
> > filtered not increase counters past the accept rule if they are not
> > accepted by it?
>
> One possibility is that the packet is being considered as a martian as a =
consequence of reverse path filtering (RFC 3704). In that case, the packet =
would not be processed by Netfilter at all. You can check the status of the=
 filter(s) by running sysctl -a | grep '\.rp_filter'.
>
> --
> Kerin Millar
