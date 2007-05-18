From: "Filka Michal" <Michal.Filka@sitronicsts.com>
Subject: problem when compiling lbnfnetlink
Date: Fri, 18 May 2007 12:09:05 +0200
Message-ID: <2DD3CA89774593478BC28081C7392595BC8A1F@exalfa.stromtelecom.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Hi all,

I have been trying to compile libnfnetlink library.
I did autoconf, ./configure and make
The result of make was
src/Makefile.am:9: Libtool library used but `LIBTOOL' is undefined
src/Makefile.am:9:   The usual way to define `LIBTOOL' is to add
`AC_PROG_LIBTOOL'
src/Makefile.am:9:   to `configure.in' and run `aclocal' and `autoconf'
again.
src/Makefile.am:9:   If `AC_PROG_LIBTOOL' is in `configure.in', make
sure
src/Makefile.am:9:   its definition is in aclocal's search path.
make[1]: *** [Makefile.in] Error 1

I'm not so experienced in automake, so I invite any help ... I suppose
that it is configuration problem.

Current configuration:
Debian 2.6.20
automake 1.10
aclocal 1.10

trying to compile libnfnetlink-0.0.16

thanks for any suggestions,

Michal Filka

