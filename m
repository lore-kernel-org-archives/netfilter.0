From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: VoIP conntrack issue
Date: Thu, 15 Nov 2012 06:04:07 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211150553090.7649@nerf07.vanv.qr>
References: <CABY2qi8n0ttC99_UktcT+Jwnd9WCCsvk5+ug1GXrrYbd9ixxWw@mail.gmail.com> <alpine.LNX.2.01.1211150035180.32273@nerf07.vanv.qr> <CABY2qi9AnCJDXUFxo_ocUwU0dCmUEJ4W8aMQUbVBmRcS_=5EzA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi9AnCJDXUFxo_ocUwU0dCmUEJ4W8aMQUbVBmRcS_=5EzA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

On Thursday 2012-11-15 01:15, J=C3=B6rn Krebs wrote:

>Hi,
>
>I think you don't get the point.

I really think I don't. Which means your description was too convoluted=
=2E

>I WANT A SYMMETRIC NAT!!!! -> Why doesn't anybody understand that?
>I mean I am on the netfilter list. Everyone here should know what I
>mean with the term symmetric NAT

NF does not use these terms, so no. WP also warns about the problems
with the term in http://en.wikipedia.org/wiki/Symmetric_NAT .

=46act is outgoing streams don't magically add mappings for incoming on=
es,=20
unless you use a nf_conntrack_* module that explicitly does it.

There's no nf_conntrack_stun, so if your STUN exchange with
216.x.y.z:3478 causes a non-participant, 134.76.13.21, to suddenly
start sending packets to 114.x.y.z:44608, it's only logical all signs
show a red warning light "unsolicited connection attempt".

>I more and more got the impression, that you are developing in your
>own little world, and not the world where we have different types of
>NAT.

We don't even think "types of NAT". We think in absolute
{a:b, c:d} tuples.

Symmetric relation  x R y =3D> y R x  makes everybody's heads hurt,
because it is not obvious if x is {ip,port} or {ip,port,ip,port}
or just {port,port}.


Dammit, I wasted too much time on this.
