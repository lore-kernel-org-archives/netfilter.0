From: Erik =?iso-8859-1?Q?Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Subject: Re: Firewall structure and more (Newbie)
Date: Thu, 8 Jul 2004 20:07:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708180732.GA16355@itstud.chalmers.se>
References: <20040708171016.GA16115@itstud.chalmers.se> <200407081828.49545.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407081828.49545.Antony@Soft-Solutions.co.uk>
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

On Thu, Jul 08, 2004 at 06:28:49PM +0100, Antony Stone wrote:

> On Thursday 08 July 2004 6:10 pm, Erik Wikstr=F6m wrote:
>=20
> I would turn the question around to you: why do you think it is better =
to have=20
> the rules arranged into different chains as you have suggested?   Do yo=
u=20
> think that is easier to understand?   (If you *do* find it easier to=20
> understand, then go ahead and do it, don't do what *I* find easy to wor=
k=20
> with.)

My thought was that by sorting the packets by type at first and then
make a more througout filtering I would avoid the overhead of having,
for example, a UDP packet go through a lot of rules concerning TCP-
packets. But, as you say it leads to a quite complicated structure, but
since the firewall is quite old (75MHz) and a lot of P2P traffic is
passing through I thought that it might have some value.

--
Erik Wikstr=F6m

