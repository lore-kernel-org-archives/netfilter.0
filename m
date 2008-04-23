From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 11:37:50 -0300
Message-ID: <480F49BE.60600@solutti.com.br>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Yves DUF <yves.duf@gmail.com>, ML netfilter <netfilter@vger.kernel.org>



Yves DUF escreveu:
> I think that iptables on the GNU/Linux FTP server would be a good
> solution, to do a sort of "ftp contracking". But I don't manage to
> write a simple rule as "All traffic that comes from ethX will output
> by ethX"
> Does somebody got ideas on this subject (iptables or whatever else)?
>
>  =20
    This is not iptables related, this is ROUTING related.

    iptables does not route packages. If packets are arriving in one=20
interface and going on another, that's because your ROUTING table says =
that.

    On more-than-1-public interface situations, you may need some=20
advanced routing rules, ie source routing, to get things working proper=
ly.

    iptables has the ftp conntracking module, but again, it has nothing=
=20
to do with routing, it wont help your needs.

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




