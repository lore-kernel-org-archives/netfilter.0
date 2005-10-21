From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables rules
Date: Fri, 21 Oct 2005 18:03:44 +0200
Message-ID: <20051021160817.0394569F86@smtp.sterenborg.info>
References: <20051021134645.GA11724@isw302>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051021134645.GA11724@isw302>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

> There seems to be an inconsistence between man pages J=F6rg
> Harmuth has installed and of some other people (the original poster
> and myself at least).=20
>=20
> man iptables:
>=20
> mport
> ...
>  --ports port[,port[,port...]]
> 	Match if the both the source and destination ports are
> 	equal to each other and to one  of  the  given
> 	ports.
>=20
> multiport
> ...
> 	used in conjunction with -p tcp or -p udp.
> 	rts port[,port[,port...]]
> 	Match if the both the source and destination ports
> 	are equal to each other and to one  of  the  given 	ports.
>=20
> Mar 09, 2002 IPTABLES(8)
>=20
> BTW, what is the diffence between mport and multiport modules?

Mport is obsoleted according to :
http://www.netfilter.org/projects/patch-o-matic/pom-obsolete.html

Searching the Netfilter site I read that mport was to be combined with
multiport :
http://www.netfilter.org/documentation/conferences/nf-workshop-2004-summ
ary.html (mport TODO: combine with multiport). So, I think this work has
been done.


Gr,
Rob


