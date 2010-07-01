From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables mac update
Date: Thu, 01 Jul 2010 11:10:42 -0500
Message-ID: <4C2CBE02.7020308@riverviewtech.net>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>	 <4C29E8B4.5060205@plouf.fr.eu.org>	 <1277821770.4006.33.camel@casper.meteor.dp.ua>	 <4C2B6536.2060401@plouf.fr.eu.org>	 <1277941138.11021.20.camel@casper.meteor.dp.ua>	 <4C2BD923.9020503@riverviewtech.net> <1277975315.4200.8.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1277975315.4200.8.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/01/10 04:08, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB=
 wrote:
> Yes, because I just switched ethernet cables.

Ok.

> In this case, from the Windows and Linux boxes point of view nothing=20
> should change, either they still remembering other's MAC (this case i=
t=20
> will just send unicast direct packet) or not (broadcast ARP is send).

Agreed.

> The fact that problem persisted tells me that the problem is in modem=
s=20
> and not in linux bridge.

Agreed.

Will you try one more step after you re-run the test?  Namely, when the=
=20
boxen can't ping each other, try rebooting one or both of the modems an=
d=20
see if the problem continues after doing so.

I have a feeling you have just about all the evidence you need to go=20
back to your modem vendor's support and say "Listen up... what you told=
=20
me was wrong and here's my proof.".



Grant. . . .
