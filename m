From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Dropping brute force attacks
Date: Thu, 10 Jan 2013 18:01:24 -0500
Message-ID: <201301101801.24381.dyioulos@onpointfc.com>
References: <201301101355.12763.dyioulos@onpointfc.com> <CAJygYd2u=N_26Ei1t049dP-yD6R9OUutF_bWTzYMcjqhgXyvNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd2u=N_26Ei1t049dP-yD6R9OUutF_bWTzYMcjqhgXyvNQ@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

On Thursday 10 January 2013 5:42:03 pm =E5=8F=B6=E9=9B=A8=E9=A3=9E wrot=
e:
> I would suggest look into use hashlimit module, which
> allow you to peek into /proc and have a better
> understanding what ip/block is triggering
>
> On Thu, Jan 10, 2013 at 10:55 AM, Dimitri Yioulos
>
> <dyioulos@onpointfc.com> wrote:
> > Hello, all, and Happy New Year.
> >
> > A few weeks ago I added a post about how to tweak the
> > set up of rules to  drop the ip addresses of machines
> > trying to do a brute force login via ipop3d.  What I've
> > noticed is that few, if any, addresses are being
> > dropped.  Fortunately, I have fail2ban installed on our
> > mail server, so the attacks are being blunted.  Still,
> > I'd like to cut these attacks off at the pass, so to
> > speak.  With you kind indulgence, allow me to provide
> > information on my set-up again so that perhaps someone
> > can help me get this working properly.
> >
> > Our mail server sits in a DMZ; NAT and Forward rules
> > are in place to make the mail server work (and it does,
> > very well).  So, what I did was set the Forward rules
> > to jump to a chain I created called "block_email_brute"
> > (the name sucks, but, hey).  Here are the rules:
> >
> > block_email_brute  tcp  --  anywhere
> > server.mydomain.com tcp dpt:pop3
> >
> > block_email_brute  tcp  --  anywhere
> > server.mydomain.com tcp dpt:smtp
> >
> > And here are the rules in the "block_email_brute"
> > chain:
> >
> >            tcp  --  anywhere           =20
> > server.mydomain.com tcp dpt:pop3 state NEW recent: SET
> > name: DEFAULT side: source
> >
> > LOG        tcp  --  anywhere           =20
> > server.mydomain.com tcp dpt:pop3 state NEW recent:
> > UPDATE seconds: 60 hit_count: 6 TTL-Match name:
> > DEFAULT25 side: source LOG level info prefix `Anti
> > Email Bruteforce: '
> >
> > DROP       tcp  --  anywhere           =20
> > server.mydomain.com tcp dpt:pop3 state NEW recent:
> > UPDATE seconds: 60 hit_count: 6 TTL-Match name: DEFAULT
> > side: source
> >
> >            tcp  --  anywhere           =20
> > server.mydomain.com tcp dpt:smtp state NEW recent: SET
> > name: DEFAULT25 side: source
> >
> > LOG        tcp  --  anywhere           =20
> > server.mydomain.com tcp dpt:smtp state NEW recent:
> > UPDATE seconds: 60 hit_count: 6 TTL-Match name:
> > DEFAULT25 side: source LOG level info prefix `Anti
> > Email Bruteforce: '
> >
> > DROP       tcp  --  anywhere           =20
> > server.mydomain.com tcp dpt:smtp state NEW recent:
> > UPDATE seconds: 60 hit_count: 6 TTL-Match name:
> > DEFAULT25 side: source
> >
> > ACCEPT     tcp  --  anywhere             anywhere
> > tcp flags:SYN,RST,ACK/SYN
> >
> > ACCEPT     tcp  --  anywhere             anywhere
> > tcp state RELATED,ESTABLISHED
> >
> > I realize that port 110 is the one being attacked, but
> > I added 25 just for good measure.
> >
> > I hope the above information is clear and complete
> > enough. Your help is greatly appreciated.
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
> > "unsubscribe netfilter" in the body of a message to
> > majordomo@vger.kernel.org More majordomo info at=20
> > http://vger.kernel.org/majordomo-info.html


I appreciate the suggestion, and will take a look at=20
hashlimit.  But, why isn't rate-limiting working for me, as=20
per the above rules?

--=20
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

