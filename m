From: "Ryan Johnson" <rjohnson@espgroup.net>
Subject: Firewall four nics, two separate routes
Date: Mon, 26 Jan 2004 12:49:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <KMS-272302109-548@mail.espgroup.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I have a firewall with four nics, two external nics with two public ips a=
nd two internal nics with private ips (two different networks). What I wo=
uld like to do is force all traffic from each internal network to its cor=
responding external nic. I believe the only solution to this is to use ip=
route2, but I have had to luck. So traffic from internal net1 will be rou=
ted out external nic1, then the other side, internal net2 will be routed =
out the external nic2. Internal net1 traffic should never go out external=
 nic2 and internal net2 traffic should never go out external nic1.


Thank you in advance,
Ryan

Ryan Johnson
Security Architect
ESP Group


