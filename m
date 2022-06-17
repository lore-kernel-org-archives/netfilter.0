From: Gmail Support <testingforadept@gmail.com>
Subject: Re: Support for String Match Blocking in NFTables
Date: Fri, 17 Jun 2022 17:14:53 +0100
Message-ID: <CANKwiJX5_67uPPqdwoH3-gbY11Dmj29Hjse+8m3-bsJD0hHVEg@mail.gmail.com>
References: <CANKwiJVSW3RjhHDnziGjWenApAcvdSAqBTi7MfHqyiyHd4_F=A@mail.gmail.com>
 <20220616202014.e7ebc6df8f8f0f1fdce27e12@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4mhJxY5yQytGYhWbo0MHe6HhzxUw6DnD+T/pPHBlOn4=;
        b=eRP0qVg0DTTtAUdtx8NlYP7QmtT3d38fNund5GXqNU4rrTSCvG9pXKteVefUvhf6b0
         4OGZFsCcgrRgpiMxYNlAJafq0VAZilZ2PEVRps+heLPgFSSEfuBi9vuG/iTPo8HrbHwM
         rS7C8t3q3eZ3xbsHvMK0ZvcfcdaYfJKxH0p0oO4hh991y/zYlXaYmF+w00BAYbug0zr8
         qF2Ht9uOUWYFKlkY7EtrZxwhrfQ7kF04fao7msaFriKoQpNTPxgfvDG2Fsdnz/bzAca2
         ewB9Cwo9gq+fT59n8j6XMzMTlgJaoowBxiH0ypQwzWsXeIS+i8JpFdcyigsLbhmQhkpp
         ApKQ==
In-Reply-To: <20220616202014.e7ebc6df8f8f0f1fdce27e12@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

Okay thank you, is there any plans to support this extension in the future?

On Thu, Jun 16, 2022 at 8:20 PM Kerin Millar <kfm@plushkava.net> wrote:
>
> On Thu, 16 Jun 2022 10:15:55 +0100
> Gmail Support <testingforadept@gmail.com> wrote:
>
> > Hello,
> >
> > We recently migrated our servers from RedHat to Ubuntu based systems.
> > We used to have an IPtables rule that was blocking packets matching a
> > specific application file and below was the rule we had deployed.
> >
> > -A INPUT -p udp -m udp --dport 514 -m string --string
> > "someapplication.exe" --algo bm -j DROP
> >
> > In NFtables, I read in the blogs that string based blocking is not
> > possible. In the man page of Ubuntu, I see a note "The  string  type
> > is  used  to  for character strings. A string begins with an
> > alphabetic character (a-zA-Z) followed by zero or more alphanumeric
> > characters or the  characters  /, -, _ and .. In addition anything
> > enclosed in double quotes (") is recognized as a string."
> >
> > Can you please confirm if string based blocking is supported in Nftable=
s.
>
> There is no equivalent to the string extension in nftables. While it is p=
ossible to match against a portion of the packet's payload using a raw payl=
oad expression, doing so requires that the offset and length of the data be=
 specified. That is, it cannot search for a pattern and, thus, match at any=
 potential offset.
>
> --
> Kerin Millar
