From: <Josh.Berry@compucom.com>
Subject: RE: Exposing an internal server through an iptables firewall
Date: Thu, 14 Aug 2003 16:21:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0116BEE4@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: dmiller@amfes.com
Cc: netfilter@lists.netfilter.org

Use this command:

iptables -A PREROUTING -p tcp -m tcp -d <INTERNET_IP> --dport 25 -j DNAT
--to-destination <POSTFIX_IP:25>

-----Original Message-----
From: Daniel L. Miller [mailto:dmiller@amfes.com]=20
Sent: Thursday, August 14, 2003 3:50 PM
To: Netfilter Users
Subject: Exposing an internal server through an iptables firewall

Hi!

I'm sure this is covered SOMEWHERE - but I haven't found anything
obvious in the archives / howto's.  I'm using Debian Linux with the 2.4
kernel.

I currently have the following configuration:
  (please comment if you find this arrangement objectionable in itself!)

Internal LAN - 192.168.0.30 through 192.168.0.50
Dual-Homed Gateway (is that the right term?) -=20
    two NIC's - 192.168.0.1 and 192.168.69.2
Dual-Homed Firewall (again, whatcha call it?) -=20
    two NIC's - 192.168.69.1 and Internet Static IP

My physical connections are workstations to switch, switch to Gateway,
Gateway to Firewall, Firewall to Internet.  Should I re-route this and
run the switch directly to the Firewall, and hang the Gateway/Server off
the switch?  I value your experience.

The gateway is set up with entries in the routing table and has
forwarding enabled.

I've setup iptables on the firewall with sourceNAT and a reject anything
from the outside that isn't the result of a connection.  Works fine.

(Actually, I also have the same iptables script running on the gateway
server - probably overkill)

Postfix is running on the gateway server - works fine.

What do I need to set on the firewall/gateway to make my Postfix server
available to the internet?  I've tried:

iptables -t nat -A PREROUTING -p tcp --dport 25 -i eth1 -j DNAT --to
192.168.69.2:25

    BTW - eth1 of the firewall (and gateway too) is the=20
    "dangerous" side (internet/dmz) - eth0 is the "safe" (dmz/internal
LAN).

And variations of the same - but no go.  What am I missing?

This is really getting frustrating - mainly because I don't really
understand what I'm doing.  Using a port scanner from an external
webserver, it shows that ports 25, 80, and 10025 are closed (see below).

What am I missing?

Here's the iptables dump from both my firewall and my internal server.

*** FIREWALL IPTABLES ***

> iptables -n -v -L
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0         =20
  903 84552 ACCEPT     all  --  eth0   *       192.168.69.0/24
0.0.0.0/0         =20
    0     0 drop-and-log-it  all  --  eth1   *       192.168.69.0/24
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
67.106.235.126     state RELATED,ESTABLISHED=20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:25=20
    6   644 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
  619  290K ACCEPT     all  --  eth1   eth0    0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20
  709 49179 ACCEPT     all  --  eth0   eth1    0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
67.106.235.126     tcp dpt:25=20
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
67.106.235.126     tcp dpt:80=20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
192.168.69.2       tcp dpt:25=20
    4   240 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     all  --  *      lo      0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  *      eth0    67.106.235.126
192.168.69.0/24   =20
  900  154K ACCEPT     all  --  *      eth0    192.168.69.0/24
192.168.69.0/24   =20
    0     0 drop-and-log-it  all  --  *      eth1    0.0.0.0/0
192.168.69.0/24   =20
    6   504 ACCEPT     all  --  *      eth1    67.106.235.126
0.0.0.0/0         =20
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain drop-and-log-it (5 references)
 pkts bytes target     prot opt in     out     source
destination        =20
   10   884 REJECT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          reject-with icmp-port-unreachable=20

> iptables -n -v -t nat -L
Chain PREROUTING (policy ACCEPT 68 packets, 4258 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    2   120 DNAT       tcp  --  eth1   *       0.0.0.0/0
67.106.235.126     tcp dpt:25 to:192.168.0.2:25=20
    1    60 DNAT       tcp  --  eth1   *       0.0.0.0/0
67.106.235.126     tcp dpt:80 to:192.168.0.2:80=20
    1    60 DNAT       tcp  --  *      *       0.0.0.0/0
67.106.235.126     tcp dpt:10025 to:192.168.0.2:25=20

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
   49  2666 SNAT       all  --  *      eth1    0.0.0.0/0
0.0.0.0/0          to:67.106.235.126=20

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination=20

*** INTERNAL SERVER IPTABLE ***

> iptables -n -v -L
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
13961 2377K ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0         =20
 1998  255K ACCEPT     all  --  eth0   *       192.168.0.0/24
0.0.0.0/0         =20
    0     0 drop-and-log-it  all  --  eth1   *       192.168.0.0/24
0.0.0.0/0         =20
 7474 2121K ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.69.2       state RELATED,ESTABLISHED=20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:25=20
    1    60 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:80=20
 2333  196K drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20
    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0
0.0.0.0/0         =20
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
13961 2377K ACCEPT     all  --  *      lo      0.0.0.0/0
0.0.0.0/0         =20
  116 11809 ACCEPT     all  --  *      eth0    192.168.69.2
192.168.0.0/24    =20
 2318  709K ACCEPT     all  --  *      eth0    192.168.0.0/24
192.168.0.0/24    =20
    0     0 drop-and-log-it  all  --  *      eth1    0.0.0.0/0
192.168.0.0/24    =20
10229  840K ACCEPT     all  --  *      eth1    192.168.69.2
0.0.0.0/0         =20
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain drop-and-log-it (5 references)
 pkts bytes target     prot opt in     out     source
destination        =20
 2333  196K REJECT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          reject-with icmp-port-unreachable

> iptables -n -v -t nat -L
Chain PREROUTING (policy ACCEPT 2672 packets, 228K bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain POSTROUTING (policy ACCEPT 539 packets, 29015 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
  272 15327 SNAT       all  --  *      eth1    0.0.0.0/0
0.0.0.0/0          to:192.168.69.2=20

Chain OUTPUT (policy ACCEPT 811 packets, 44342 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Ports 25 and 80 are of course for SMTP and HTTP - I tried 10025 just to
be different.

Thanx for your help,

Daniel


