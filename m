From: "Mark Ayad" <mark@javamark.com>
Subject: Destination Nat Loopback Clarified !
Date: Wed, 10 Jul 2002 18:29:06 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <00e201c2282e$e9e12bd0$0300a8c0@W2KP01>
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
To: netfilter@lists.samba.org

I though I'd try and clarify the problem.

----------------------
[A]
 IP    192.168.0.3
 MASK: 255.255.255.0
 GATE: 192.168.0.1

HTTP Server
192.168.0.3 :80
---------------------
        | 192.168.0.3 [mask 255.255.255.0]
        |
        |
        |
        | eth1 192.168.0.1 [mask 255.255.255.0]
----------------------
[B]
  MASQ Gateway
  Firewall
----------------------
  |eth0 A.B.D.C DHCP
  |
  |
  |
  Internet

#######################################################
#Working MASQ Gateway + Port Forwarding on 80 to 192.168.0.3

EXTIF="eth0"
INTIF="eth1"

$IPTABLES -A INPUT -p tcp --syn --destination-port 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp --syn -j DROP

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG


$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport \
80 -j DNAT --to-destination 192.168.0.3:80

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
#######################################################

What I can't do and I've tried all your suggestions which on the face of it
might actually be more complex than it first seems:

[A] both the HTTP server 192.168.0.3:80 and a Client that connects to the
gateway via eth1 192.168.0.1 [B] which is a MASQ gateway that routes
everything to the DHCP assigned IP A.B.D.C on eth0.

The DHCP public IP A.B.C.D can be reached via a Public name. So back to my
original problem [that ain't going away] Host [A] in a web browser whishes
to connect to itself but it uses the public IP address a.k.a A.B.D.C which
is prerouted to 192.168.0.3:80.

So Infact we have a glorfied LOOP-BACK-ADAPTER do we not ? Futile I know,
but the only other option to test that the HTTP server 192.168.0.3:80  on A
can be reached by some one on the internet using the DHCP assigned IP
A.B.D.C on eth0 is to use a anonymous web proxy to simulate a true ouside
request.

This has nearly go me licked, and so far there is no answer ?










