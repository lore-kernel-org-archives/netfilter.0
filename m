From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: SNAT - matching original and natted IP addresses
Date: Fri, 15 Jan 2010 14:19:43 -0200
Message-ID: <4B50959F.4040207@solutti.com.br>
References: <1ef54a181001150733r5b688d27x3feaf7d4cc25128d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1ef54a181001150733r5b688d27x3feaf7d4cc25128d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Shirley Ong <soap6gal@gmail.com>
Cc: netfilter@vger.kernel.org


Shirley Ong escreveu:
> Hi,
>
> I'm trying to map a range of private IP addresses to a range of publi=
c
> IP addresses. For this, I'm using SNAT:
>
>     # iptables -t nat -A POSTROUTING -s <private range> -d ! <private
> range> -j SNAT --to-source <public range>
>
> The public range is higher than private range. I can see from
> conntrack that the last 2 octets of original and natted IP addresses
> are always the same. Can I be sure that the mapping is always correct
> without parsing conntrack from time to time because it's heavy
> processing? Or is there any other way that I can make sure the mappin=
g
> is always correct?
>  =20

    it's seems to me that using NETMAP target will be more interesting=20
to you than using SNAT. AFAIK, SNAT does not guarantees you that.

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




