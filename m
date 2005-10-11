From: "Jorge I. Davila L." <davila@cablenet.com.ni>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 13:45:55 -0600
Message-ID: <1129059955.2415.90.camel@vyatka-39.cablenet.com.ni>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<1129055791.2415.79.camel@vyatka-39.cablenet.com.ni>
	<200510111351.51801.rob0@gmx.co.uk> <200510111424.43553.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510111424.43553.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

The versi=F3n of xen that I'm using is 2.0.7 that requires a 2.4.30 or
2.6.11-12 kernel ...

Because there is an specific application that use 2.4 kernel I'm trying
to put to work iprange in that configuration:

fedora core 3
2.4.30 xen kernel (in domainU)
iptables 1.3.3

El mar, 11-10-2005 a las 14:24 -0500, /dev/rob0 escribi=F3:
> On Tuesday 2005-October-11 13:51, I wrote:
> > > iptables: No chain/target/match by that name
> >
> > I guess this means that your kernel lacks support for the iprange
> > target. "CONFIG_IP_NF_MATCH_IPRANGE=3Dm"
>=20
> Um, that's a match, not a target, but same idea. If it's 2.6.x with=20
> config.gz enabled:
> $ zgrep CONFIG_IP_NF_MATCH_IPRANGE /proc/config.gz
--=20
Jorge Isaac Davila Lopez


