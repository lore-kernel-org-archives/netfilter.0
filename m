From: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?=
	<leolistas@solutti.com.br>
Subject: Re: https permit/deny
Date: Sun, 11 Feb 2007 15:42:26 -0300
Message-ID: <45CF6392.4080300@solutti.com.br>
References: <1171210904.25395.95.camel@act17.actcom.co.il>	<45CF5652.8050306@solutti.com.br>
	<1171212955.25395.104.camel@act17.actcom.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1171212955.25395.104.camel@act17.actcom.co.il>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org



vects escreveu:
> On Sun, 2007-02-11 at 14:45 -0300, Leonardo Rodrigues Magalh=C3=A3es wr=
ote:
>  =20
>>     Never used l7 for doing that kind of filtering, dont know if it's =

>> possible.
>>
>>     Anyway, if you need some hard filtering based on URLs, both http a=
nd=20
>> https, i would recommend that you use an http/https proxy, just like=20
>> squid, for doing that.
>>
>>     Completly block https (TCP/443) traffic with iptables and get your=
=20
>> clients for use an http/https proxy and does the filtering there. I'm =

>> pretty convinced it will be easier and you'll have a lot more=20
>> flexibility on the rules. Squid's ACLs are pretty flexible, you should=
=20
>> give it a try.
>>    =20
> Does it work in transparent mode ( I mean for https)?=20
> I just can't tell all clients to use squid by phone, https filtering
> must be hidden for them. As I know the latest squid supports totally
> transparent mode, is that working for https also?
>  =20

    httpS simply cant be treated in completly transparent modes, because =

that would be detected as a 'man-in-the-middle' attack by the browser=20
and would break the end-to-end criptography that SSL/TLS uses.

    http can be completly transparent, but https cannot.

    Anyway, if you search the archives, you'll find that it's a common=20
opinion that iptables it not the right place, even with layer7 patches,=20
to do complex layer7 filtering. It can even do some application=20
filtering, but it's not supposed for replacing application proxy tools,=20
just like squid for http/https. Complex rules can be applied in an=20
easier and more flexible way in the application layer, with an=20
appropriate application proxy.

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





