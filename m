From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: updated patch-o-matic
Date: 07 Apr 2003 18:02:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049731335.26438.160.camel@tux.rsn.bth.se>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Hi all,

patch-o-matic has been reworked a bit, it still looks about the same but
it has some new features.

* Dependency support
* Faster
* Patches in userspace/ now applies again
* Batch testing (--batch --test)

So please test it (from cvs, the snapshots doesn't contain the latest
fixes yet) and report success / failures to me. There's probably some
dependencies still missing that I havn't found yet.

All dependencies assume that _everything_ in pending has been applied.
This is not checked as it would be quite slow, there's a fair bunch of
these required patches.
(./runme --batch pending)

If you don't apply everything in pending and get failures when trying to
add patches, I don't want to hear about it :)

-- 
/Martin

