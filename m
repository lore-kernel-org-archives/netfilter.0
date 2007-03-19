From: Dan Purcell <dpurcell@nitrosecurity.com>
Subject: Specifying more than one IP address per rule
Date: Mon, 19 Mar 2007 16:05:51 -0600
Message-ID: <45FF093F.10301@nitrosecurity.com>
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

Is there a way (such as an iptables match) that allows one to specify
more than one IP address for one rule?  I have in mind something like
the multiport patch -- allowing the user to specify multiple tcp / udp
ports per rule.  For example, I have the following ruleset that I would
like to convert into one rule:

iptables -N BADGUYS
iptables -A BADGUYS -s 192.168.10.1    -j RETURN # 192.168.10.1 not bad
iptables -A BADGUYS -s 192.168.10.0/24 -j DROP
iptables -A BADGUYS -s 192.168.11.2    -j DROP
iptables -A BADGUYS -s 192.168.11.3    -j DROP
iptables -A BADGUYS -s 192.168.11.6    -j DROP

I would like something like

iptables -A BADGUYS -m multiip --srclist
[!192.168.10.1,192.168.10.0/24,192.168.11.2,192.168.11.3,192.168.11.6]
- -j DROP

- --

- --------------------------------------------------------------
Dan Purcell, Software Engineer     dpurcell@nitrosecurity.com
NitroSecurity, Inc.                            (208) 552-5332
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFF/wk/Tqu8TzII/vURAnu7AKCGQrWo5WQL9NqQxnq+pcR+GFCY7gCg5ul9
hXek3Rza6Hgtd/xslOtqryY=
=kwdw
-----END PGP SIGNATURE-----


