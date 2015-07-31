From: Vitaly Repin <vitaly_repin@fsfe.org>
Subject: Re: SNAT and connection tracker: should established connections be
 dropped when a rule is removed from nat table?
Date: Fri, 31 Jul 2015 13:31:47 +0300
Message-ID: <CAH+_UjV=_dGtUk5D=EnFB2YNeDvDO8GNwu6sMk2=Ci0VpPyTkw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=YaB5izBrM3Rb1A5K0Aig3NfZTFAkyAc1NqOqF16ys0Q=;
        b=EEfixAOGg/lR43E83sY+DSfY2OFlWPxS2Vu6nUSPgbOgHFzyuRefh+EZRa8jH/Y4rm
         AOXfyRMjvVRiJKkQh8J4yK7UQPE4jtlgPsC0u44nltaNMT6VJ8/kg8ZzTFCJaPa2Ujjy
         G4TbQdjWRukVuM3bVsf/iu+RlMNu8WmI6nswuUj858qfXmCR/HTu6EVLcj3QWsufKKGR
         xcCqkdUKsp6uiYR4WNvrEgeBn/UWnBrOWP3+HC6ITyN538BM0Fu+s17KRfH+vqXj6TYZ
         AFzvEU0eKBEvZqEWo+QY53u9ZBa4XBRPowClSJbC2zzQ2s71CAKJNRa9oi9iJG2mdY4r
         sRCQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

I've described complete solution implemented:
http://vrepin.org/vr/IPsec-PacketLeakage/

Hopefully, it can be useful for others facing similar problems.

2015-07-10 19:29 GMT+03:00 Noel Kuntze <noel@familie-kuntze.de>:
> Hello Vitaly,
>
> Create a drop rule in *filter FORWARD, that drops incoming
> packets for SNATed IPs without a matching policy
>
> - -A FORWARD -m ipset --set snatedIPs dst -m policy --pol none --dir =
out -j DROP
>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
> Noel Kuntze
>
> Am 10.07.2015 um 18:26 schrieb Vitaly Repin:
> > Hello,
> >
> > I need am advice on SNAT.
> >
> > There is SNAT setup where my clients connected through ipsec. Whene=
ver
> > new connection appears, SNAT rule for respective IP is created.
> > Whenever client disconnects, corresponding SNAT rule is dropped.
> >
> > In general it works, but this schema leads to the packets leakage t=
hrough NIC:
> >
> > 1) IPSEC client disconnects
> > 2) Rule for this client is deleted from the nat table
> > 3) But incoming messages (from remote servers) for already establis=
hed
> > connections are continuing to come! They are "de-NATed" regardless =
of
> > the fact the rule does not exist anymore.
> > 4) They come to xfrm subsystem which does not take them (as no SA
> > associated with this IP exists)
> > 5) As a result these packets (addressed to the private addresses) a=
re
> > appearing on the eth0 interface
> >
> > As of now my solution is to drop these packets using ebtables. But =
I
> > am still not sure it's an optimal one.
> >
> > So, my questions:
> >
> > - Do I understand it right that when SNAT rule is deleted from the =
nat
> > table, it does not mean that already established connections are
> > stopped from being tracked? And the they are continuing to flow usi=
ng
> > the rule which was assigned to them at the moment when correspondin=
g
> > connection was created?  Can this behavior be changed?
> > - Any idea how can current schema be improved?   The first option I
> > see is to be able to stop SNATting of the connections for which the
> > rule was deleted. In theory I can do it even from userland. The sec=
ond
> > option is to ask xfrm to drop all the packets from specific network=
 if
> > there no SA for dest IP address of the packet (sounds weird).
> >
> > Thanks in advance!

--=20
WBR & WBW, Vitaly
