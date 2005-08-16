From: Leonardo Marques <surf3r0@gmail.com>
Subject: Split external requisitions between two internet connections
Date: Tue, 16 Aug 2005 15:18:28 -0300
Message-ID: <eb5ae9cc05081611187210c11b@mail.gmail.com>
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
To: Lista IPTABLES <netfilter@lists.netfilter.org>

Hi people,

I have a linux box which will have three ethernet interfaces:

eth0 connected with the LAN
eth1 connected with the internet across ISP1
eth2 connected with the internet acorss ISP2

So, i need do it:

All internet requisition for a external 80 port (http) go out to the
internet across the eth1, and all others requisions, for all others
external ports, go out to the internet across the other internet
connection (eth2).

How can I do it?

Thanks for all attention!
[]s
=20
--=20
------------------------------
Leonardo Marques
http://www.analyx.org
------------------------------

