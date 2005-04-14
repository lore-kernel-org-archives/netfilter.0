From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: I need help with "CONNMARK --set-mark"
Date: Thu, 14 Apr 2005 15:09:22 +0200
Message-ID: <9151ac2a0504140609156b7008@mail.gmail.com>
References: <200504111134.26674.adrian.turcu@gmvinteractive.com>
	<200504141332.41565.adrian.turcu@gmvinteractive.com>
	<20050414124539.GA1297@bender.817west.com>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050414124539.GA1297@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Hi,

On 4/14/05, Jason Opperisano <opie@817west.com> wrote:
> On Thu, Apr 14, 2005 at 01:32:33PM +0100, Adrian Turcu wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > I'm just trying to revive this as there was no answer till now. Maybe I=
'm
> > lucky this time :)
>=20
I haven't followed this in great detail either, but I do know that
some people reported problems with the firewall MARK in combination
with tc filter ... fwmark on the LARTC mailing list. I do remember someone
explicitly using a u32 mark match too.

I don't know what the details were, but could you give a different kernel
a try ? Sorry, I thought I kept the exact mail thread in my mailbox, but I
must have deleted it... You may want to check the LARTC archives for more=
=20
info.=20

So try a different kernel first, if the problem persists and you're convinc=
ed
that this is a bug, you may want to take this to the -devel mailing list, w=
here
the author of the CONNMARK patch also hangs out.

Regards,
Filip

