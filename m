From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: https permit/deny
Date: Sun, 11 Feb 2007 14:45:54 -0300
Message-ID: <45CF5652.8050306@solutti.com.br>
References: <1171210904.25395.95.camel@act17.actcom.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1171210904.25395.95.camel@act17.actcom.co.il>
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
To: vects <alexc@actcom.co.il>
Cc: netfilter@lists.netfilter.org


    Never used l7 for doing that kind of filtering, dont know if it's=20
possible.

    Anyway, if you need some hard filtering based on URLs, both http and =

https, i would recommend that you use an http/https proxy, just like=20
squid, for doing that.

    Completly block https (TCP/443) traffic with iptables and get your=20
clients for use an http/https proxy and does the filtering there. I'm=20
pretty convinced it will be easier and you'll have a lot more=20
flexibility on the rules. Squid's ACLs are pretty flexible, you should=20
give it a try.


vects escreveu:
> Hi,
>
> I'm looking for solution of the next problem, I have to enable/disable
> an access to list of https web servers, I don't know in advance IPs of
> them, permit rule must be based of the url user typed in location bar.
>
> Is possible to do that by iptables and extentions?
> I thought about l7 filter.
>
>  =20

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





