From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 21:48:23 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804222145350.13697@fbirervta.pbzchgretzou.qr>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480DF156.5060801@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Tuesday 2008-04-22 16:08, Grant Taylor wrote:
> On 04/22/08 06:01, Leonardo Rodrigues Magalh=C3=A3es wrote:
>
>> Are you sure you understand it right ??? What do you mean by
>> 'linux consider it secure' ?? do you mean it has no access control
>> by default ???? This happens with ALL linux network (logical and
>> phisical) ones. If you need access control on network level, then
>> you got iptables !!!
>
> No, you mis-understood me.  What I meant by "Linux considers it
> secure" is that (by default) it will not let any traffic in to our
> out of the loopback interface from / to a different interface.=20
> I.e. (presuming that a bind an additional subnet (192.0.2/24 ""Test
> network) to the loopback interface and set up another station to
> route to it via the static ip on the ethernet interface.
>
> +---+                  +---+
> | A +-- - - -  - - - --+ B |
> +---+ .1 (10.0.0) .254 +---+

There is no problem with doing

	ip a f dev lo
	ip a a 127.0.0.1/8 dev eth0

However, ping 127.0.0.2 will fail of course, yes it is a special
handling inside linux (but not really on the topic of "secure"),
code-wise it is just like 240.0.0.0/8 which was not routed a few
weeks ago until a patch changed it.
