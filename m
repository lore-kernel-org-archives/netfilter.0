From: "Carl Farrington" <carl@compsup.net>
Subject: RE: Anybody heard about UP&P ?
Date: Sun, 22 Feb 2004 22:55:58 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <739652C2AFA4834AAB5986A215F68CEC0165AF@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> From: Alex Satrapa [mailto:alex@lintelsys.com.au]
> Sent: 22 February 2004 22:46
> To: netfilter@lists.netfilter.org
> Subject: Re: Anybody heard about UP&P ?
>=20
> Marc Recht=E9 wrote:
> > To enable remote assistance from Internet of a WinXP PC on a LAN =
using
> > NAT one must have a UP&P NAT compatible router.
>=20
> UPnP(tm) is basically SNMP done with SOAP instead of ASN.1, with some =
bits
> of ZeroConf thrown in for good measure.
>=20
> It involves resource discovery, service discovery and property
> manipulation.
>=20
> If you're interested, the specification for an "Internet Gateway =
Device"
> is available from the UPnP website. Basically, the IGD allows =
(authorised)
> machines to request the gateway to do things such as:
>  - Connect to the internet
>  - report statistics
>  - create a forwarded port
>=20
> The "create a forwarded port" part is used by Remote Assistance as =
well as
> MSN Messenger.
>=20
> These are not things that can be emulated in netfilter - you'll need a
> SOAP service, and a whole bunch of other software to implement the IGD
> specification.
>=20
> Last time I looked, some people had in fact implemented UPnP services =
for
> Linux, but I'm not sure whether IGD was implemented.
>=20

http://linux-igd.sourceforge.net/  looks to be the thing. Not yet =
working with Microsoft products though.

