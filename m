From: Jason Opperisano <opie@817west.com>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 10:13:53 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095948833.1750.9.camel@wolfpack.ljm.dom>
References: <415290B1.5030401@imag.fr>
	<20040923103428.GK27327@metastasis.org.uk>
	<20040923110943.14715.qmail@arcoscom.com>
	<20040923112331.GL27327@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040923112331.GL27327@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset=; charset="utf-8"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 2004-09-23 at 07:23, Nick Drage wrote:
> On Thu, Sep 23, 2004 at 01:09:43PM +0200, Samuel D=C3=ADaz Garc=C3=ADa =
wrote:
> > For DNS query only UDP is necesary, not TCP.
>=20
> Heh, that's such a common misconception that I almost mentioned it in m=
y
> original email. =20

i surprised you didn't...as it comes up here every time DNS is
mentioned.  and you're 100% right about it being a misconception.

> Most DNS queries take place over UDP, however if the
> reply to the query is especially large then a new TCP connection is
> opened between the client and server.

find me a response to a client resolver request that doesn't fit in a
single UDP packet, and i'll stop seeing red every time i see someone
recommend allowing TCP 53 from any IP to their DNS server (*).

>   Also zone transfers take place
> over TCP IIRC, it depends what kind of functionality the DNS server wil=
l
> be providing.

TCP 53 is for zone transfers.  there is no reason to allow TCP from any
IP's other then your slave servers.  i also recommend ACL-ing zone
tranfers in your DNS server configuration as well.

(*) the biggest response i've come across that i can recall is an MX
record lookup for earthlink.net, which is about 540 bytes on the wire
and still "fits" in a single UDP packet.  people that manage DNS servers
that respond with messages of this size are aware that many people that
they want receiving these answers will not allow TCP 53 in through their
firewall and act accordingly.

-j

--=20
Jason Opperisano <opie@817west.com>


