From: "Filka Michal" <Michal.Filka@sitronicsts.com>
Subject: question on libnetfilter_conntrack
Date: Tue, 24 Jul 2007 11:30:33 +0200
Message-ID: <FA1AA529CBCAB24E9C8A43D01537060909DFD8@extemp.stromtelecom.cz>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all,

I use api provided by libnetfilter_conntrack library. When creating =
conntrack (nfct_conntrack_alloc) record I assign it an id. Then =
conntrack is successfully created (nfct_create_conntrack). However, when =
I try to delete it later on using the same id call =
(nfct_delete_conntrack) fails (NFNETLINK answers: No such file or =
directory). If I look at conntrack using "conntrack -L -i" I see that =
created record has another id than I assigned it in =
nfct_conntrack_alloc.

Does libnetfilter_conntrack ignore given id? If not, what can be wrong?

Configuration:
Linux debian, kernel 2.6.20.8
libnetfilter_conntrack 0.0.31

thanks for answers

Michal Filka
System Software Engineer

SITRONICS Telecom Solutions, Czech Republic a.s.


Tel.: +420 211 029 247
BB Centrum - Beta, Vysko=E8ilova 1461/2a, 140 00  Praha 4, Czech =
Republic
www.sitronicsts.com

DISCLAIMER
This e-mail may be privileged and/or confidential, and the sender does =
not waive any related rights and obligations. Any distribution, use or =
copying of this e-mail or the information it contains by other than an =
intended recipient is unauthorized. If you received this e-mail in =
error, please advise me (by return e-mail or otherwise) immediately.


