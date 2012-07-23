From: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>
Subject: Re: per host accounting
Date: Mon, 23 Jul 2012 15:27:08 -0700
Message-ID: <CAJygYd2f0P7kJmVtAcPEJ+oSpSfqVtYN4ksWw4qqe7=_ELdg6w@mail.gmail.com>
References: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
 <1343030447.12730.5.camel@tiger.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=u7ydNwWl6DWNj1S97KmOqQ20U6URl3uXxIwlyL8+JUQ=;
        b=ydP+9StNK9uBM/3s0YBeQ7UTZrKX29jRrNwUn/R1Vog45IZ4wnUn2zhvaSgenGlZh7
         BRMfNu5J0/1acw6o684NSDHdOydl1hJ6J3BSxzdo3G/bhx7qL48IUWdzVB+hFaxN5Cnb
         lRHnQVNSFluxvVgXt5i/IheAhVJDbaGwl6UwYUoF1AzBlOzFrJEd54SQEUzDruwVWApP
         nrl7CuiOZJvBO46yyksiQmG3il8dMHjGbxeEY9ZMAwLGJV/QTMIDsJjOi6EUYCPtXVIV
         GyG+4qrm0mWk/lFLImuc9XoFBbXys5R2QOSuiWSovyB6Ea1+Oxo//xl1exxkHNEIsCBN
         +2Hg==
In-Reply-To: <1343030447.12730.5.camel@tiger.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

Thanks for the reply, Yeah I'm aware all of that you have mentioned,
please allow me to elaborate my requirements a little more.

I have about 500 IPs behind a router, and I want have something on my
router to monitor the ingress bps/pps to each specific IP. And I would
like to have a cron job  that scans the result and find the top 5  IP
with most bps/pps and also do some action against it, calling a
script, sending a email etc.

So, It seems none of the existing stuff allows me to do this,  the
easiest brain-dead solution I can think of is to just create a chain
with 500 rules in it, and have a cron job to cacluate the bytes
difference every time it executes. Obviously, this  will introduce a
lot of delays, I'm hoping to have something that basically don't
affect performance too much and or something to just generates a table
of ip  / accumulative packets / accumulative bytes, and I will be able
to work with that.

On Mon, Jul 23, 2012 at 1:00 AM, Eric Leblond <eric@regit.org> wrote:
>
> Hello,
>
> Le dimanche 22 juillet 2012 =C3=A0 20:22 -0700, Yucong Sun (=E5=8F=B6=
=E9=9B=A8=E9=A3=9E) a =C3=A9crit :
> > Hi,
> >
> > I need a way to account traffic (bytes) for ~500 ips (fixed),  and =
it
> > seems creating a plain 500 rules will affect the performance a lot.
> > Without implement layered rule (like a binary search?) , is there
> > something existing to do automatic hashing?
> > Things like hashlimit is great, but I don't need limit matching
> > function, just a way to create a hashtable and count bytes and
> > packets.
> >
> > If there's none, I suppose it would easy enough to fork some hashli=
mit
> > code to do this.
>
> You can have a look at how ulogd2 and nfacct can be used for accounti=
ng:
> https://home.regit.org/2012/07/flow-accounting-with-netfilter-and-ulo=
gd2/
>
> BR,
> --
> Eric Leblond
> Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/
