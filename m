From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Loopback security...
Date: Wed, 23 Apr 2008 17:22:00 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804231719390.13697@fbirervta.pbzchgretzou.qr>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <alpine.LNX.1.10.0804222145350.13697@fbirervta.pbzchgretzou.qr> <480E4784.3060905@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480E4784.3060905@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Tuesday 2008-04-22 22:16, Grant Taylor wrote:
>> However, ping 127.0.0.2 will fail of course, yes it is a special han=
dling
>> inside linux (but not really on the topic of "secure"), code-wise it=
 is just
>> like 240.0.0.0/8 which was not routed a few weeks ago until a patch =
changed
>> it.
>
> I had not considered any thing other than 127.0.0.1 as I don't use th=
e other
> millions of addresses in the loopback network.
>
> Are you saying that what I'm calling a ""security feature is really a
> misconception and a side effect of other parts of the kernel?
>
> Further, can you give some back history on the 240/8 network or point=
 me in a
> direction to do some reading?

Before the patch, trying to ping 240.1.2.3 also resulted in Invalid
argument or Network unreachable. Since there was an IETF draft
draft-fuller-240space-00.txt to enable use of 240... see commit
1e637c74b0f84eaca02b914c0b8c6f67276e9697.

If you look at the diff of 1e637 to its parent (i.e.=C2=A0"the patch" a=
s
one could say :-)  you see ipv4_is_loopback in the context around it;
among it in a few files, this function causes "special handling".
hth.
