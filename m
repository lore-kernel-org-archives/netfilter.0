From: Doug Kehn <rdkehn@yahoo.com>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 06:34:18 -0700 (PDT)
Message-ID: <503574.79448.qm@web52007.mail.re2.yahoo.com>
References: <485BAAA9.3080906@freemail.hu>
Reply-To: rdkehn@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485BAAA9.3080906@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Hi G=E1sp=E1r,


--- On Fri, 6/20/08, G=E1sp=E1r Lajos wrote:

> Doug Kehn =EDrta:
> > The connections do hang if I change the rule to:
> >
> > iptables -t raw -A PREROUTING -d !
> 192.168.2.0/255.255.255.0 -i eth0 -p tcp -m tcp --tcp-flags
> FIN,SYN,RST,ACK ACK -m tcp --dport 80 -j NOTRACK
> >
> > This makes sense, I believe, because the ACK to the
> SYN-ACK wouldn't be tracked and the connection state
> would never reach ESTABLISHED.
> >  =20
> What about the UNTRACKED state???

I get the same result with UNTRACKED.  8(

Thanks,
=2E..doug



     =20
