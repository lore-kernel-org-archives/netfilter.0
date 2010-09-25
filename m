From: Greg Oliver <oliver.greg@gmail.com>
Subject: Re: string and u32 modules
Date: Sat, 25 Sep 2010 13:12:50 -0500
Message-ID: <AANLkTim4g7nUd1PV=1Dnwybr=t_DVh4cT9iuZP6xESrO@mail.gmail.com>
References: <AANLkTin8Uvd7z0ty6urts2oy53mL=TCE0=r7O7g902HH@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Lx7Uy9OHBf10b+/WoaZOjnuetO4wWc7/CwsP8ugEZZg=;
        b=N9cXLnLQlxQm61dJ9QLxd6jHDXcwChXvVDsIeBT+2iTlFbrbUbnHmXJl/171YKAAHC
         cUVOCOJA51gH8lepwLd3KJ/VT1goHN2R4bfiKqWfsK5G9XqYfkoSBh1ioo7L1/th7G0u
         vcDvfuDB8WIQHT5st8L3mI3d4cEcG6mvpmBWo=
In-Reply-To: <AANLkTin8Uvd7z0ty6urts2oy53mL=TCE0=r7O7g902HH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Thu, Sep 23, 2010 at 7:52 PM, Greg Oliver <oliver.greg@gmail.com> wr=
ote:
> Hi,
>
> I am pretty new to iptables, but understand all of the concepts very
> well. =C2=A0I am trying to drop a specific RTP packet with a certain
> payload type (1st 2 bytes of payload will tell me in the rtp header).
>
> I compiled everything in centos and all appears to work (no =C2=A0err=
ors,
> etc when loading the module) from a system standpoint.
>
> The u32 module has made no matches for me though, and I cannot get th=
e
> string module to match hex strings. =C2=A0I plan to use u32, but trie=
d
> string just to see if I was an idiot :)
>
> I guess I am!
>
> I am using tcpreplay to send the packet I want to drop:
>
>
> 19:40:13.666679 IP ghost.29364 > ccs1.25862: UDP, length 13
> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000: =C2=A045b8 0029 95cd 0000 3d11 9c8=
6 c0a8 6476 =C2=A0E..)....=3D.....dv
> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0010: =C2=A0c0a8 64f1 72b4 6506 0015 bbc=
9 800d 9f6b =C2=A0..d.r.e........k
> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0020: =C2=A07c06 b562 a690 c613 6400 000=
0 0000 =C2=A0 =C2=A0 =C2=A0 |..b....d.....
>
> 800d is what I want to catch in bytes 27,28...
>
> LOG =C2=A0 =C2=A0 =C2=A0 =C2=A0all =C2=A0-- =C2=A0anywhere =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 anywhere =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0STRING
> match "|800d|" ALGO name bm TO 65535LOG level debug prefix `PT-13 :::
> '
>
> This string filter (which I now have wide open on --from and --to
> never catches it though. =C2=A0I cannot get u32 to catch anything tho=
ugh.
>
> My laptop runs *buntu, and I can successfully get u32 to match on
> specific IP, etc, but I cannot get it to match on this packet. =C2=A0=
I am
> using:
>
> -A INPUT -m u32 --u32 "0>>22&0x3C@6=3D0x800D" -j LOG --log-prefix "CN=
OISE: "
> -A INPUT -m u32 --u32 "26&0xFFFF=3D0x800D" -j LOG --log-prefix "CNOIS=
E: "

Not to answer my own question with another, but in desperation, I have
tried on 3 different setups now.  The latest 2 both have the xt_u32
module included with them, so I alleviated any issues that may have
been a result of my compilation/installation (unless both distros have
bugs).  I made an entry for almost all offsets after the IP header and
enabled them:

Table: filter
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1       51  3804 ACCEPT     tcp  --  *      *       0.0.0.0/0
  0.0.0.0/0           tcp dpt:22
2        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x14&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 20 : '
3        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x15&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 21 : '
4        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x16&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 22 : '
5        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x17&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 23 : '
6        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x18&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 24 : '
7        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x19&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 25 : '
8        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x1a&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 26 : '
9        0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x1b&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 27 : '
10       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x1c&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 28 : '
11       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x1d&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 29 : '
12       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x1e&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 30 : '
13       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x1f&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 31 : '
14       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x20&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 32 : '
15       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x21&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 33 : '
16       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x22&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 34 : '
17       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x23&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 35 : '
18       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x24&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 36 : '
19       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x25&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 37 : '
20       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x26&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 38 : '
21       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x27&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 39 : '
22       0     0 LOG        udp  --  *      *       0.0.0.0/0
  0.0.0.0/0           u32 0x28&0xffffff=3D0xd LOG flags 0 level 4 prefi=
x
`U32 Offset 40 : '
23     894 49430 ACCEPT     all  --  *      *       0.0.0.0/0
  0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1     1314 1841K ACCEPT     all  --  *      *       0.0.0.0/0
  0.0.0.0/0

Can anyone think of any reason these are not matching?  It is the same
packet I posted above.  It must be something quite simple (I hope)
that I am missing here.

Thanks!

> It never matches though.. =C2=A0And since I am unsure as to when 0 co=
unts
> and does not, I have tried starting form every byte in the area! =C2=A0=
:)
>
> I get no errors from the modules, but my hex-foo must suck, because I
> clearly cannot get this to work..
>
> Any pointers would be greatly appreciated..
>
> Oh - kernel 2.6.18, with iptables 1.3.5 (POM'ed from 20100811 snapsho=
t
> and recompiled)..
>
> Thanks for any pointers
>
> -Greg
>
> Thanks
>
> -Greg
>
