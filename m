From: "Christian E. =?iso-8859-1?q?L=F3pez?= Finnberg" <christian@finnberg.net>
Subject: Imposible configuration?
Date: Fri, 14 May 2004 16:22:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405141622.37892.christian@finnberg.net>
Reply-To: christian@finnberg.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all, Please I need some help...

I have a server with kernel 2.6.6 (netfilter activated), LAN 192.168.0.x/24=
=20
and 15 ISDN dial-up interfaces IPPPx. The ISDN interfaces are configured to=
=20
be dial-on-demand and they connect to 15 different win98 machines.=20

My nightmare started when I realized that windows 98 RAS server always assi=
gns=20
the same IPs (192.168.55.1 to the Server and 192.168.55.2 to the client). I=
=20
want to automaticaly connect to any of this machines (so the source=20
connection is in my own LAN).I assigned in my LAN a "virtual" IP to each=20
remote PC (192.168.2.1, 192.168.3.1, ... and so on) and create the apropiat=
e=20
routes to it:

My ISDN interfaces looks like this:
ippp0     Link encap:Point-to-Point Protocol
          inet addr:192.168.55.2  P-t-P:192.168.55.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1
          collisions:0 txqueuelen:30
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

And My routes are this way:
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
192.168.2.1     0.0.0.0         255.255.255.255 UH    0      0        0 ipp=
p0
192.168.3.1     0.0.0.0         255.255.255.255 UH    0      0        0 ipp=
p1
192.168.4.1     0.0.0.0         255.255.255.255 UH    0      0        0 ipp=
p2
192.168.5.1     0.0.0.0         255.255.255.255 UH    0      0        0 ipp=
p3
192.168.6.1     0.0.0.0         255.255.255.255 UH    0      0        0 ipp=
p4
=2E..

So the only resting step is to translate 192.168.x.1 to 192.168.55.1 in the=
=20
apropiate interface (In a POSTROUTE way), but I dont
see a form to do this. :-(

It is there any way of do this with netfilter or Linux?.=20
I saw an old document that do something like this, but it used obsolet=20
ipnatadm tool.


Many thanx,

	Christian E. L=F3pez Finnberg
	Las Palmas de Gran Canaria.

