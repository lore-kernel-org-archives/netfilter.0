From: Victor Julien <victor@nk.nl>
Subject: Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 17:08:41 +0100
Message-ID: <200502111708.41372.victor@nk.nl>
References: <200502111757.16352.e-boogie@yandex.ru>
	<20050211154955.GA2644@bender.817west.com>
	<1108137730.5565.71.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1108137730.5565.71.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
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

On Friday 11 February 2005 17:02, Cedric Blancher wrote:
> Le vendredi 11 f=E9vrier 2005 =E0 10:49 -0500, Jason Opperisano a =E9crit=
 :
> > in theory--they are RELATED.  in practice, i allow them explicitly.
> > looking at one of my firewalls, it appears as though there are ICMP Type
> > 3 packets that get past the RELATED rule and hit the explicit allow rul=
e,
>
> Did you have a look at one of them, just to see if it's a legitimate
> one ? I have experienced some troubles with DNS and port unreachable on
> very slow links, but that was quite unusual.

So Cedric, you are basicly saying that if i accept RELATED icmp packets i=20
_should_ be a good internet-citizen?

Regards,
Victor

