From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: Using iptables to anonymize incoming IP addresses
Date: Wed, 30 Sep 2009 15:38:42 -0300
Message-ID: <4AC3A5B2.7080804@solutti.com.br>
References: <Pine.LNX.4.58.0909301456490.29957@virt1.netstat-a.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0909301456490.29957@virt1.netstat-a.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: andy@time-domain.co.uk
Cc: netfilter@vger.kernel.org

andy thomas escreveu:
> But, I want all the packets received by the webserver to appear to be
> coming from the address 192.168.1.1, not the external public IP addre=
ss
> they really came from, eg the apache logs will show all page requests=
 as
> coming from 192.168.1.1. Can this be done with iptables?
>  =20

    sure !!! Pretty simple.

    you'll need a DNAT rule for the 80 port forwarding

    and you'll need a SNAT rule to, to make the firewall source-nat all=
=20
connections 'going' to your real webserver

192.168.1.1 =3D your firewall
192.168.1.200 =3D your real web server


iptables -t nat -A POSTROUTING -p tcp --dport 80 -d 192.168.1.200 -j=20
SNAT --to-source 192.168.1.1


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




