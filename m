From: c0g <c0g@wp.pl>
Subject: "ip_conntrack_core: Frag of proto 17." error and memory leak?
Date: Mon, 15 Sep 2003 18:43:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F65EC33.2060906@wp.pl>
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

Hi,
I'm getting this error, my kern.log is flooded, it is logged many
hundred of thousands times. I read in ip_conntrack_core.c it should
"never happen" (so it's kind of assertion). Why does this assertion fail?

I'm using 2.4.22 kernel with CVS p-o-m 20030907. I'm using only
following major netfilter patches:

TCPLAG.patch
ipt_REJECT-fake-source.patch
raw.patch

and some minor:

39_ip_conntrack-proc.patch
40_nf-log.patch
54_ip_nat-macro-args.patch
58-ip_conntrack-macro-args.patch
59_ip_nat_h-unused-var.patch
60_nat_tftp-remove-warning.patch
61-remove-memsets.patch
63_getorigdst-tuple-zero.patch
74_nat-range-fix.patch
ip_ct_refresh_optimization.patch

I made rule that blocks fragments, but it doesn't stop messages (perhaps
because the check is performed before rules are evaluated).

Also, I suppose there is big kernel memory leak that happen about 12-24
hours after boot. It eats up to 40 MB of RAM memory in few seconds. If
someone is interested I made some graphs of vmstat (excel) at
http://ng.pl/~jp/vmstat-n5/
Could it be caused by failed "Frag of proto" assertion?

Is there someone who had this problem? And solved it?
Please give me some pointers what should I do.

- --
c0g@wp.pl
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/ZewzPqmVt5WhbA8RAq3HAJ9Ahvz19BQNE4MXhLxzCyIuE4fqCwCfUwaw
eEhLSl0iX7j9KZr8kfsPIZ8=
=AiO4
-----END PGP SIGNATURE-----


