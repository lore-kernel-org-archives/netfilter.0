From: Aleksandr Guidrevitch <pillgrim@tut.by>
Subject: is this correct ?
Date: Fri, 06 Feb 2004 14:01:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <402381FC.4000703@tut.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi All !

I'm a newbie in iptables.
I have a linux box with ppp connection to internet (dynamic IP),
eth0 192.168.0.1 and a Windows box 192.168.0.3 connected to eth0.
I strive to allow *everything* from my home network,
and disallow anyone to connect to my home network, eg.
drop all the incoming connections to my ppp0 interface.

Can anyone say if my config below is correct (/etc/sysconfig/iptables) ?
Well, it seems to work as expected, but it is so simple,
may be I'm missing some important security points ?


------
*nat
-A POSTROUTING -o ppp0 -j MASQUERADE
COMMIT

*mangle
COMMIT

*filter
-A INPUT -i ppp0 -p icmp -j ACCEPT

# disabling not established and not related connections
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -i ppp0 -j DROP

:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
COMMIT



