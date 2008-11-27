From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Which "illegal" tcp-fragments should be blocked?
Date: Thu, 27 Nov 2008 15:58:48 +0100
Message-ID: <492EB5A8.1040402@freemail.hu>
References: <7259d7020811240901o53a4fd7bt99985dd2b3a7cb74@mail.gmail.com>	 <492C0774.9070002@freemail.hu> <7259d7020811260900p64a3f60as27102d958c2ef103@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811260900p64a3f60as27102d958c2ef103@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: JC Janos <jcjanos245@gmail.com>, Netfilter list <netfilter@vger.kernel.org>

Hi,

After sending you my list I found some bugs. :D
We have the following flags:
(http://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_segment=
_structure)

URG, ACK, PSH, RST, SYN, FIN

There are 64 (=3D2 to the power 6) variations possible.

So here is my new INVALID list:

ACK,SYN,FIN,RST NONE  --> -4 variations. (PSH and URG never should be=20
set alone.)
RST,SYN RST,SYN --> -16 variations.
RST,FIN RST,FIN --> -8 variations.
SYN,FIN SYN,FIN --> -8 variations.

After this we have 28 "valid" variations.

If we do not check PSH and URG flags then only these 7 combinations are=
=20
valid:

RST
=46IN
SYN
ACK
ACK-RST
ACK-FIN
ACK-SYN

I do not know if there is any restrictions of using PSH and URG flags..=
=2E

In three-way handshake we see: SYN, SYN-ACK, ACK.
In connection termination: FIN, ACK, FIN-ACK.


Check this too: http://kerneltrap.org/node/3072

Swifty

JC Janos =EDrta:
> Gaspar,
>
> 2008/11/25 G=E1sp=E1r Lajos <swifty@freemail.hu>:
>  =20
>> Hi!
>>
>> I use the following five combination to filter bogous packets:
>>    =20
>
> Why those in particular, and not the others?  Your set also adds one
> mask/comp pair,
>
>   RST,FIN    RST,FIN
>
> It seems that just about every example uses a different combination o=
f
> fragment rules.  I'm simply wondering what the logic in choosing one
> over the other is.
>
> Is there maybe some documentation you can point to?
>
> --JC
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

