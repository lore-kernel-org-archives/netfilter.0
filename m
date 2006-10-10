From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to find the chain which calls the match
Date: Tue, 10 Oct 2006 11:24:08 +0200
Message-ID: <452B66B8.3060805@plouf.fr.eu.org>
References: <1160405480.28977.201.camel@mfarooq-1.tango-networks.com>	<452A6714.5030709@it.uc3m.es>
	<452A68BE.8030605@it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452A68BE.8030605@it.uc3m.es>
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

aoliva a =E9crit :
>=20
> Hi all, I am writing a match for iptables and I would like it to have a=
=20
> different behaviour when it is called from different chains (e.g.=20
> different behaviour when called from INPUT than OUTPUT) anyone knows ho=
w=20
> to check in the match which is the chain that is calling it?

I do not have the answer to your question, but you could watch the code=20
of the NETMAP target which does destination NAT in the PREROUTING chain=20
and source NAT in the POSTROUTING chain. By the way, how does it behave=20
in the OUTPUT chain ?

