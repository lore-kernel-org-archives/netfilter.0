From: "Yan Doldonov" <yand@seabak.com>
Subject: FW: NATing h.323 protocol stack
Date: Thu, 24 Aug 2006 14:35:38 +0500
Message-ID: <01d801c6c760$a9f87ca0$fbb0660a@pilligrim>
Reply-To: yand@seabak.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Thierry thak you for the comment.

Quintum, whose hardware box we're thinking of using at the moment
specifically states in the manual to disable all software firewall h.323
natting capabilities and claims that their hardware devices have native
support for NATed environment and they also say that every software =
products
they've seen that do NAT for h.323 really do not do a full job as per =
their
opinion. We had an experience with another device by Polycom which =
claimed a
native support for NAT as well however all our attempts to make it work =
in
the NATed environment failed.=20

So I am a litle confused here and really looking for a real world =
experience
of having made it work.


+------------------------------------------+
Yan Doldonov
IT Consultant
Seabak Outsourced IT Services
www.seabak.net
mail-to: yand@seabak.com
mobile: +99450 3271502
office: +99412 4972191
+------------------------------------------+=20
-----Original Message-----
From: thierry itty [mailto:thierry.itty@besancon.org]=20
Sent: Thursday, 24 August, 2006 14:17
To: yand@seabak.com
Subject: Re: NATing h.323 protocol stack

my 0.02$
the latest kernel (2-6-17) includes h323 natting stuff just modprobe the
necessary modules at iptables startup

Yan Doldonov a =E9crit :

>Hello everyone!
>
>Has any one got experience of setting up the H.323 devices running =
NATed?=20
>We have a taske where we need to setup the h.323 sessions to work over=20
>a corporate VPN. Any comments or reference to useful literature I would =

>appreciate.
>



