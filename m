From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: DNAT/SNAT question
Date: Thu, 14 Apr 2005 16:08:08 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A8F@pxtvjoexd01.pxt.primeexalia.com>
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

I'm almost there.  I get an error when trying to use NETMAP in the
OUTPUT chain.  Is there something else I need to add?

iptables -t nat -A OUTPUT -d 88.44.55.8/26  -j NETMAP --to 10.20.30.8/26
iptables v1.2.11: Bad network address `10.20.30.8/26'




-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Thursday, April 14, 2005 3:59 PM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT/SNAT question

On Thu, Apr 14, 2005 at 03:50:17PM -0700, Gary W. Smith wrote:
> You caught another typo, it should have been .3-7.  Also, the prefix
> changes will also help.
>=20
> But I'm still concerned / confused about the OUTPUT chain.  We
currently
> use the OUTPUT chain for the 1:1 nat.  That seems to work fine on all
> other configurations where we do nat'ing.=20
>=20
> Our rule is currently "[0:0] -A POSTROUTING -s 10.20.30.8 -j DNAT --to
> 88.44.55.8" which works fine.  But can we also consolidate this using
> the NETMAP like the pre/post route?=20

yes.

-j

--
"Peter: Hey, Brian. If cops are pigs, does that make you a Snausage?
 Brian: Clever, Peter. Did you stay up all night writing that?
 Peter: No, I got to bed around two, two-thirty."
        --Family Guy


