From: Eric Leblond <eleblond@init-sys.com>
Subject: Re: IPtables accounting ...
Date: 13 Nov 2002 15:08:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037196520.7181.205.camel@tech004>
References: <1037193855.4553.25.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037193855.4553.25.camel@rayw.knowledgefactory.co.za>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 2002-11-13 at 14:24, Raymond Leach wrote:
> Hi
>=20
> Where do I do iptables accounting?
>=20
> For example: If I have users on a private LAN surfing via a proxy on the
> firewall and I have web servers in a DMZ also being routed via the
> firewall, where do I put my accounting rules? In the FORWARD chain, or
> the INPUT chain, or both?

Not INPUT if you don't have a web server on your firewall.
FORWARD is a good place.

--=20
=C9ric Leblond
courriel : eleblond@init-sys.com


