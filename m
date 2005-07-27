From: "curby ." <curby.public@gmail.com>
Subject: Re: SSH Brute Force not working (any longer)
Date: Wed, 27 Jul 2005 16:50:23 -0600
Message-ID: <5d2f379105072715502f71e9b4@mail.gmail.com>
References: <5d2f37910507270936737ad3d1@mail.gmail.com>
	<003601c592df$9f92fda0$4206a8c0@loki>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003601c592df$9f92fda0$4206a8c0@loki>
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
To: Marius Mertens <marius.mertens@gmx.de>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

On 7/27/05, Nagy Zoltan <kirk@elte.hu> wrote:
> i've read 1-3 the files, i think your problem is a skip of the "update" (=
my english is really bad ;)
> because your --update lines have other condition like:seconds and rate
> the attacking machine when it begins to send those packets, recent knows =
nothing about him, it will be enlist with a --set match
> and then you don't update it's record with a single --update, so it can't=
 reach the hitcount :)

2 and 3 have --set during the rule in the INPUT chain that jumps to
the custom chain.

On 7/27/05, Marius Mertens <marius.mertens@gmx.de> wrote:
> problem. The only positive about it: I finally gave up debugging it, and =
as
> silently as it came, the problem disappeared. Everything is working fine
> again. With a still unchanged ruleset of course ;-)

If this is not the result of something dumb we're doing, there's
probably a bug that should be squirreled out.  Intermittent problems
in security software are bad. Still, iptables has been so stable that
I'm thinking it's likely my fault. =3DP

I'll keep poking at it when I have a moment.

