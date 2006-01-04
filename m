From: "P. Harlow" <wolf-r1@wispertel.net>
Subject: RE: VPN rules
Date: Wed, 4 Jan 2006 16:25:54 -0700
Message-ID: <7027.41769277981$1136417209@news.gmane.org>
References: <bb8a5cd0601041418t1645bf5cke057e6e371280c45@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bb8a5cd0601041418t1645bf5cke057e6e371280c45@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

It depends on the type of VPN you are using.

IPSec based VPNs typically use:

UDP 500 - IPSec negotiation
IP 51 - Authentication Header (AH) for IPSec negotiation
IP 50 - IPSec data

PPTP based VPNs typically use:

IP 47 - General Routing Encapsulation (GRE)PPTP data channel
TCP 1723 - PPTP control channel

You are going to want to figure out which type of VPN you are using and
allow for those ports. I would assume that since you're getting
authentication requests with port 500 open however your TCP 500 causes =
me to
wonder what type of VPN you have.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Eduardo =
Ukstin
Sent: Wednesday, January 04, 2006 3:18 PM
To: netfilter@lists.netfilter.org
Subject: VPN rules

Hi

I=B4m trying to configure a subnet into my network to access a VPN
outside here. The vpn uses port 500, just the forward rules doesn=B4t
seem to work, my rule was this

iptables -A INPUT -i eth1 -p tcp -s xx.xx.xx.xx/24 --dport 500 -j
ACCEPT (after a established, related rule)

and

iptables -A FORWARD -i eth1 -s xx.xx.xx.xx/24 -p tcp --dport 500 -j
ACCEPT (also, after a established, related rule)

I think its enough, and sometimes the stations could connect very
well, but now, the vpn client start the connection and after the user
and password requisition he starts to try a reconnection.

I read something about protocol 47 (option -p 47) I need to use it?
Need some special patch in iptables or what?

Thanks a lot

--
Eduardo Ukstin
GNU/Linux User #328388



