From: Alasdair Ramsay <alasdair.ramsay@cdc.uk.net>
Subject: Related but general question. (WAS:Re: ip_conntrack_ftp doesn't work
 with ftp proxy)
Date: Tue, 19 Nov 2002 14:16:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDA47D1.9040801@cdc.uk.net>
References: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A406A@olga.chs.chalmers.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Kim Leandersson <kim.leandersson@chs.chalmers.se>, netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

If you can pass additional information to the modules as you load them,
can you pass the same information to a module that is statically built
into the kernel?  How is such information passed?

Regards

Alasdair Ramsay

Kim Leandersson wrote:
| Try loading the ip_conntrack_ftp module with the option ports instead.
|
| ip_conntrack_ftp ports=8082 should do the trick for you!
|
| //kim
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE92kfO4+7BX0uR648RAqWWAJ9DFe+ts78YiTIZQiHaAu7ANlNdSQCfR5Mx
cWTAQ8VRAoz2gkZ4mq3WbLA=
=RGSK
-----END PGP SIGNATURE-----



