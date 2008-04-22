From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 13:50:26 -0300
Message-ID: <480E1752.2040308@solutti.com.br>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480DF156.5060801@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>



Grant Taylor escreveu:
>
> Said another way, Linux will not allow foreign traffic (non localhost=
)=20
> on the loopback interface for security reasons.  I believe this to be=
=20
> a design decision based on security.
>

    I have to confess that i have almost none experience with other=20
network OSs different than Linux. But i really think that this idea of=20
loopback interface do NOT connects to real interfaces it not a linux=20
decision. It seems to me that this is basically the whole loopback idea=
:=20
a network interface that connects the machine to itself, thus allowing=20
TCP/IP to fully exist even if the machine is not connect to 'real' netw=
orks.

    The loopback interface is not 'connected' to the network, i really=20
dont think that this would be possible to configure or tweak.

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




