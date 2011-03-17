From: Pandu Poluan <pandu@poluan.info>
Subject: Re: When does NAT processing actually takes place?
Date: Thu, 17 Mar 2011 15:43:15 +0700
Message-ID: <AANLkTinUrUvAJ5B7d8896KcafbKrQnbghX5eaKrDzeeq@mail.gmail.com>
References: <282984944.21619.1300343429509.JavaMail.root@tahiti.vyatta.com>
	<1237758709.21621.1300343546963.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1237758709.21621.1300343546963.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Steven Kath <steven.kath@vyatta.com>
Cc: netfilter@vger.kernel.org, Atle Solbakken <atle@goliathdns.no>

On Thu, Mar 17, 2011 at 13:32, Steven Kath <steven.kath@vyatta.com> wro=
te:
>
> > I'll try to explain in more detail.
> >
> > ## Scenario 1: External address DNAT to internal server ##
> >
> > A packet comes in:
> > [1] To: 11.22.33.44:80
> > From: 55.66.77.88:34567
> >
> > It got DNATed:
> > [2] To: 192.168.1.22:12080
> > From: 55.66.77.88:34567
> >
> > The server replied:
> > [3] To: 55.66.77.88:34567
> > From: 192.168.1.22:12080
> >
> > It got "inverse NAT"ed:
> > [4] To: 55.66.77.88:34567
> > From: 11.22.33.44:80
> >
> > ## Scenario 2: Internal host accesses outside world ##
> >
> > A packet comes in from the LAN:
> > [5] To: 75.64.53.42:80
> > From: 192.168.5.66:45678
> >
> > It got SNATed:
> > [6] To: 75.64.53.42:80
> > From: 88.77.66.55:45678
> >
> > The remote side replied:
> > [7] To: 88.77.66.55:45678
> > From: 75.64.53.42:80
> >
> > It got "inverse NAT"ed:
> > [8] To: 192.168.5.66:45678
> > From: 75.64.53.42:80
> >
> >
> > Now, based on the discussions:
> >
> > * [1]-->[2] happens as packet exits nat/PREROUTING
> > * [5]-->[6] happens as packet exits nat/POSTROUTING
> >
> > When do [3]-->[4] and [7]-->[8] happen?
>
> Unless I'm mistaken, the "inverse NAT" is part of the conntrack set o=
f functions. =C2=A0See the diagram linked below.
>
> The conntrack table contains both the pre-NAT and post-NAT address:po=
rt pairings, and for existing connections the conntrack step on the dia=
gram handles the necessary "inverse" translations. =C2=A0There is a lot=
 of heavy wizardry going on in that little "conntrack" bubble.
>
> http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-f=
low.svg

Ahh, thanks!

Obligatory off-topic comment:

Never would've thought that the little "conntrack" bubble is a bubble
who could ;-)

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
