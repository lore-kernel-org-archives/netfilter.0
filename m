From: Oscar Mateo <omateo@gmail.com>
Subject: Re: unable to apply PPTP patches
Date: Tue, 6 Sep 2005 18:04:29 +0200
Message-ID: <a8a372c0509060904349e2ef0@mail.gmail.com>
References: <365871C49598504A9481DDBEC3EB495512322D@MAIL.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <365871C49598504A9481DDBEC3EB495512322D@MAIL.InfraSupportEtc.com>
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
To: Greg Scott <GregScott@infrasupportetc.com>
Cc: netfilter@lists.netfilter.org

Ok, I see...
I have just signed up and posted the question again on the developer
list. Hope somebody has an answer for us!!
Cheers,
Oscar

On 9/6/05, Greg Scott <GregScott@infrasupportetc.com> wrote:
> Sigh . . .
>=20
> A couple of us have had the exact same problem.  No answers yet from
> anyone.  It's been suggested to try this on the netfilter developer list
> but I haven't had time to sign up and post the problemm over there yet.
>=20
>=20
> - Greg Scott
>=20
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Oscar Mateo
> Sent: Tuesday, September 06, 2005 9:50 AM
> To: netfilter@lists.netfilter.org
> Subject: unable to apply PPTP patches
>=20
> Hi all:
>=20
> I have been trying to apply the pptp patches (pom-ng-20050905,
> iptables-1.3.3) to the kernel source (kernels 2.6.9.x, 2.6.11.x and
> 2.6.12.x) and I have found the same error that populates the August
> 2005 netfilter Archives:
>=20
> - If I only apply the pptp/gre patches I get
> `__ip_conntrack_expect_find' undefined (when compiling either in the
> kernel or as a module).
> - If I try to apply nfnetlink and ctnetlink patches, ctnetlink is
> rejected (6 rejects out of 48 hunks).
> - If I force the ctnetlink patch, I get `__ip_conntrack_hash_insert'
> undeclared.
>=20
> Did someone get the patch working with kernels >=3D 2.6?
> Does anyone have any ideas how to deal with this problem?
>=20
> Thanks in advance for your help ^_^
> Oscar
>=20
>

