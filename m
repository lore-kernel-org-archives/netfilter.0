From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: DNAT/SNAT question
Date: Thu, 14 Apr 2005 15:50:17 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A8E@pxtvjoexd01.pxt.primeexalia.com>
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

You caught another typo, it should have been .3-7.  Also, the prefix
changes will also help.

But I'm still concerned / confused about the OUTPUT chain.  We currently
use the OUTPUT chain for the 1:1 nat.  That seems to work fine on all
other configurations where we do nat'ing.=20

Our rule is currently "[0:0] -A POSTROUTING -s 10.20.30.8 -j DNAT --to
88.44.55.8" which works fine.  But can we also consolidate this using
the NETMAP like the pre/post route?=20

If I'm straying down the wrong path can you please include a sample for
what the OUTPUT should look like?

So far you've helped reduce that iptables file considerably and
simplified its management.  Thanks...

Gary


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Thursday, April 14, 2005 3:37 PM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT/SNAT question

On Thu, Apr 14, 2005 at 03:16:37PM -0700, Gary W. Smith wrote:

>=20
> The other question was regarding the OUTPUT rules.  When I had the
> manual 1:1 mapping I found that without the OUTPUT rules that there
were
> problems accessing an internal server from the firewall (or the server
> itself) using the external address.  Is this something that is fixed
> with the NETMAP setting?

no--you'll still need the OUTPUT rule to DNAT packets from the firewall
itself.  there's another thread from today about this very thing,
"Problem with DNAT from localhost to LAN via loopback"


if you do intend to include .8 and are trying to break down .8 - .127,
you can do it in one less prefix than you have:

  88.44.55.8/29
  88.44.55.16/28
  88.44.55.32/27
  88.44.55.64/26

(sorry for that tangent)...

> #[0:0] -A OUTPUT -d 88.44.55.8/26  -j NETMAP --to 10.20.30.8/26
> #[0:0] -A OUTPUT -d 88.44.55.16/28 -j NETMAP --to 10.20.30.16/28
> #[0:0] -A OUTPUT -d 88.44.55.32/27 -j NETMAP --to 10.20.30.32/27
> #[0:0] -A OUTPUT -d 88.44.55.64/27 -j NETMAP --to 10.20.30.64/27
> #[0:0] -A OUTPUT -d 88.44.55.96/27 -j NETMAP --to 10.20.30.96/27

like i said earlier--i think you'll still want the OUTPUT DNATs for
packets from the firewall itself.

-j

--
"Announcer: Paw McTucket Beer. If you drink it, hot women will have
 sex in your backyard."
        --Family Guy


