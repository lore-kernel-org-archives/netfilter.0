From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: DNAT/SNAT question
Date: Thu, 14 Apr 2005 16:28:00 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A90@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

I cleared and reloaded everything and it's now returning an Invalid
argument error. =20

Fine:
iptables -t nat -A PREROUTING -d 88.44.55.8/29 -j NETMAP --to
10.20.30.8/29
iptables -t nat -A POSTROUTING -s 10.20.30.8/29  -j NETMAP --to
88.44.55.8/29

Error:
iptables -t nat -A OUTPUT -d 88.44.55.8/26  -j NETMAP --to 10.20.30.8/29
iptables: Invalid argument

Almost there.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Thursday, April 14, 2005 4:17 PM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT/SNAT question

On Thu, Apr 14, 2005 at 04:08:08PM -0700, Gary W. Smith wrote:
> I'm almost there.  I get an error when trying to use NETMAP in the
> OUTPUT chain.  Is there something else I need to add?
>=20
> iptables -t nat -A OUTPUT -d 88.44.55.8/26  -j NETMAP --to
10.20.30.8/26
> iptables v1.2.11: Bad network address `10.20.30.8/26'

'nother typo:  the network address for 10.20.30.8/26 is 10.20.30.0 not
.8.  i thought we agreed on 10.20.30.8/29?

-j

--
"Lois: $49.95? Are you sure we can afford this?
 Peter: Lois, our relationship can not be measured in nipples and
 dimes... nickels and boobs... money."
        --Family Guy


