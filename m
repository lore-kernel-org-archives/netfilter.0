From: vwf <vwf@vulkor.net>
Subject: Re: how to filter on applications?
Date: Fri, 27 Oct 2006 13:04:42 +0200
Message-ID: <20061027110442.GA6607@trane.vulkor.net>
References: <20061026185357.GA4832@trane.vulkor.net>
	<46522.136.1.1.154.1161890722.squirrel@mail.addictz.org>
	<20061027082201.GA4298@trane.vulkor.net>
	<4541C2D4.1030903@freemail.hu>
	<20061027083635.GA4518@trane.vulkor.net>
	<4541C90D.3050000@freemail.hu>
	<de47c0230610270337p7b3e59f4g2706d54c16137276@mail.gmail.com>
Reply-To: vwf <vwf@vulkor.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <de47c0230610270337p7b3e59f4g2706d54c16137276@mail.gmail.com>
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
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

On Fri, Oct 27, 2006 at 12:37:00PM +0200, Gabor Szokoli wrote:
> On 10/27/06, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
> >BUT if I did not understood you correctly then please send me an exact
> >question...
>=20
> I might be able to mediate before this escalates...
> I think vwf assumes the firewall is on the same host as the
> applications, no forwarding takes place.
> In this case it is not an unreasonable expectation to be able to write
> iptables rules matching the name of the executable whose process
> instance owns the socket: so called "personal firewall" applications
> on some other operating system do this all the time.
>=20
> Google-lee-goo:
> http://www.netfilter.org/projects/patch-o-matic/pom-submitted.html#pom-=
submitted-ownercmd

Thank you. Your assumptions are right. I filter on application on the
workstation, and on port/destination on the router.

Iptables lost --cmd-owner, so new kernels were pretty useless to me,
but they seem to be reintroduced for ip6tables. Is there a "howto" to
rewrite a iptables firewall-ruleset to ip6tables (or a good
introduction for ip6tables)?


