From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Which "illegal" tcp-fragments should be blocked?
Date: Tue, 25 Nov 2008 15:11:00 +0100
Message-ID: <492C0774.9070002@freemail.hu>
References: <7259d7020811240901o53a4fd7bt99985dd2b3a7cb74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811240901o53a4fd7bt99985dd2b3a7cb74@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: JC Janos <jcjanos245@gmail.com>, Netfilter list <netfilter@vger.kernel.org>

Hi!

I use the following five combination to filter bogous packets:

ALL    NONE
ALL    URG,PSH,FIN
RST,SYN    RST,SYN
RST,FIN    RST,FIN
SYN,FIN    SYN,FIN

Swifty

JC Janos =EDrta:
> I've read on numerous sites, and in bunches of examples, that "illega=
l
> tcp fragments" should be blocked early in a firewall rule set.
>
> As I understand it, the rule takes the form,
>
> 	iptables -A INPUT -p tcp --tcp-flags "mask" "comp" -j DROP
>
> Every source I read seems to match & block a different combination of
> fragments.  So far, the list of "block these" mask/comp pairs that
> I've come across are:
>
> 	"mask"                            "comp"
> 	----------------                  ----------------
> 	ALL                               ALL
> 	ALL                               NONE
> 	ALL                               FIN,URG,PSH
> 	ALL                               FIN,URG,PSH
> 	ALL                               SYN,RST,ACK,FIN,URG
> 	ACK                               ACK
> 	FIN,ACK                           FIN
> 	FIN,URG,PSH                       FIN,URG,PSH
> 	SYN                               NONE
> 	SYN,RST                           SYN,RST
> 	SYN,FIN,RST,ACK                   NONE
> 	SYN,FIN,RST,ACK,URG               NONE
> 	SYN,FIN                           SYN,FIN
> 	SYN,FIN,RST,ACK                   FIN
> 	SYN,FIN,RST,ACK,URG               URG
> 	SYN,FIN                           SYN,FIN
> 	SYN,FIN,RST,ACK                   SYN,FIN
> 	SYN,FIN,RST,ACK,URG,PSH,ECE,CWR   FIN,URG,PSH
> 	SYN,FIN,RST,ACK,URG               SYN,FIN,RST,ACK,URG
> 	SYN,FIN,RST,ACK,URG,PSH           SYN,FIN,RST,ACK,URG,PSH
>
> Which of these are really valid targets to block?  Each of the pairs
> is blocked at least sometimes; noone I've found so far blocks them
> all.  Is this list even complete?
>
> Thanks.
>
> --JC
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

