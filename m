From: "Peter Marshall" <peter.marshall@caris.com>
Subject: RST packets
Date: Wed, 11 Aug 2004 18:00:38 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <024c01c47fe6$40e03e60$49caa8c0@caris.priv>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

I am having a problem now where I am getting RST packets being blocked from
my internal network heading out to the external network.  It looks like RST
packets are used to stop a TCP connection when there is a problem.

The setup is like this:
I have a web box in my dmz that people connect to.  A mod-jk connection is
made through my firewall, and the responses are allowed back with the
standard ESTABLISHED,RELATED allow on the Forward chain.

I guess I was wondering why I was getting a bunch of RST packets and also,
why the firewall was blocking them.  Would they not be part of the
ESTABLISED-RELATED chain ?

Here are the relevant rules.
$IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPT -A FORWARD -s $WEB_BOX_IP -I eth1 -j web-int
$IPT -A web-int -d 192.168.202.168 -p tcp --dport 8009:8020 -j ACCEPT

I do have a chain for int-web ... which is used to connect to a webserver
running on it ..(and it rejects everything else).  This is the chain that
the RST packet is making it too and is then getting rejected.  However, I
did not think that the packet should reach this chain as it is related (or
establised) to the web-int connection ...

Any suggestions would be greatly appreciated.  My network set up is a DMZ
between two firewalls.  The web box is in the DMZ.  The "int" in my chains
is my internal network.  the internal network is separated form the DMZ by a
firewall.

Peter Marshall


