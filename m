From: "Justin Albstmeijer" <justin@VLAMea.nl>
Subject: iptable marking and iproute2
Date: Tue, 11 Nov 2003 14:15:19 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33396.62.58.0.190.1068556519.squirrel@wmail.websystems.nl>
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


Hi,

I have a question on iptable marking and iproute2.
For testing I created the following script.
What I expect is when removing the default route on my client (route del
default gw 192.168.4.1), http request would still work using the gateway
defined at the routing table TEST.

This is not working.
I only get debug messages before I remove the default gateway.
After removing the default gateway it is not possible to access http
servers and no debug messages are added to the messages file.

What am I missing here?

-----------------------------------------------------------------
CHAIN=3DPREROUTING

iptables -A $CHAIN -t mangle -p tcp --dport 80  -j MARK --set-mark 1

iptables -t mangle -A $CHAIN -m mark --mark 1 -j LOG --log-level DEBUG
--log-prefix "fwmark 1:"

ip rule add fwmark 1 table TEST
ip route add default via 192.168.4.1 table TEST
--------------------------------------------------------------------

