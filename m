From: Cory Visi <merlin@phear.lwz.org>
Subject: Re: Static compile issues
Date: Fri, 6 Jun 2003 19:45:22 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.30.0306061942130.21233-200000@phear.lwz.org>
References: <Pine.LNX.4.30.0305311905310.29484-100000@phear.lwz.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="739787072-1170677385-1054943122=:21233"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.30.0305311905310.29484-100000@phear.lwz.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--739787072-1170677385-1054943122=:21233
Content-Type: TEXT/PLAIN; charset=US-ASCII

A couple people have emailed me and the list regarding this issue, so I
thought I'd post for everyone's benefit.

Martin Josefsson <gandalf@wlug.westbo.se> was absolutely correct. The
Invalid Argument problem can be fixed by recompiling iptables with the new
linux kernel headers. That means /usr/include/linux needs to link to your
kernel tree, NOT the glibc headers (bad distributions!)

As for my iptables compile errors, I fixed that with a patch, which I
attached. I'm sure it's something that's already been fixed, but there's
no new patch-o-matic release, so no harm in posting. It was an error
caused by the "talk" protocol connection tracking.

Enjoy!
Cory Visi


--739787072-1170677385-1054943122=:21233
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="124_ipt-talk-conntrack-fix.patch"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.30.0306061945220.21233@phear.lwz.org>
Content-Description: 
Content-Disposition: attachment; filename="124_ipt-talk-conntrack-fix.patch"

ZGlmZiAtTmF1ciBsaW51eC0yLjQuMjAtb3JpZy9pbmNsdWRlL2xpbnV4L25l
dGZpbHRlcl9pcHY0L2lwX2Nvbm50cmFja190YWxrLmggbGludXgtMi40LjIw
L2luY2x1ZGUvbGludXgvbmV0ZmlsdGVyX2lwdjQvaXBfY29ubnRyYWNrX3Rh
bGsuaA0KLS0tIGxpbnV4LTIuNC4yMC1vcmlnL2luY2x1ZGUvbGludXgvbmV0
ZmlsdGVyX2lwdjQvaXBfY29ubnRyYWNrX3RhbGsuaAkyMDAzLTA2LTAxIDIw
OjIwOjA3LjAwMDAwMDAwMCAtMDQwMA0KKysrIGxpbnV4LTIuNC4yMC9pbmNs
dWRlL2xpbnV4L25ldGZpbHRlcl9pcHY0L2lwX2Nvbm50cmFja190YWxrLmgJ
MjAwMy0wNi0wMSAyMDozMjo0OC4wMDAwMDAwMDAgLTA0MDANCkBAIC0yLDkg
KzIsNyBAQA0KICNkZWZpbmUgX0lQX0NPTk5UUkFDS19UQUxLX0gNCiAvKiBU
QUxLIHRyYWNraW5nLiAqLw0KIA0KLSNpZm5kZWYgX19LRVJORUxfXw0KLSNl
cnJvciBPbmx5IGluIGtlcm5lbC4NCi0jZW5kaWYNCisjaWZkZWYgX19LRVJO
RUxfXw0KIA0KICNpbmNsdWRlIDxsaW51eC9pbi5oPg0KICNpbmNsdWRlIDxs
aW51eC9uZXRmaWx0ZXJfaXB2NC9sb2NraGVscC5oPg0KQEAgLTEzOCw2ICsx
MzYsOCBAQA0KICNkZWZpbmUgU0VMRUNUSVZFX1JFRlVTQUwgMTEJLyogVXNl
ciBGaWx0ZXIgcmVmdXNhbC4gICAgICAgICAgICAgICAqLw0KICNkZWZpbmUg
TUFYX1JFU1BPTlNFX1RZUEUgMTEJLyogTWFrZSBzdXJlIHRoaXMgaXMgdXBk
YXRlZCAgICAgICAgICAqLw0KIA0KKyNlbmRpZiAvKiBfX0tFUk5FTF9fICov
DQorDQogLyogV2UgZG9uJ3QgcmVhbGx5IG5lZWQgbXVjaCBmb3IgdGFsayAq
Lw0KIHN0cnVjdCBpcF9jdF90YWxrX2V4cGVjdA0KIHsNCg==
--739787072-1170677385-1054943122=:21233--

