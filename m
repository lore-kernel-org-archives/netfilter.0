From: Carles Xavier Munyoz =?iso-8859-1?q?Bald=F3?= <carles@descom.es>
Subject: Problems with patch-o-matic (submitted).
Date: Wed, 16 Oct 2002 10:40:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210161040.18815.carles@descom.es>
Reply-To: carles@descom.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
I'm having problems when I use the patch-o-matic system to patch the=20
kernel-2.4.19 source.=20

I have obtained the last netfilter directory from the CVS repository usin=
g the=20
procedure explained in the Netfilter Extensions HowTo.=20
When I run the command:
=2E/runme --batch submitted/
from the patch-o-matic directory all patches apply fine except the=20
submitted/newnat-assertfix.patch and=20
submitted/newnat-changeexpect-lockfix.patch

[...]
Testing... newnat-assertfix.patch NOT APPLIED (7 rejects out of 7 hunks)
The submitted/newnat-assertfix patch:
   Author: Martin Josefsson
   Status: Submitted to the kernel at 2.4.20-pre10 time

   This patch fixes some erroneously-printed ASSERT statements when
   netfilter debugging was switched on.  Please note that the running cod=
e
   was never wrong, just the debug macros ;)

Testing patch submitted/newnat-assertfix.patch...
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.
[...]
Testing... newnat-changeexpect-lockfix.patch NOT APPLIED (2 rejects out o=
f 2=20
hunks)
The submitted/newnat-changeexpect-lockfix patch:
   Author: Martin Josefsson
   Status: Submitted to the kernel at 2.4.20-pre10 time

   This patch fixes a locking bug in ip_conntrack_change_expect() of newn=
at.

Testing patch submitted/newnat-changeexpect-lockfix.patch...
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.
[...]


If I run again the command:
=2E/runme submitted/
now arise problems with  the patch=20
submitted/ip_conntrack_protocol_destroy.patch, but this patch has been=20
applied well in the previous run.
[...]
Testing... ip_conntrack_protocol_destroy.patch NOT APPLIED (6 rejects out=
 of 6=20
hunks)
The submitted/ip_conntrack_protocol_destroy patch:
   Author: Harald Welte <laforge@gnumonks.org>
   Status: Pending for kernel inclusion

   This adds support for ip_conntrack_protocol_unregister(), needed if
   layer four protocol helpers (GRE, ...) are implemented as modules.

- -----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch submitted/ip_conntrack_protocol_destroy.patch...
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.
[...]

but the fault patches (submitted/newnat-assertfix.patch,=20
submitted/newnat-changeexpect-lockfix.patch) in the first run apply now w=
ell.

Am I doing something wrong ?
Is there any problem in the current patch-o-matic version ?

Greetings.
- ---
Carles Xavier Munyoz Bald=F3
carles@descom.es
Descom Consulting
Telf: +34 965861024
Fax: +34 965861024
http://www.descom.es/
- ---
-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.8

iQA/AwUBPa0l7zvYAf7VZNaaEQL9CQCguQxiDoeCT97Z87iErftChtB/vQsAoMMm
+PCvKHIbK57tOFKmfl8VSmvT
=3DctbB
-----END PGP SIGNATURE-----


