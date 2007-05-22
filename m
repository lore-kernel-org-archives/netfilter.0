From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: NAT addresses - RFC or tradition?
Date: Tue, 22 May 2007 17:02:52 -0300
Message-ID: <46534C6C.3050706@solutti.com.br>
References: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: jpb@entel.ca
Cc: netfilter@lists.netfilter.org



Paul Blond=E9 escreveu:
> I've noticed that a lot of people use the 192.168.X.X subnet for intern=
al
> networks, is this (and the less-used 10-series) a requirement of some R=
FC,
> or a recommendation that has become tradition?
>
> We are using a completely different subnet, something similar to (for
> example) 42.127.129.X to further obfuscate the internal network from
> outside. This, and many other examples, produces a class-A subnet mask =
(some
> produce a class-B) when entered in WinXP's TCP/IP dialog, although the
> actual mask we use with it is class-C.
>
> Is this a no-no? Will it break our server's IPTables when communicating=
 with
> it? Am I in for a lot of trouble? The addresses don't seem to cause any=

> problems, but I don't want this to jump up and bite us in the bottom
> sometime down the road.
>  =20

    Yes, those 'reserved' IP addresses are declared by RFC 1918. Please=20
check:

http://tools.ietf.org/html/rfc1918
http://en.wikipedia.org/wiki/Private_network

    Your network will work with no problems, except if you had to access =

some far-far-far away network which uses your local addresses, which=20
should never be used as local ones.

  =20

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





