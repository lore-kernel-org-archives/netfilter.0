From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ip_conntrack enhancement idea
Date: Thu, 19 Oct 2006 12:12:51 +0200
Message-ID: <45374FA3.7010006@plouf.fr.eu.org>
References: <F1B471B6CE5CFA458DFED6C7669D039706C21D76@usplm234.amer.corp.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F1B471B6CE5CFA458DFED6C7669D039706C21D76@usplm234.amer.corp.eds.com>
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

Hello,

Wilson, Richard E a =E9crit :
>=20
> Thanks, I've been trying to find out more information on NOTRACK -- do
> you know what kernel revision it came with?

According to the kernel changelogs, the 'raw' table, which contains the=20
NOTRACK target, was included in kernel version 2.6.6.
However, the related 'raw' patch for 2.4 kernels is in patch-o-matic-ng=20
snaphots up to patch-o-matic-ng-20050918.
The 'raw' patch for 2.6 kernels was in the patch-o-matic-ng-20040621=20
release but removed in later snapshots, probably due to its inclusion=20
into the 2.6 kernel tree.

