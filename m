From: "Omar Garcia" <omar.garcia@fractalia.biz>
Subject: Connlimit problem
Date: Wed, 26 Jan 2005 15:26:47 +0100
Message-ID: <001801c503b3$115416c0$910010ac@coco>
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

Hi list,

I try to configurate a transparent bridge with QoS
I have a pentium computer with two network cards, kernel 2.6.8 with =
IMQ,WRR,IPP2P and other more patched.

The problem is when i try to include the following rule:

 iptables -A PREROUTING -t mangle -m connlimit --connlimit-above 100 -j =
DROP

If i tried in two steps, i confirm that the module connlimit is =
installed:

BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m connlimit
    iptables v1.2.11: You must specify `--connlimit-above'
    Try `iptables -h' or 'iptables --help' for more information.

   =20
 BridgeWall:/home/omar# iptables -A PREROUTING -t mangle -m connlimit =
--connlimit-above 12 -j DROP
     iptables: No chain/target/match by that name
Any idea????

Thanks in advange.

Regards
