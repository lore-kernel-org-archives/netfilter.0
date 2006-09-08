From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: matching -d to a given interface without specifying ip address
Date: Fri, 08 Sep 2006 11:26:36 +0200
Message-ID: <4501374C.6000207@plouf.fr.eu.org>
References: <44FA068C.1000202@nth.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44FA068C.1000202@nth.ca>
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

Dmitri a =E9crit :
>=20
> Is there a way to define a condition "those packets whose destination i=
s=20
> the IP address of the given interface" without specifying the actual IP=
=20
> address? (it changes, thus needs to be detected and updated)

None that I'm aware of.

> I want to be able to distinguish those packets addressed to the box, to=
=20
> be forwarded, from those just passing through it. (-i matches both)
>=20
> Such packets can be discovered in the INPUT chains, after the "routing=20
> decision", but by then it's too late to do DNAT.

Beware. "Packets addressed to the box (entering the given interface)" is=20
not the same as "packets whose destination is the IP address of the=20
given interface". The former means "packets whose destination is the IP=20
address of ANY local interface". So packets matching a rule such as :

iptables -A INPUT -i <interface> ...

would match not only the former definition but also the latter, and also=20
broadcasts that the box listens to.

So what do you want to match exactly ?

