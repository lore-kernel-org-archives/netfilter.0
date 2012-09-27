From: "Steve \(Telsat Broadband\)" <steve@telsatbb.vu>
Subject: RE: ip6tables REDIRECT support
Date: Fri, 28 Sep 2012 04:21:56 +1100
Message-ID: <06b901cd9cd4$98ebea50$cac3bef0$@telsatbb.vu>
References: <CAAq25NTpN5bvPyHKfQ0e-rHU2OWg+Sjb00mq=rVKrt1c9POctg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAq25NTpN5bvPyHKfQ0e-rHU2OWg+Sjb00mq=rVKrt1c9POctg@mail.gmail.com>
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Joao Pereira' <joaopapereira@gmail.com>, netfilter@vger.kernel.org

Hi Jo=E3o,

I too was requiring this for a server of ours; but not for the exact sa=
me
reason, ours was to implement a capture portal.

I did try to compile the patch you mentioned into ip6tables 1.4.10 but =
part
of the patch that I had a copy of was incomplete, further due to my lim=
ited
knowledge of the code netfilter is built on, I couldn't make a work-aro=
und.

I posted to this list some time back asking if only the REDIRECT compon=
ent
of NAT would be implemented, perhaps not in a NAT table, but rather as =
a -j
target of the mangle table; just a suggestion; but I can't recall getti=
ng
any definitive responses.

The majority of the responses I did get suggested to use TPROXY instead=
 of
redirect, but in my particular case, that didn't work properly and seem=
ed to
have much more overhead than the redirect target.

Hopefully someone out there in the dev team will understand our plight =
and
perhaps incorporate this important target.

Cheers.
Steve.=20


Steve Noorderbroek
C.T.O.
Telsat Broadband Limited
www.telsatbb.vu


-----Original Message-----
=46rom: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Joao Pereira
Sent: Thursday, 27 September 2012 11:18 PM
To: netfilter@vger.kernel.org
Subject: ip6tables REDIRECT support

Hello,
I found a thread of last year with one announcement of the creation of =
a
patch to implement NAT on ipv6. I know that with IPv6 we are not suppos=
ed to
have NAT anymore but i have a problem that a need to solve and the REDI=
RECT
of iptables was the solution for it in IPv4.

The scenario is the following
I have one application running in machine A, and a server also in machi=
ne A.
I am sending one request from the application to the server.
I need to make this request pass through another machine first and only=
 then
land on the server.
I could do this by adding a redirect rule to redirect the traffic using=
 the
port.

I found the patch on http://lwn.net/Articles/468671/ Was the patch appl=
ied
in any version of iptables?

BR
--
-------

Jo=E3o Pereira
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in=
 the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


