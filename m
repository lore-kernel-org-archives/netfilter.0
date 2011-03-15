From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset ipporthash - need -p tcp|udp?
Date: Tue, 15 Mar 2011 16:13:22 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1103151610080.21726@blackhole.kfki.hu>
References: <AANLkTikqUPBmwvGG3Lt5jVR1rdnwA+iOTi4ijfWbC0qs@mail.gmail.com> <alpine.DEB.2.00.1103142110580.20094@blackhole.kfki.hu> <AANLkTi=HpKkCA3vXawfR+owqSb=VE-xOyZ+fC4W6hYyQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=HpKkCA3vXawfR+owqSb=VE-xOyZ+fC4W6hYyQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 15 Mar 2011, Pandu Poluan wrote:

> On Tue, Mar 15, 2011 at 03:13, Jozsef Kadlecsik
> <kadlec@blackhole.kfki.hu> wrote:
> > On Tue, 15 Mar 2011, Pandu Poluan wrote:
> >
> >> A question's been bugging me since this evening:
> >>
> >> Do I need to specify -p tcp|udp if I want to match against an IP set
> >> of type ipporthash?
> >>
> >> Or, in other words, can I just write a rule like `iptables -A FORWARD
> >> -m set --match-set SetName dst,dst -j ACCEPT` ?
> >
> > The port stored together with the protocol, so you should not specify the
> > protocol in the iptables rules. Unless you want to match a subset of the
> > set, selected by the protocol.
> >
> > Best regards,
> > Jozsef
> > -
> 
> Ahh, thanks for the explanation!
> 
> So, the ipporthash implicitly will only be applied to port-using
> protocols, e.g., TCP and UDP.
>
> What about SCTP's port? Will ipporthash also match against SCTP's ports?

Any protocol can be stored in an ipporthash, but at the moment the 
"port" is interpreted for TCP, UDP, ICMP and ICMPv6 only.

SCTP support can be added fairly easily.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
