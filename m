From: "Justin Booth" <jbooth@ccbill.com>
Subject: Internal connection to an External port forwarded ip.
Date: Mon, 24 Mar 2003 02:23:13 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005301c2f1e6$fed1ce50$3500000a@WORKSTATION>
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
To: netfilter@lists.netfilter.org

Hi,

    I'm not currently part of the mailing list so please carbon me on any
replies.   The current configuration is:

Firewall (2 interfaces):
    eth0: a.b.c.d
    eth0:1 a.b.c.e  ( e = d+1 ... I got a small netblock of about 5 ip's)
    eth1: 192.168.0.1

Internal Web Server (1 interface):
    eth0: 192.168.0.2

a.b.c.d and a.b.c.e is a public IP address.

Current Rules I'm useing are this:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source a.b.c.d
iptables -t nat -A PREROUTING -i eth0 -d a.b.c.e -p tcp --dport 1000 -j
DNAT --to-destination 192.168.0.2
iptables -t nat -A PREROUTING -i eth0 -d a.b.c.e -p tcp --dport 80 -j
DNAT --to-destination 192.168.0.2

Everything looks like it's fine and dandy, from the outside of eth0
everything is fine. I can connect to both port 1000 and port 80 on eth0:1
from any outside source. I have another internal machine on 192.168.0.3. The
problem I am currntly haveing  is that the 192.168.0.3 machine cannot
connect to the forwarded ports on eth0:1 (a.b.c.e) interface, ports 1000 and
80. All I seem to get is a "Connection Refused" unless I add the rule:

iptables -t nat -A PREROUTING -i eth1 -d a.b.c.e -p tcp --dport 80 -j
DNAT --to-destination 192.168.0.2

In which case I get a hung connection on "SYN_SENT" with incomming
connection to the 192.168.0.2 machine.

any help would greatly be appreciated.

Thanks in advance,
    Justin Booth
    jbooth@ccbill.com


