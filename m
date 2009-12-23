From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: Re: IPTABLES and NATTING
Date: Wed, 23 Dec 2009 11:31:34 +0530
Message-ID: <5f765be60912222201j2c836482kcd5e3326c03b1358@mail.gmail.com>
References: <5f765be60912222021y5de642a4u785aecf0476a2c29@mail.gmail.com>
	 <23731b2b0912222115y11417feua2eab5787197d1eb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=xjINreTx+2/w6uLbbR+qsxHapCf3OWsY/ziKkL143wY=;
        b=UA2MWtr+oY9Opu+Ddl8f3CTMpm4902nXvY2HCelB7C0KywTRD1wR3VYX52vlkSEo/G
         53/1QVxa4RZi6cQU5BEaNjB7iO1mfcax2d8CRNJzve+WTD6kNIYjd4LyGIFONmzgmqvg
         bHJkQs15RqPU6TGZVvYmdHkxz6Wz+ZeY91TQE=
In-Reply-To: <23731b2b0912222115y11417feua2eab5787197d1eb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pieter Smit <mlist2010@vigor.co.za>
Cc: netfilter@vger.kernel.org

Hi

Sorry I have some changes in my question as I am confused initially.

                     linuxbox (p.q.r.t)
                            |
                            |
INTERNAL  ------ ABCD ----- INTERNET
 (p.q.r.s)                               (m.n.o.k)

ABCD has 3 interfaces connected to linuxbox, INTERNAL N/W, INTERNET.

I am able to ping from INTERNAL to linuxbox. So there is a path
available in routing table.

At present I am snatting the packets from linuxbox to INTERNET at
ABCD. I have a small doubt regarding the FTP from linuxbox since I
have to support ftp from linuxbox to both INTERNAL N/W as well as in
INTERNET.

How can I right a rule in iptables present in ABCD where it can decide
if the destination ip-address of ftp server is within INTERNAL N/W or
in INTERNET and do natting accordingly.

On 12/23/09, Pieter Smit <mlist2010@vigor.co.za> wrote:
> Can the internal network ping the Linux box ? (is the routing working)
>
> On Wed, Dec 23, 2009 at 6:21 AM, Ajith Adapa <adapa.ajith@gmail.com> wrote:
> > Hi
> >
> > Below is my network setup.
> >
> >                       linuxbox
> >                            |
> >                            |
> >  INTERNAL  ------ ABCD ----- INTERNET
> > (p.q.r.s)                               (m.n.o.k)
> >
> > ABCD has 3 N/W interfaces connected to linuxbox, INTERNAL N/W, INTERNET.
> >
> > Linuxbox has a private-address and it is not in the same subnet as
> > INTERNAL N/W. I have to do snat packets from linuxbox to INTERNAL N/W
> > or to INTERNET at ABCD.
> >
> > I have a small doubt regarding the FTP from linuxbox since I have to
> > support ftp from linuxbox to both INTERNAL N/W as well as INTERNET.
> >
> > How can I right a rule in iptables present in ABCD where it can decide
> > if the destination ip-address of ftp server is within INTERNAL N/W or
> > in INTERNET and do natting accordingly.
> >
> > --
> > Thanks,
> >
> > Ajith
> > ---------------------------------------------
> > www.codingfreak.blogspot.com
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>


-- 
Thanks & Regards

Ajith
---------------------------------------------
www.codingfreak.blogspot.com
