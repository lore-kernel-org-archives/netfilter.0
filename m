From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: log EVERYTHING
Date: Tue, 25 Mar 2003 23:05:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E814345.5060508@shortcircuit.dyndns.org>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I was wondering if there was a way I could setup my rules to log
EVERYTHING, THEN process normally. I.e. if it's an allowed port, log the
connection, then pass it through, and if it is a disallowed port, log
the intrusion and then reject the packet.

Is this possible?

Thanks!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE+gUNExQEzeXtVwzoRAgUqAJ9U48nvbRqC7++B4HlY2YhhAn0QygCfcK3E
7zS4cnq63yJTxgNfTRFMc+g=
=dntV
-----END PGP SIGNATURE-----

