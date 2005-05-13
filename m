From: ngabor@szbk.u-szeged.hu
Subject: redirect
Date: Fri, 13 May 2005 16:28:04 +0200
Message-ID: <1115994484.4284b97466b54@rosi.brc>
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

Hi.

Main firewall PREROUTING Chain:
ACCEPT     all  --  192.168.10.x0       0.0.0.0/0
ACCEPT     all  --  192.168.10.x1       0.0.0.0/0
...
DNAT       tcp  --  0.0.0.0/0            x.y.z.v       multiport dports
80,22,8180 to:192.168.30.y
REDIRECT   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80 r=
edir
ports 80

192.168.10.x0, 192.168.10.x1 internet enabled,
other internal ip 192.168.10._ redirect main server 80 port.
server x.y.z.v DNAT DMZ,
if 192.168.10.x0, 192.168.10.x1 send http: to x.y.z.v pub.ip-address,
then send my REDIRECTED SERVER.
WHILE?

by gab





----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

