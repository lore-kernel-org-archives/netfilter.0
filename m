From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Query: will redundant rules gobble up firewall resources
	unnecessarily?
Date: Mon, 02 Jul 2007 14:55:31 +0100
Message-ID: <468903D3.1000603@tssg.org>
Reply-To: wfitzgerald@tssg.org
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

Dear Netfilter experts,

I have a query in relation to redundant firewall rules possibly wasting
CPU or memory usage. I would like to know if this is indeed the case.

I noticed if you have 2 or more identical rules (lets say they are
stateful rules) in a firewall table/rule-set (entered accidentally) that
when a packet matches the first of the identical rules that packet
counters are increased. Nothing unusual here. The second rule is never
executed due to the first one and no packet counter readings here
(according to iptables -L -v).

However, given that the 2 rules are stateful in nature does Netfilter
allocate memory (expecting it to be activated at some stage) to the
second stateful rule (and other identical rules) albeit a redundant rule?

regards,
Will.



- --
William M. Fitzgerald,
PhD Student,
Telecommunications Software & Systems Group,
ArcLabs Research and Innovation Centre,
Waterford Institute of Technology,
WIT West Campus,
Carriganore,
Waterford.
Office Ph: +353 51 302937
Mobile Ph: +353 87 9527083
Web: www.williamfitzgerald.org



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGiQPTIcwlebz1MmwRAnNGAJ9ed96cY55eDv1paWjrhuXK1cdp5wCg7+I8
CaPNM2L7QoC7thdrkARgI7w=
=TlaD
-----END PGP SIGNATURE-----

