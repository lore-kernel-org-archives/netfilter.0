From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: [OT] Strange bash phenomenon
Date: Mon, 13 Feb 2006 13:07:59 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEGEPEBNAB.pablo@blueoakdb.com>
References: <1139849773.2960.40.camel@localhost>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139849773.2960.40.camel@localhost>
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
To: Netfilter users list <netfilter@lists.netfilter.org>



> -----Original Message-----
> From: John A. Sullivan III [mailto:jsullivan@opensourcedevel.com]
> Sent: Monday, February 13, 2006 11:56 AM
> To: pablo@blueoakdb.com
> Cc: Netfilter users list
> Subject: RE: [OT] Strange bash phenomenon
>=20
> By the way, if
> I try FILES=3D${/iptables*}, I get:
>=20
> ./testbash2: line 2: ${testb*}: bad substitution
>=20
> But, at least I know how to make it work and understand why the first
> approach failed=20

Hi John,

The 'bad substition' error originates because there are no files which =
match the expression.

Given you're looking at trying to determine whether a directory has =
files you could either do it the way you've initially written up your =
code or use 'find'

The possible 'issue' with the original 'cp *' is if there was a boatload =
of files in the directory, you could get a shell expansion error.  =
Probably very unlikely.

One way to handle the corner case is to use find - see the execdir/exec =
option.

Cheers,
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)


