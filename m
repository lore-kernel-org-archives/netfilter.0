From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: an annoying question
Date: Wed, 11 Feb 2004 23:14:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076537678.1319.96.camel@elendil.intranet.cartel-securite.net>
References: <1076536430.10558.42.camel@gb7tf.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076536430.10558.42.camel@gb7tf.org.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Bown <richard.bown@blueyonder.co.uk>
Cc: netfilter@lists.netfilter.org

Le mer 11/02/2004 =E0 22:53, Richard Bown a =E9crit :
> I suspect from the results I've seen running 2.6.2 with iptables-1.2.9
> that the handling of DNAT & SNAT is very different.

Afaik, from a user point of vue, there's no difference between 2.4 and
2.6. I'm using a 2.6.1 kernel on which all the scripts I've written for
2.4 kernels are working just the way they did before, for filtering,
mangling and nating...

What kind of results makes you believe there are major differences on
NAT handling ?

One big difference is bridge interfaces handling, as physical interfaces
cannot get matched using -i/-o switches anymore (br0 is seen through
them) so you have to use physdev match.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

