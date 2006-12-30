From: Sergey Vlasov <vsu@altlinux.ru>
Subject: Re: ip_tables init broken
Date: Sat, 30 Dec 2006 21:30:48 +0300
Message-ID: <20061230213048.07238350.vsu@altlinux.ru>
References: <Pine.LNX.4.61.0612301738001.32449@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__30_Dec_2006_21_30_48_+0300_zP=R1jNmUsOCuNYG"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030297AbWL3S7v@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0612301738001.32449@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

--Signature=_Sat__30_Dec_2006_21_30_48_+0300_zP=R1jNmUsOCuNYG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Sat, 30 Dec 2006 18:14:35 +0100 (MET) Jan Engelhardt wrote:

> when the ip_tables module is loaded automatically when inserting the
> first rule, something gets screwed up, as -L -v -n shows:
>
>
> 17:39 ichi:~ # lsmod | grep ip_tables
> 17:39 ichi:~ # iptables -t mangle -A FORWARD -i eth1 -j MARK --set-mark 161
> 17:39 ichi:~ # iptables -t mangle -A FORWARD -i eth1 -j MARK --set-mark 161
> 17:39 ichi:~ # iptables -t mangle -L -v -n | grep eth1
> p b targ pr opt in  out src       dst
> 0 0 MARK 0  -- eth1 *   0.0.0.0/0 0.0.0.0/0  0xa1
> 0 0 MARK 0  -- eth1 *   0.0.0.0/0 0.0.0.0/0  MARK set 0xa1
>
> Everything is fine if ip_tables was loaded before.
>
> This box runs 2.6.18.5. Can anyone confirm this bug?

Looks like this problem was fixed between iptables releases 1.3.5 and
1.3.7 (the old buggy version was trying to detect whether the kernel
supports the newer MARK target version before loading the ip_tables
module, therefore the check was giving bogus results).

--Signature=_Sat__30_Dec_2006_21_30_48_+0300_zP=R1jNmUsOCuNYG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFFlrBcW82GfkQfsqIRAgE5AJwIS8BuWBMEyxiFd5KaLXxT1m4znwCggtXx
aFxMOLkHtYDT2KCHZJMyptg=
=4QzL
-----END PGP SIGNATURE-----

--Signature=_Sat__30_Dec_2006_21_30_48_+0300_zP=R1jNmUsOCuNYG--
