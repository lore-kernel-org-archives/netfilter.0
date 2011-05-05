From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: Re: WAN balancing
Date: Thu, 5 May 2011 10:40:04 -0400
Message-ID: <201105051040.05671.dyioulos@firstbhph.com>
References: <201105050901.26651.dyioulos@firstbhph.com> <BANLkTimSEUh3S70QiqE1-g_r1dZJ75jfmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimSEUh3S70QiqE1-g_r1dZJ75jfmA@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: "DiCecca, Caitlin" <cdicecca@firstbhph.com>

If I may, the how-to you've pointed out has to do=20
with routing which, of course, is important.  Are=20
there any changes/additions I need to make to my=20
iptables ruleset, as well?

Best,

Dimitri


On Thursday 05 May 2011 9:34:46 am Matty Sarro=20
wrote:
> http://lartc.org/howto/lartc.rpdb.multiple-link
>s.html
>
> That should help.
>
> On Thu, May 5, 2011 at 9:01 AM, Dimitri Yioulos=20
<dyioulos@firstbhph.com> wrote:
> > Good morning, all.
> >
> > I've searched for a clear guide on setting up
> > my iptables/Netfilter firewall/router to do
> > WAN balancing. =C2=A0I have two providers - one is
> > T1 and the other broadband). =C2=A0Currently, I'm
> > using the T1 provider to send and receive
> > traffic on. =C2=A0I'd like to use both.
> >
> > I have one LAN interface, one WAN interface,
> > and one DMZ interface. =C2=A0The DMZ utilizes
> > several virtual interfaces. =C2=A0I can easily add
> > a fourth physical NIC. =C2=A0Beyond this, I'm not
> > sure what other information I can provide,
> > but I'm happy to do so.
> >
> > Your help would be greatly appreciated.
> >
> > Dimitri
> >
> > --
> > This message has been scanned for viruses and
> > dangerous content by MailScanner, and is
> > believed to be clean.
> >
> > --
> > To unsubscribe from this list: send the line
> > "unsubscribe netfilter" in the body of a
> > message to majordomo@vger.kernel.org More
> > majordomo info at
> > =C2=A0http://vger.kernel.org/majordomo-info.html



--=20
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

