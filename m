From: Umut Arus <umuta@sabanciuniv.edu>
Subject: Re: Limiting httpd traffic
Date: Sat,  5 Jan 2008 15:35:19 +0200
Message-ID: <20080105153519.yw3oill1e7pc80gk@webmail.sabanciuniv.edu>
References: <20080105022544.99knia1nqesgkw48@webmail.sabanciuniv.edu>
	<Pine.LNX.4.58.0801051108580.32055@mail3.jubileegroup.co.uk>
	<20080105135010.35aw2zq1biroogg8@webmail.sabanciuniv.edu>
	<477F83ED.4040506@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <477F83ED.4040506@solutti.com.br>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; delsp="Yes	format=flowed"
To: netfilter ML <netfilter@vger.kernel.org>

Thank for reply. But squid can not handle this type of limitations and =
=20
waste excessive cpu. We removed that configuration before.

thanks,


  Quoting Leonardo Rodrigues Magalh=C3=A3es <leolistas@solutti.com.br>:

>
>
>    squid can handle traffic limitation with his very flexible ACLs. D=
o
> you run squid in your network ?? If yes, maybe you can get better
> results doing this limitation in squid than in iptables.
>
> Umut Arus escreveu:
>> Hi,
>>
>> I mean that "http outgoing traffic". rapidshare connections and as  =
=20
>> getright download manager softwares are exploited our bandwith. I  =20
>> want to limit connection per web-site and per-source IP's.
>> I hope so, I would explain more clearly
>
> --=20
>
>
> 	Atenciosamente / Sincerily,
> 	Leonardo Rodrigues
> 	Solutti Tecnologia
> 	http://www.solutti.com.br
>
> 	Minha armadilha de SPAM, N=C3=83O mandem email
> 	gertrudes@solutti.com.br
> 	My SPAMTRAP, do not email it


