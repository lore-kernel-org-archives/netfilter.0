From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: Traffic accounting over ULOG inefficient?
Date: Thu, 10 Jun 2004 21:11:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406102112.02640.arny@ats.s.bawue.de>
References: <200406102005.20214.arny@ats.s.bawue.de> <m2u0xjgthu.fsf@catbert.dok.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <m2u0xjgthu.fsf@catbert.dok.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thursday 10 June 2004 20:25, Chris Green wrote:
> There is a patch in patch-o-matic for ctnetlink that implements a
> different type of interface to get these counters from connection
> tracking but I can't seem to find out any information on it aside
> from questions about it go unanswered.

Actually, I'm not so much interested in connection checking. What I need is=
 a=20
counter, that tells me how much data is going through a rule, without givin=
g=20
me the content of the packet itself.

=2D --=20
Thilo Schulz

My public PGP key is available at http://home.bawue.de/~arny/public_key.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAyLKAZx4hBtWQhl4RAhYFAKC9NYJLi/OwZFcwscPMDjwE7x91egCg2sTh
KJFi0oL3xREB6z3t/CtbC6Y=3D
=3D+AB/
=2D----END PGP SIGNATURE-----

