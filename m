From: Saatvik Agarwal <saatvik.agarwal@stanford.edu>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Sat, 30 May 2009 11:03:07 -0700
Message-ID: <4ddb24250905301103u73d42babu990a89812ac6a4a7@mail.gmail.com>
References: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com>
	 <alpine.DEB.2.00.0905301726540.31323@blackhole.kfki.hu>
Reply-To: saatvik.agarwal@stanford.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:reply-to:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=XAYw/pfkVPxgFRbQPO0Q0ycD7KfInzrOAgNtlcJ3ghQ=;
        b=QqXhrgK/TRF8/b95KbVFCvtnG4M9cPsKbl/3fA7wHnTCeyDYXMNA1/WYKIWWWWmz/k
         5noPDrjH6gGcnZ8cXyTnd8NW8XBC/a1rOuQX0IJ+qomvw0QCQUVIZ7iOFij8TvthSnxY
         nVbHkXIWIgcck8rH7UltEOuGLdNvrKalz6WH0=
In-Reply-To: <alpine.DEB.2.00.0905301726540.31323@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Reply inline.

On 5/30/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> [Back to your original mail.]
>
>
>  On Wed, 27 May 2009, Saatvik Agarwal wrote:
>
>
> > For my research project in school, I am trying to establish TCP
>  > connections when both hosts are behind full-cone NATs using TCP's
>  > simultaneous open functionality. Unfortunately, it seems that ipta=
bles
>  > does not support TCP simultaneous open. For my test environment, I
>  > simulate a full-cone NAT using iptables. My iptables rule is exact=
ly
>  > as follows:
>  >
>  > iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>  >
>  > Of course, here my eth0 is the interface connected to the internet=
=2E
>  > Everything else is set to accept; there is no filtering or anythin=
g.
>  > In fact, I run iptables --flush before adding the above rule.
>  >
>  > Using wireshark, the behavior I observe on both the iptables NAT b=
oxes
>  > is that both of them send out/see a SYN coming from their NATted h=
ost
>  > before they receive a SYN from the other host. Unfortunately, both
>  > NATs respond with TCP RSTs to this incoming SYN (note that the
>  > incoming SYN corresponds to the exact same connection, i.e. port,
>  > endpoint tuple, as the outgoing SYN).
>
>
> Netfilter conntrack/NAT does *not* generate any kind of packet. If yo=
u see
>  RST segments, those are then sent by the receiver of the SYN packet
>  because there's no open socket yet.

Yes, sorry I realized later that it is probably the host machine's TCP
stack generating that RST packet.

>
>  You can successfully build up simultaneous open connections only if =
you
>  use good timings: both hosts send the initial SYNs *before* the SYN =
from
>  the other side is delivered to them. Or, intentionally ignore (drop)=
 the
>  RST segments.

Yes, using wireshark, I am seeing exactly this behavior on both the
NAT boxes. The outgoing SYN is seen before the incoming SYN.

Thanks for all your help once again. Your replies have been very enligh=
tening.

Best,
Saatvik

>  Adding TCP simultaneous open support to netfilter conntrack is not h=
ard
>  but needs more testing before release.
>
>
>  Best regards,
>  Jozsef
>  -
>  E-mail=A0=A0: kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
>  PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
>  Address : KFKI Research Institute for Particle and Nuclear Physics
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0H-1525 Budapest 114, POB. 49, Hungary
>
