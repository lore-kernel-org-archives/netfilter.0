From: ngabor@szbk.u-szeged.hu
Subject: iptables redirect
Date: Sun, 15 May 2005 17:58:26 +0200
Message-ID: <1116172706.428771a2f1de3@rosi.brc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi!

Main firewall PREROUTING chain:

ACCEPT     all  --  192.168.16.x1       0.0.0.0/0
ACCEPT     all  --  192.168.16.x2        0.0.0.0/0
...
DNAT       tcp  --  0.0.0.0/0            x.y.z.v       multiport dports
80,22,443 to:192.168.32.x
REDIRECT   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80 r=
edir
ports 80

Internet enabled 192.168.16.x1 (...x2), other IPs disabled and to answer
redirected main http-server (main homepage).
If pub.ips send http to x.y.z.v then return 192.168.32.x http-server =3D>=
 OK.
If 192.168.16.x1 (...x2) priv.ips send http to x.y.z.v then answer main
redirected http-server. WHILE? Top accept all packages from 192.168.16.x1
(...x2).
WHILE?

by gabor

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

