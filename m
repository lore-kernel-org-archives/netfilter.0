From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Mon, 2 Jan 2012 10:00:23 +0100
Message-ID: <CAKywjPprq497Ox7hZRMXNApC24nkm4syEbrAkX02N-QOPBpKiA@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
 <op.v7fekow7x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=iyZNUGk7njdO72KkywupNEWYc5tqyYc5l3tHUomiW0k=;
        b=E5oavspIf2SxqPPyPksnS6D7PfHOIL0/9e0M13Svnntv8PcPlJt0abGDQORVuFFsia
         I54zSV+BxVyIT2BDD7mM7rj5Q+305rqm3Ex0eWiZ4UMzX2ukqd6sNIS49QX2bNwCRgED
         0dyG99Q0+dlhsjfM86HwIc2d05RZSy5QmGCaQ=
In-Reply-To: <op.v7fekow7x1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

> So, I understand you are setting up 3-8 mail servers that will send o=
ut bulk
> email for 1600 hosts, so that the sender IP in the mails will have yo=
ur 3-8
> "reputable" IPs rather than one of the 1600 "unknown" IPs.
>
> This would not be a regular email relay, since that would put the sen=
der IP
> in the mail headers. =C2=A0Are you thinking to use NAT to try to hide=
 the sender
> IP? That's not the way to do it.
>
> Frankly, this looks to me like bulk-email-laundering. =C2=A0That is, =
it's a way
> to convey email "reputation" from one of 3-8 "trusted" IPs to the 160=
0
> "unknown" ones.
>
> Sorry, a have a personal issue with spam, and anything that could be =
used
> (if not by you, then by someone else) to get spam delivered. I think =
the
> email reputation of a public IP address should be earned, and it *sho=
uld*
> take time to earn it.

No, you misunderstand. (At least with IPv4) Reputation ~=3D IP. The goa=
l
is 1 client =3D (at least) 1 IP. Reputation DOES take time to build up,
and the best way to build it up is by sending relevant, permissioned
newsletters from an IP that is used by only ONE client. We agree, this
is how it should be. But lots of clients =3D lots of IPs...
But this is *WAY* OT...
A
