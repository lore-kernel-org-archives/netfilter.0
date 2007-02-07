From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: IPTables and different types of NAT
Date: Wed, 07 Feb 2007 10:19:07 -0600
Message-ID: <45C9FBFB.9090607@riverviewtech.net>
References: <45C9F509.8010309@gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C9F509.8010309@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Pedro Gon=E7alves wrote:
> I want to know if it is possible to use IPTables to implement
> -Full Cone NAT
> -Restricted Cone NAT
> -Port Restricted Cone NAT
> -Symmetric NAT

I see no reason why it would not be possible.  However, such=20
distinctions are usually not made.  The ""default (if you will) NAT that=20
is used on most SOHO Linux routers would be considered "Restricted Cone=20
NAT" in such as external hosts can not connect to internal hosts unless=20
the internal host has contacted the external host first.

"Full Cone Nat" could easily be implemented with inbound redirection to=20
the internal system.

"Port Restricted Cone NAT" is nothing more than "Restricted Cone NAT"=20
with port filtering.  This is what is usually done if you have a server=20
behind a NATing router / firewall.  In this case, you only port forward=20
the ports that you need.

I'm not sure if there is inherent support for "Symmetric NAT" or not.=20
I'm sure that support could be added for this if it does not exist.

> If  so, where can I find information about how to implement each type o=
f
> NAT?

I just did a quick Google for what the various types of NAT mean and ran=20
across this:  http://en.wikipedia.org/wiki/Network_address_translation

As far as information on how to do it, all but "Symmetric NAT" can be=20
very simply done with basic IPTables SOHO style NATing.



Grant. . . .

