From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Example on using fwmark with masks. Please help!!
Date: Fri, 12 Jan 2007 21:26:30 +0100 (CET)
Message-ID: <52633.84.123.236.132.1168633590.squirrel@www.arcoscom.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <lartc-bounces@mailman.ds9a.nl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
Content-Type: text/plain; charset="us-ascii"
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

Hi,
   could anyone provides any example about the use of ip route command to
force the use of one route using masks in the mark?

The configuration is:
   1 LAN (zlan0) iface
   N WAN (wan0 ... wanN) ifaces with static IPs and load balanced.
   iptables 1.3.7
   kernel 2.6.19.2
   iproute 2.6.19

I'm yet setting marks into packets for QoS and its working, I now want to
set some bits (OR) at the end of the mark.

For example, I want to use 0x8000 to add another mark to the packet for
routing. The packet is market yet with a QoS mark (--set-mark), 0x5 (for
example).

I need:
   1) The packet been marked with 0x8000 OR 0x0005 =3D 0x8005
   2) Route the packet with 0x8005 AND 0x8000 =3D 0x8000 over wan0 (for
example)
   3) Classify the packet with 0x8005 AND 0x0005 into wan0 1:4 class (for
example)

I know how to do this not having sense about MASKs, but ... Could anybody
put here how to do it with them?

Another question: What is the length of the mask? 16bit? 32bit?

Thanks!!
