From: "Darryl Romano" <dromano@vmware.com>
Subject: IP conntrack VPN routing issue.
Date: Thu, 20 Jul 2006 09:37:27 -0700
Message-ID: <882A4B7A51024043B9E5EA13382DF211CC9A82@PA-EXCH03.vmware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Cc: brian@game-sat.com

The scenario I am trying to pull off, in theory is rather simple I'd =
assume.=A0
I must be missing something small.

What I am trying to do is,=A0=A0 route a public IP over a VPN to the =
gateway of
the other end of the VPN.=A0=20

The following URL contains a diagram of what I am trying to do.

http://www.flukex.com/network/network.jpg

The Office computer contains the network 72.232.50.42-46
The VPN ip's are=A0=20
         Office (tap0) 30.20.1.1=20
         Home router (tap0) 30.20.1.2

I would like to route 72.232.50.45 over the VPN to the home router.

Using the following rule on the "office" router,=A0 I can get the =
packets to
get to the home router 30.20.1.2.

iptables -t nat -A PREROUTING -i eth0 -d 72.232.50.45 -j DNAT
--to-destination 30.20.1.2

I see clearly that the packets are in fact reaching 30.20.1.2 (home =
router).=20

The problem at this point is that the packets, seeing as they have =
public
source IP's are then routing out the default gateway on the home router,
rather then going back out on the VPN path as I would like it to do.

I guess the overall question is, how can I make it so that packets =
coming in
on one interface go back out on the exact same interface regardless of =
the
default gateway.

Once this if figured out,=A0 I can handle the routing to the actual =
internal
network myself.

I am suspecting some sort of configuration relying on connection =
tracking is
required.=A0 I just cannot figure out how.

Any help would be grateful.

Thanks.
Darryl Romano




