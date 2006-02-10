From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Query
Date: Fri, 10 Feb 2006 08:41:08 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEEEMHBNAB.pablo@blueoakdb.com>
References: <56244.193.173.147.3.1139578250.squirrel@webmail.sterenborg.info>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <56244.193.173.147.3.1139578250.squirrel@webmail.sterenborg.info>
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
To: netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Rob
> Sterenborg
> Sent: Friday, February 10, 2006 8:31 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Query
>=20
>=20
> I'm not sure if iptables can capture=20
> (and log) all
> packets just like a sniffer can.

You're right Rob, iptables cannot capture all the packets like a =
sniffer.  iptables is Layer 3 so you'd miss anything below.  For =
example, if you wanted to capture PPPoE packets (PADI, PADO, etc), you'd =
miss them with iptables.

Cheers,
-pablo


