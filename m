From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: question on libnetfilter_conntrack
Date: Tue, 24 Jul 2007 16:10:36 +0200
Message-ID: <46A6085C.7020800@netfilter.org>
References: <FA1AA529CBCAB24E9C8A43D01537060909DFD8@extemp.stromtelecom.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FA1AA529CBCAB24E9C8A43D01537060909DFD8@extemp.stromtelecom.cz>
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
To: Filka Michal <Michal.Filka@sitronicsts.com>
Cc: netfilter@lists.netfilter.org

Filka Michal wrote:
> I use api provided by libnetfilter_conntrack library. When creating connt=
rack (nfct_conntrack_alloc) record I assign it an id. Then conntrack is suc=
cessfully created (nfct_create_conntrack). However, when I try to delete it=
 later on using the same id call (nfct_delete_conntrack) fails (NFNETLINK a=
nswers: No such file or directory). If I look at conntrack using "conntrack=
 -L -i" I see that created record has another id than I assigned it in nfct=
_conntrack_alloc.
>=20
> Does libnetfilter_conntrack ignore given id? If not, what can be wrong?
>=20
> Configuration:
> Linux debian, kernel 2.6.20.8
> libnetfilter_conntrack 0.0.31
                            ^^^

This version is really from the cavemen era. Please upgrade to 0.0.80
and check the new API (see utils/ example files).

--=20
"Pa=EDses en desarrollo es el nombre con que los expertos designan a los
pa=EDses arrollados por el desarrollo ajeno" -- Patas Arriba. La Escuela
del Mundo al Rev=E9s -- E. Galeano

