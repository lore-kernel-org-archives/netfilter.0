From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: Re: IP_forward
Date: Mon, 25 Nov 2002 13:07:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211251307.28634.apapadop@cmu.edu>
References: <00af01c294a6$88ca0c60$e5b4e40f@lsmith5953>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00af01c294a6$88ca0c60$e5b4e40f@lsmith5953>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: bigman@monster-solutions.net
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 25 November 2002 12:17, bigman@monster-solutions.net wrote:
> all,
>     what file do I tell the server to run echo 1 >
> /proc/sys/net/ipv4_ipforward in?
>

You probably mean /bin/echo 1 > /proc/sys/net/ipv4/ip_forward
and the easiest way to run it is out of /etc/rc.local

- -A
- --=20
http://andrew.cmu.edu/~apapadop/pub_key.asc
3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE94mbggmAMwQt1gmURAmuzAJwPNStgK3b3JEGSd/zplE+hlAsVAACfbRsW
TVp7wWohb2uQO/lvpB5lPsw=3D
=3DxurZ
-----END PGP SIGNATURE-----


