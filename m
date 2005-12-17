From: TheGesus <thegesus@gmail.com>
Subject: Linux kernel 2.6.14.4
Date: Sat, 17 Dec 2005 14:15:10 -0500
Message-ID: <5e70f6530512171115n56050224w4a1740c188268715@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>

Is this something to be concerned about?

[PATCH] NETLINK: Fix processing of fib_lookup netlink messages

The receive path for fib_lookup netlink messages is lacking sanity
 checks for header and payload and is thus vulnerable to malformed
 netlink messages causing illegal memory references.


http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.14.4

