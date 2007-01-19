From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Filtering in PREROUTING
Date: Fri, 19 Jan 2007 12:32:19 +0100
Message-ID: <45B0AC43.3060009@plouf.fr.eu.org>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>	<45AF5186.9080201@gmail.com>
	<1169201967.4807.11.camel@len.t-t-l.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169201967.4807.11.camel@len.t-t-l.co.uk>
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

george a =E9crit :
>=20
> One question arises - in Ch 6 it says connection tracking (coming in)
> happens between raw and mangle tables,

Yes. Same with outgoing locally generated packets.

> but in Ch 7 it says it's handled in PREROUTING.

This is a misuse of the name PREROUTING, to make things easier to=20
understand. PREROUTING is only an iptables built-in chain for some=20
tables, and of course connection tracking does not occur in any iptables=20
chain, as it is independent from iptables. Connection tracking of=20
incoming packets is called from the NF_IP_PRE_ROUTING hook (see=20
http://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO-3.ht=
ml),=20
which is the same hook the PREROUTING chains of the various tables are=20
called from.

