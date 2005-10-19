From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: How to see the full datagram for all the packets recieved in
 my ethernet interface
Date: Wed, 19 Oct 2005 09:56:17 -0300
Message-ID: <43564271.9010701@solutti.com.br>
References: <4353A46C.9090008@e-consystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4353A46C.9090008@e-consystems.com>
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
To: netfilter@lists.netfilter.org



suresh escreveu:

> hi,
>      I want to see the complete datagram of the all packets coming=20
> into  my ethernet interface. Is there any linux command to do that.
>
>  if anybody knows, please send me the response.
>

    tcpdump -X

or get ethereal running. Check your distro documentations on how to=20
install ethereal

--=20


	Atenciosamente,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





