From: "Rakhmat Farunuddin" <rakhmatf@softhome.net>
Subject: RE: problem with ftp data connection
Date: Thu, 8 Apr 2004 17:27:07 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NIBBICIKKLPBAGJAKCNBMEDNCAAA.rakhmatf@softhome.net>
References: <4075015A.1030209@scan-associates.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4075015A.1030209@scan-associates.net>
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
To: iptables netfilter <netfilter@lists.netfilter.org>, Wan Seman Bin Wan Ismail <wswi@scan-associates.net>

That command is already in my iptables script unfortunatelly snipped by me
:)

Best Regards

Rakhmat Farunuddin, ST         | http://www.oke.com
Network & Security Engineer    | Jl. Abdul Muis 24 Jakarta
PT Trikomsel Multimedia        | 62-21 3440220

-----Original Message-----
From: Wan Seman Bin Wan Ismail [mailto:wswi@scan-associates.net]
Sent: 08 April 2004 14:38
To: Rakhmat Farunuddin
Subject: Re: problem with ftp data connection


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rakhmat Farunuddin wrote:
| hai all
|
| i have this configuration for my iptables (/etc/rc.d/init.d/iptables)
below,
| but with this configuration i only can login into the server, nothing
more,
| i can't download or upload my files, is there something wrong with my
| configuration?


try to load ip_contrack_ftp



/sbin/modprobe ip_conntrack_ftp




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAdQFannQOtAme0WcRAtA7AJ9EsyA1ZXDXe6D2FvnWY5dmF+azpgCeKf8f
iuLwhNw3aX5CBR140XmnDYg=
=D33z
-----END PGP SIGNATURE-----


