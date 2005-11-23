From: Octavian Clinci <lyncks@gmail.com>
Subject: SNAT tunnel
Date: Wed, 23 Nov 2005 11:36:31 +0200
Message-ID: <bf6a125b0511230136i63bafe2ct81a2900dabe5b491@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

hiya guys
 im having an issue @ my home.
 setup is as this:
 i have a gateway with debian and 2 computers in the local LAN.
 on the gw i have internet through let's say ISP1 and a public IP.
 due to the fact that the internet was not that hot outside the local
ISPs, i decided to create a tunnel to another ISP, let's call it ISP2

 the startup script is as follows:

  route del default gw <gw isp1>
  /sbin/modprobe ip_gre
  /sbin/ip tunnel del net
  /sbin/ip tunnel add mode gre net local <eth0 isp1 ip> remote <isp2
tunneling machine>
  /sbin/ifconfig net <public ip assigned by ISP2 to me> pointopoint <gw isp=
2>
  /sbin/ifconfig net up
  /sbin/route add -host <isp2 tunneling machine> gw <isp1 gw>
  /sbin/iptables -t nat -I POSTROUTING -s 0/0 -o net -j SNAT
--to-source <public ip assigned by ISP2 to me>
  route add default gw <gw isp2>

 was sharing this connection to the other two computers through a SNAT
to the ip given by isp2.
 everything was working ok, until yesterday, when i couldnt resolve
any hosts on the LAN machines, and not on the server.
 i solved that on the server by adding a static route to the isp1 ns
through the isp1 gw, but that didnt solve the problem for the windows
machines.
 on the local gw and the windows machines i have as NSes the isp1
ones, and they worked just fine until yesterday.
 when i move the connection to the ISP1 and not through the tunnel,
and snat to the public isp1 address i have, everything works.
 any ideas?

 p.s. sorry about my english!

