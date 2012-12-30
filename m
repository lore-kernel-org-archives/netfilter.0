From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Concurrent Sessions/Sessions per second
Date: Sun, 30 Dec 2012 04:21:49 +0100
Message-ID: <20121230032149.GA13848@1984>
References: <CAMTjHrwtaUV60nB5exUkiwNDsrFUDU4Rv2ep67c3VV230C-fvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMTjHrwtaUV60nB5exUkiwNDsrFUDU4Rv2ep67c3VV230C-fvQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

On Thu, Dec 27, 2012 at 03:17:04PM -0200, Usu=E1rio do Sistema wrote:
> Hello everyone,
>=20
> anyone help me how can I figure out the follows value in my Linux box=
 ?
>=20
> Max Concurrent Session
> New Sessions per second
>=20
> they are related with CPU of the machine ?

CPU and other hardware aspects are important. But there several
configuration parameters (like using the irqbalance daemon, tweaking
the conntrack table) and they make a difference.

I suggest you a read of the evaluation part of these articles:

http://1984.lsi.us.es/~pablo/docs/intcomp09.pdf
http://people.netfilter.org/kadlec/nftest.pdf

Another important thing while benchmarking is that you have to make
sure that neither your client nor your benchmark server become the
bottleneck. Otherwise, you end up getting misleading benchmarking
results.

> there is any way how to figure out how many connections are through
> my firewall iptables ?

You can obtain the maximum sessions/s by generating lots of well small
connections, ie. assuming TCP, 3-way handshake and then immediately
tearing down the connection.

=46or the client side, you can probably check this utility, it generate=
s
plain HTTP requests:

http://1984.lsi.us.es/git/http-client-benchmark/

=46or the server side, I suggest you to grab Willy Tarreau's httpterm:

http://1wt.eu/tools/httpterm/

I have tried many other utilities in the past, but those are my
favorite ones so far.
