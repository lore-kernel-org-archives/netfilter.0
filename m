From: "Jonathan" <phonic@antisocial.nu>
Subject: Route packets from an interface to another
Date: Fri, 9 Sep 2005 21:15:40 +0200 (CEST)
Message-ID: <1197.83.227.26.235.1126293340.squirrel@webmail.2lug.se>
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

Hello,
I have the following interface configuration on two boxes:
box1: eth0:5 192.121.234.213 netmask 255.255.255.240 broadcast
192.121.234.223
box2: lo:0 192.121.234.213 netmask 255.255.255.255
between box1 and box2 I have a OpenVPN tunnel (endpoints 10.1.0.1 and
10.1.0.2).

I want to forward all packages on box1 with destination 192.121.234.213 t=
o
tun0 (10.1.0.1), so they pass through the tunnel and comes to box2. I als=
o
want to forward all packages from tun0 (10.1.0.1) to eth0:5
(192.121.234.213). How do I do this with iptables?

Regards
Jonathan


