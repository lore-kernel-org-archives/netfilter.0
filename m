From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: problem matching marked packets in nat PREROUTING chain
Date: Mon, 04 Jun 2007 19:43:19 +0200
Message-ID: <46644F37.9090808@plouf.fr.eu.org>
References: <20070604112704.44000@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070604112704.44000@gmx.net>
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

Richard Hauswald a =E9crit :
>=20
> My question is now why doas the rule placed in the mangle matches the
> mark and the same one in nat doas not?

Probably because the 'nat' table chains see only packets which create a=20
new connection.

