From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Re: Firewall blocking FTP
Date: Mon, 15 Sep 2003 07:48:41 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F65C339.1070406@shortcircuit.dyndns.org>
References: <Pine.LNX.4.44.0309112016190.3734-100000@shortcircuit.dyndns.org> <200309151154.09370.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309151154.09370.gdh@acentral.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gavin Hamill <gdh@acentral.co.uk>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Gavin Hamill wrote:
| On Friday 12 September 2003 03:19, Dan Egli wrote:
|
|>All seems to work fine, EXCEPT that I
|>cannot connect to ftp servers using the pasv method.
|
|
| Ensure you are loading the ip_nat_ftp and/or ip_conntrack_ftp modules,
since
| this will watch on port 21 for the relevant FTP PORT/PASV commands and
| open ports accordingly.
|
|
|>P.S. I'm not subscribed to the list, so please CC me on your replies.
|
|
| Too bad...
|
| Cheers,
| Gavin.
|
|

Doh! That was it. ip_nat_ftp wasn't loaded. ip_conntrack_Ftp was, but no
ip_nat_ftp.

Ok. I feel very silly now.

Thank you for your help!

- --- Dan
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQE/ZcM5xQEzeXtVwzoRAl62AJ9W7SCkAeXoyo4n745FL4ppkseiWQCg0HTG
uD2ir2cq19ilaX5i/5IInuI=
=4hKc
-----END PGP SIGNATURE-----



