From: "Mark Ayad" <mark@javamark.com>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 17:29:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <005801c22826$9490efb0$0300a8c0@W2KP01>
References: <001601c22819$406b6a30$0300a8c0@W2KP01> <200207101422.g6AEMi812683@vulcan.rissington.net> <273150000.1026311894@wookie.shorewall.net> <200207101457.g6AEvw812845@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Tom Eastep <teastep@shorewall.net>, netfilter@lists.samba.org

Antony

I gave

$IPTABLES -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j DNAT --to
192.168.0.3

a whirl but no joy, although the onnection request tqkes muck longer to time
out ?

So we have

[198.168.0.3] make a request on [198.168.0.1] the gateway  which is MASQ to
[a.b.d.c]  the ext IP of the firewall. The DNS lookup returns [a.b.d.c]
which is Postrouted DNAT mapped to [198.168.0.3]

Am I right I thinking that the source address is that of the gateway
[198.168.0.1] , which is why I get no response ?

echo "   clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

$IPTABLES -A INPUT -p tcp --syn --destination-port 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp --syn -j DROP

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j
DNAT --to-destination 192.168.0.3:80

$IPTABLES -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j DNAT --to
192.168.0.3

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

echo -e "\nrc.firewall-2.4 v$FWVER done.\n"

Where where a.b.c.d is the ext IP of the firewall.

Still won't connect from an IP request on 192.168.0.3 ?

It requires a rule simply to act as a loopback but first going by the
external ip to obtain the external dns IP which is a.b.c.d.





