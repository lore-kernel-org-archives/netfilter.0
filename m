From: Jason Opperisano <opie@817west.com>
Subject: Re: [OT] Traffic from ff:ff:ff:ff:ff:ff in switched environment
Date: Tue, 16 Nov 2004 17:02:21 -0500
Message-ID: <1100642540.3695.60.camel@hubcap.ljm.dom>
References: <1100641554.1647.10.camel@laserite>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100641554.1647.10.camel@laserite>
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

On Tue, 2004-11-16 at 16:45, Eduardo Fern=C3=A1ndez wrote:
> Hi all,
>=20
> i know this is not strictly about netfilter, but here it goes:

it sure isn't.

> While I was deploying my firewall script, I noticed some weird traffic
> from mac ff:ff:ff:ff:ff:ff in my router's private interface.=20

it's more likely that ff:ff:ff:ff:ff:ff is the destination mac, not the
source...

> Later on I
> noticed the same traffic in other computers within the network. The
> traffic was arp who-has packets at a constant rate of about 35 kbytes/s=
.
> It's a /16 network in a switched environment.

arp "who-has" packets are vital to the proper functioning of a local
area network--it's how each host finds the MAC address associated with
each IP on the network.

the volume of traffic you're seeing is a symptom of the fact that you
have a /16 configured as a flat, switched network.

the guy that i learned TCP/IP networking from once told me a good
guideline is to never have more than 1024 hosts in a single layer-2
broadcast domain, as the broadcast traffic becomes unmanageable.  he
knew a whole lot more than i ever will--so i try to stick to that when i
(re)design a network.

-j

--
"Silly customer, you cannot hurt a Twinkie!"
	--The Simpsons


