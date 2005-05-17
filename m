From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: conntrack_ftp: partial 227
Date: Tue, 17 May 2005 15:41:57 +0300
Message-ID: <1403218a0505170541785ebc46@mail.gmail.com>
References: <1403218a050517012716f22d7f@mail.gmail.com>
	<4289DA1F.6030200@eurodev.net>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4289DA1F.6030200@eurodev.net>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira <pablo@eurodev.net>
Cc: netfilter <netfilter@lists.netfilter.org>

On 5/17/05, Pablo Neira <pablo@eurodev.net> wrote:
> Mohamed Eldesoky wrote:
> > kernel: conntrack_ftp: partial 227  1874320463+13
> >=20
> > What does this line mean in the /var/log/messages ???
>=20
> The FTP conntrack helper has found a partial matching when parsing a=20
> request to start a connection in passive mode (ie. needs missing=20

More clarification please ??

> information to track that connection, malformed packets, ...). In that=20
> case such packet is silently drop.
>=20
> --
> Pablo
>=20
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

