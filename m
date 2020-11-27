From: =?UTF-8?Q?Jean=2DS=C3=A9bastien_Frerot?= <jsfrerot@ludia.com>
Subject: Re: FTFW with multicast not working properly
Date: Fri, 27 Nov 2020 14:04:40 -0500
Message-ID: <CAP0dHez2k+4sYvidpqpyf4uRFRy+ZsQzWV2gsrmmKNsoTU+8XA@mail.gmail.com>
References: <CAP0dHewHgdndzpTWrmMfGfkrVukvmV9Luocs-qArZf5UeJepTA@mail.gmail.com>
 <20201127185752.GA24475@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ludia.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hXI9/ZzyHgxlkyjfIhCS1bdge/HaUegTMScjoE0a83o=;
        b=AdKsT9K+b30dF/u0hs7oGyCdFVMEFiITQ2xCoR5t35R7UqcKGYyt9m37GVgWEj0gO/
         FwR5eKd/WPPHrojsT7Fp1oIk87y/Dn03dUmfGj2vzz7cs/bqYBTVoxVRKtiIFNRpJMF+
         ZBCAzK3bqXEmqzK9z6xxgJ4eboNdJsONYru/g=
In-Reply-To: <20201127185752.GA24475@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Ok, I can understand if it's not working with more than 2 firewalls.
But it's not working with 2 !
The details I sent are only for 2 firewalls ATM.


Le ven. 27 nov. 2020, =C3=A0 13 h 57, Pablo Neira Ayuso
<pablo@netfilter.org> a =C3=A9crit :
>
> On Fri, Nov 27, 2020 at 11:56:22AM -0500, Jean-S=C3=A9bastien Frerot wrot=
e:
> > Hi, I'm trying to set up conntrackd in FTFW mode with the multicast pro=
tocol.
> > The problem I'm having is that my BACKUP firewall is not getting the
> > states as it's supposed to.
> > It's receiving the packets (confirmed by a tcpdump), but only a few
> > states are replicated, even when I used the '-B' option to resend all
> > the states to the slaves.
> >
> > If I configure it to use unicast UPD, all is working fine.
> > I was hoping to use multicast so I can migrate my current active
> > firewalls, to a new pair of firewalls. But for this to work, I need to
> > sync the states to all my 4 firewalls.
>
> FT-FW only works with 2 firewalls. For more than 2 firewalls, please
> try NOTRACK mode.
>
> FT-FW would need to be extended to support more than 2 firewalls, by
> adding some sort of node ID and independent retransmissions queues for
> each firewall in the cluster.



--=20
Jean-S=C3=A9bastien Frerot
Senior Linux System Administrator
jsfrerot@ludia.com



410 St.Nicolas, suite 400
Montr=C3=A9al, QC H2Y 2P5
www.ludia.com
