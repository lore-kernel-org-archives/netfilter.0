From: =?UTF-8?Q?Jean=2DS=C3=A9bastien_Frerot?= <jsfrerot@ludia.com>
Subject: Re: FTFW with multicast not working properly
Date: Mon, 7 Dec 2020 09:03:50 -0500
Message-ID: <CAP0dHezxi+70e0CRm63HmCRRknn+x4SFTMJTeDnOuqDBvcfcMw@mail.gmail.com>
References: <CAP0dHewHgdndzpTWrmMfGfkrVukvmV9Luocs-qArZf5UeJepTA@mail.gmail.com>
 <20201127185752.GA24475@salvia> <CAP0dHez2k+4sYvidpqpyf4uRFRy+ZsQzWV2gsrmmKNsoTU+8XA@mail.gmail.com>
 <CAP0dHewpLo8thdjK1Qk+VofwCHK-CkjhSLrEUX-qohHCy6Zv6g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ludia.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gbya9wabGgu/R01PO4glSJKnEcp4x4l7L7UHCPGsJgg=;
        b=lXmS+dJ8QGrSBsIPNklOfkPrhem4ptFzOmZtPcDMB7mkwT672C5LIqcomm7W4sgnk5
         cAi9XRy+pkM7ojN7YjVec2n+F5JIQTrUSN3Rx6c3eKI8IINks/TWy9a3bv+cjUIpxOR5
         wws7WLnIaRnx43qrpzwaDh+s0C+ZDktzq4Y+A=
In-Reply-To: <CAP0dHewpLo8thdjK1Qk+VofwCHK-CkjhSLrEUX-qohHCy6Zv6g@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

And what I see after the weekend:
allocated queue nodes:       131072

queue txqueue:
current elements:            0
maximum elements:   2147483647
not enough space errors:            0

queue errorq:
current elements:            0
maximum elements:          128
not enough space errors:            0

queue rsqueue:
current elements:       131072
maximum elements:       131072
not enough space errors:       109663


Le ven. 4 d=C3=A9c. 2020, =C3=A0 13 h 21, Jean-S=C3=A9bastien Frerot
<jsfrerot@ludia.com> a =C3=A9crit :
>
> After further investigation, it seems this is not only related to
> multicast, but also with unicast udp packets.
> So I have moved on to my new firewalls under ubuntu server 20.04 with
> conntrackd 1.4.5.
> I added the "StartupResync on" and The initial states are getting in
> the backup firewall. But all state changes are not updated.
>
> I noticed the rsqueue "current elements" is rising constantly.
> # conntrackd -s queue
> allocated queue nodes:            0
>
> queue txqueue:
> current elements:            0
> maximum elements:   2147483647
> not enough space errors:            0
>
> queue errorq:
> current elements:            0
> maximum elements:          128
> not enough space errors:            0
>
> queue rsqueue:
> current elements:         5863
> maximum elements:       131072
> not enough space errors:            0
>
> Any idea what could cause this?
>
> Thank you.
>
> Le ven. 27 nov. 2020, =C3=A0 14 h 04, Jean-S=C3=A9bastien Frerot
> <jsfrerot@ludia.com> a =C3=A9crit :
> >
> > Ok, I can understand if it's not working with more than 2 firewalls.
> > But it's not working with 2 !
> > The details I sent are only for 2 firewalls ATM.
> >
> >
> > Le ven. 27 nov. 2020, =C3=A0 13 h 57, Pablo Neira Ayuso
> > <pablo@netfilter.org> a =C3=A9crit :
> > >
> > > On Fri, Nov 27, 2020 at 11:56:22AM -0500, Jean-S=C3=A9bastien Frerot =
wrote:
> > > > Hi, I'm trying to set up conntrackd in FTFW mode with the multicast=
 protocol.
> > > > The problem I'm having is that my BACKUP firewall is not getting th=
e
> > > > states as it's supposed to.
> > > > It's receiving the packets (confirmed by a tcpdump), but only a few
> > > > states are replicated, even when I used the '-B' option to resend a=
ll
> > > > the states to the slaves.
> > > >
> > > > If I configure it to use unicast UPD, all is working fine.
> > > > I was hoping to use multicast so I can migrate my current active
> > > > firewalls, to a new pair of firewalls. But for this to work, I need=
 to
> > > > sync the states to all my 4 firewalls.
> > >
> > > FT-FW only works with 2 firewalls. For more than 2 firewalls, please
> > > try NOTRACK mode.
> > >
> > > FT-FW would need to be extended to support more than 2 firewalls, by
> > > adding some sort of node ID and independent retransmissions queues fo=
r
> > > each firewall in the cluster.
