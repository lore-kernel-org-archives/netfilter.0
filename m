From: James Morris <jmorris@intercode.com.au>
Subject: Re: [SECURITY] Local Netfilter / IPTables IP Queue PID Wrap Flaw
Date: Wed, 4 Dec 2002 00:29:11 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Mutt.LNX.4.44.0212040025010.28607-100000__30251.6040196226$1038924980@blackbird.intercode.com.au>
References: <Mutt.LNX.4.44.0212032155570.27990-100000@blackbird.intercode.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Mutt.LNX.4.44.0212032155570.27990-100000@blackbird.intercode.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-announce@lists.netfilter.org
Cc: netfilter-devel@lists.samba.org, netfilter@lists.samba.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Just an update on this, someone has pointed out that the recommended
2.4.20 kernel has a ext3 data corruption bug (which fortunately will not
affect most users).

The changset comments for the ext3 bug are at:
<http://linux.bkbits.net:8080/linux-2.4/cset@1.793?nav=index.html|ChangeSet@-1d>

Please be careful if updating to 2.4.20, or wait until 2.4.21.


- - James
- -- 
James Morris
<jmorris@intercode.com.au>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE97LGqKVbBrEQtqycRAnyaAJ9xMP2FFhMiB4EHQlEdCQ2Kf7z2bwCeLq2J
IS9YvQzsHYCJILYLo6vsbmo=
=V9f/
-----END PGP SIGNATURE-----


