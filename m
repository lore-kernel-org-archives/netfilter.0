From: Adam Young <adam@vbfx.com>
Subject: Re: FXP Support Broken?
Date: Tue, 1 Jun 2004 17:31:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040601173100.4c7797f6@adrock.vbfx.com>
References: <001401c447d4$e110ccf0$13100e0a@jupiter>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1";
 boundary="Signature=_Tue__1_Jun_2004_17_31_01_-0400_Ghjc3.T/dJBQ9Kx9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001401c447d4$e110ccf0$13100e0a@jupiter>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--Signature=_Tue__1_Jun_2004_17_31_01_-0400_Ghjc3.T/dJBQ9Kx9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Tue, 1 Jun 2004 08:35:01 -0400
"Michael D. Baldwin" <p@pcmike.net> wrote:

> I'm currently running 1.2.9 and all of a sudden (well, not all of a sudden,
> I actually cannot pinpoint exactly when this issue arose) I can no longer
> FXP from/into my server. I've tried searching all sorts of lists and using
> google to find any help on this issue as netfilter relates to the 2.4.26
> kernel and I've come up empty-handed. I've also tried looking at the old
> ftp-fxp.patch in an old release of patch-o-matic, but that as well does NOT
> seem to work.
> 
> Has anyone else noticed FXP not working on netfilter-1.2.9 and linux-2.4.26?
> Can anyone on the devel team report on FXP support directly in the netfilter
> code? Sorry for what may of been a dumb post, but I'd really like to have
> the ability to FXP yet again. Thank you.

I've not had luck since the ftp-fxp.patch has become unmaintained (which has
been for quite a long time.)  I did update the patch for my own personal uses,
but I haven't had much luck lately with recent releases of the 2.4.x series
kernel.

Perhaps this would be something to request, even though it does open you up to a
world of attacks...but then again, that should be your choice, and not something
you're forced into.

P.S. please do NOT set reply-to headers when sending to mailing lists, thanks.

-- 
    Adam Young	<adam_at_vbfx_dot_com>
    http://www.vbfx.com/
    GPG Key - 5B3375F8


--Signature=_Tue__1_Jun_2004_17_31_01_-0400_Ghjc3.T/dJBQ9Kx9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAvPWZtQcc7lszdfgRAi6FAKC+GP4vCfxw16fDm8FXrHNgI9+e9wCfTTh4
x2rBH9XutRq07CECTVLCPHU=
=jgHu
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jun_2004_17_31_01_-0400_Ghjc3.T/dJBQ9Kx9--

