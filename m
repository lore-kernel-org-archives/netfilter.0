From: Jason Opperisano <opie@817west.com>
Subject: Re: MASQUERADE: Route sent us somewhere else
Date: Tue, 11 Jan 2005 09:54:21 -0500
Message-ID: <1105455261.9691.22.camel@hubcap.ljm.dom>
References: <33675.10.1.0.231.1105451295.squirrel@10.1.0.231>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <33675.10.1.0.231.1105451295.squirrel@10.1.0.231>
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

On Tue, 2005-01-11 at 08:48, Horv=C3=A1th Szabolcs wrote:
> Hello!
>=20
> We have a firewall, and it's inside many UML's.
> I can't establish new connections from UML, kernel log says
> "MASQUERADE: Route sent us somewhere else".

this is basically a known issue with policy routing + MASQUERADE.

possible work-arounds:

- use SNAT instead of MASQ (if you have static IPs you should be doing
this anyway)
- use ROUTE to force the --oif (messy)

try an untested patch:

http://marc.theaimsgroup.com/?l=3Dnetfilter-devel&m=3D109866543308978&w=3D=
2

please refer to the following thread from netfilter-devel for more
details:

http://marc.theaimsgroup.com/?t=3D109389731400005&r=3D2&w=3D2


--
"Okay, retrace your steps. Woke up, fought with Marge, ate Guatemalan
 insanity peppers, then I... Oh..."
	--The Simpsons


