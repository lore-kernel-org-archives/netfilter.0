From: Alasdair Ramsay <alasdair.ramsay@cdc.uk.net>
Subject: Re: H.323 Masquerading
Date: Tue, 15 Oct 2002 10:02:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DABD9B9.3020807@cdc.uk.net>
References: <20021011152949.GM10468@qno.de>
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
To: "Christian H. Kuhn" <christian.kuhn@qno.de>
Cc: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I used exatly the same patch with vanilla 2.4.19 but also patched with
freeswan, pax and LIDS(not active).  Build worked first time, exhibiting
the classic symptoms of one way audio untill the (newnat16v2) helper
module was compilled in.  Never got any errors apart from the occasional
out of order packets when tearing down connections.

One think I notice is that you are using MASQERADE not SNAT.  I was SNAT
~ and DNAT'ing this protocol.  I was also not loading the modules, all of
the networking options are compilled statically.

HTH

Alasdair Ramsay


Christian H. Kuhn wrote:
<LOTS>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9q9mw4+7BX0uR648RAopRAKCAMwz9XZNDhdqHxX9N0EU9udIplgCdEfK0
/iwKnLT4fBqsAw2to8W7iyE=
=bN6P
-----END PGP SIGNATURE-----



