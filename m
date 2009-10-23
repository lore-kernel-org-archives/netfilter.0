From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: simple question about state vs conntrack modules
Date: Fri, 23 Oct 2009 14:36:05 -0200
Message-ID: <4AE1DB75.7060507@solutti.com.br>
References: <4ADF844A.3090106@solutti.com.br> <alpine.DEB.2.00.0910222115350.5982@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910222115350.5982@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>

Jozsef Kadlecsik escreveu:
>> 5 Modern extensions
>> De-facto obsolete extensions:
>> * -m state: replaced by -m conntrack
>>
>>    i must confess i dont recall reading about state module being obs=
oleted by
>> conntrack one ..... is that true ??? I know conntrack has more optio=
ns ....
>> but that it obsoleted state, that i dont remember ....
>>    =20
>
> Technically the conntrack match supersedes - and so obsoletes - the s=
tate=20
> match. But practically the state match is not obsoleted in any way.
>  =20
    That's exactly what i tought ..... conntrack can offer more options=
,=20
but saying state is obsolete means, at least to me, that it's support=20
and maintenance will be dropped soon and everybody HAVE TO stop using i=
t=20
and using something else.

    well, nice to know state is NOT obsolete the way i understand=20
something is obsoleted.

    thanks for your answer

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




