From: Jason Opperisano <opie@817west.com>
Subject: RE: Port forwarding
Date: Fri, 17 Sep 2004 09:57:49 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095429469.1886.41.camel@wolfpack.ljm.dom>
References: <20040917135140.AE3C66A5@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040917135140.AE3C66A5@mail.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset=; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-17 at 09:52, KUCKAERTZ R=C3=A9gis - NVISION wrote:
> > is it possible that $REAL_IP is a local IP address on the=20
> > machine running netfilter?  the reason i ask is that the=20
> > packet counters on the FORWARD chain are zero (whereas INPUT=20
> > and OUTPUT are over 40000).
>=20
> Unfortunately, it is not. Really weird, since packets are correctly DNA=
T'ed
> _before_ going through the filter rules, then the kernel should detect =
that
> they are not intended to it, neh?
>=20
> I tried tcpdump'ing the $REAL_IP and $REAL_PORT, but then nothing match=
ed
> the filter.
>=20
> I must have forgot one thing, since _it worked_ in the past!! :'(
>=20
> Thanks for your help!
>=20

stupid question:  is IP forwarding enabled (sysctl net.ipv4.ip_forward)?

'nother stupid question:  is routing correctly configured from the
netfilter machine to $REAL_MACHINE; i.e., can you ping $REAL_IP from the
netfilter machine?

-j

--=20
Jason Opperisano <opie@817west.com>


