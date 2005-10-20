From: Roberto Ferrari <rferrari@mbigroup.it>
Subject: match n packets every m
Date: Thu, 20 Oct 2005 17:22:48 +0200
Message-ID: <4357B648.90700@mbigroup.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,
I'm trying to find a way to match _n_ ip packets every _m_
I've tryied with the nth extension, but I've not been able to obtain
this thing.
I've seen that I could insert a rule with "--packet x" for m times, if
I've specifyied "--every m", but I'd like to follow some other way, more
flexible.
Could someone kindly let me know if there is a smart way to do it?
Thank you a lot,

Roberto Ferrari
- --


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDV7ZI0xokq8z7B1ARAoHDAJ0VS+FkfFyegUTJNu5LrgH/yoeufgCgnTFA
R9RgU0xBHPr3acuBoYtWdG8=
=Lhp8
-----END PGP SIGNATURE-----

