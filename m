From: David Magda <dmagda+netfilter@magda.ca>
Subject: ACK being dropped
Date: Fri, 11 Jun 2004 04:23:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040611082324.GA893@number6.magda.ca>
Reply-To: David Magda <dmagda+netfilter@ee.ryerson.ca>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm forwarding this message that I posted the the LARTC mailing list
here as well since I'm pressed for time and am looking for as much
feedback to get this working. (I'm not (currently) subscribed so
please do a CC to the Reply-To header if possible.)

The message below is a clarification of an early e-mail that I
sent. The original has some more information (e.g., which commands I
ran in what order) and is available online at:

http://mailman.ds9a.nl/pipermail/lartc/2004q2/012664.html

I also posted it to comp.os.linux.networking
(<863c53xef1.fsf@number6.magda.ca>):

http://groups.google.ca/groups?selm=863c53xef1.fsf%40number6.magda.ca

----- Forwarded message from David Magda <dmagda+lartc@ee.ryerson.ca> -----

On Thu, Jun 10, 2004 at 03:35:49PM -0400, David Magda wrote:
[...]
>                   ______
>                   |    |- ppp0 -- Dynamic IP (PPPoE on eth2)
> Internal---- eth0 | GW |
>                   |____|- eth1 -- Static IP -> Static's GW
>
[...]
> Using tcpdump I get the following results. This is listening on
> eth1 as I try to SSH to the destination from an internal box (using
> lynx to connect to the same destination results in a web page):
[...]

Examing the output of tcpdump a bit more closely, it seems that the
host where the SSH client is trying to connect from never gets the
ACK in the TCP setup handshake. It's being sent by the server, it's
received on the external interface of the the gateway, but it never
makes it to the internal network.

The client machine keeps trying to setup a TCP connection, but never
receives the ACK. This is the interface (the client keeps trying to
setup the TCP connection):

tcpdump: listening on eth0
02:26:10.873080 [SSH client].37705 > [SSH server].22: S        \
    769441999:769441999(0) win 5840 <mss 1460,sackOK,timestamp \
    6184875090,nop,wscale 0> (DF) [tos 0x10]
02:26:13.866409 [SSH client].37705 > [SSH server].22: S        \
    769441999:769441999(0) win 5840 <mss 1460,sackOK,timestamp \
    6184878090,nop,wscale 0> (DF) [tos 0x10]

The external interface is getting the ACK (not from the same session,
but gets the point accross):

02:26:11.527294 [GW Ext. IP].ssh > [SSH server].49161: P       \
    224:336(112) ack 1 win 10944 <nop,nop,timestamp 557609690  \
    1169951> (DF) [tos 0x10]

The ACK for the TCP connection setup is being sent by the server:

tcpdump: listening on fxp0
02:26:10.933176 [SSH server NATed].37705 > [SSH server].22: S  \
    769441999:769441999(0) win 5840 <mss 1400,sackOK,timestamp \
    6184875090,nop,wscale 0> (DF) [tos 0x10]
02:26:10.933226 [SSH server].22 > [SSH server NATed].37705: S  \
    1054657654:1054657654(0) ack 769442000 win 65535           \
    <mss 1452,nop,wscale0,nop,nop,timestamp 1071666 618487509> (DF)
02:26:13.923678 [SSH server].22 > [SSH server NATed].37705: S  \
    1054657654:1054657654(0) ack 769442000 win 65535           \
    <mss 1452,nop,wscale0,nop,nop,timestamp 1071966 618487509> (DF)
02:26:13.926659 [SSH server NATed].37705 > [SSH server].22: S  \
    769441999:769441999(0) win 5840 <mss 1400,sackOK,timestamp \
    6184878090,nop,wscale 0> (DF) [tos 0x10]
02:26:13.926712 [SSH server].22 > [SSH server NATed].37705: S  \
    1054657654:1054657654(0) ack 769442000 win 65535           \
    <mss 1452,nop,wscale0,nop,nop,timestamp 1071966 618487809> (DF)
02:26:19.923038 [SSH server].22 > [SSH server NATed].37705: S  \
    1054657654:1054657654(0) ack 769442000 win 65535           \
    <mss 1452,nop,wscale0,nop,nop,timestamp 1072566 618487809> (DF)

I've tried doing an SSH connection to multiple hosts and it's always
the same thing.

Here are my iptable rules:

gw2:~# iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere
SNAT       all  --  anywhere             anywhere  to:<Static IP>

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

gw2:~# iptables -L -t mangle
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
MARK       tcp  --  192.168.108.0/24     anywhere           tcp \
    dpt:ssh MARK set 0x4

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

IP rule list:

gw2:~# ip rule list
0:      from all lookup local
32765:  from all fwmark        4 lookup 4
32766:  from all lookup main
32767:  from all lookup default

Routing tables:

gw2:/home/mpathix# ip route show table main
<PPPoE peer> dev ppp0  proto kernel  scope link  src 69.158.104.154
63.250.109.128/29 dev eth1  proto kernel  scope link  src
    <Static IP>
192.168.108.0/24 dev eth0  proto kernel  scope link  src
    <GW's Internal IP>
default via <PPPoE peer> dev ppp0

gw2:/home/mpathix# ip route show table 4
<PPPoE peer> dev ppp0  proto kernel  scope link  src 69.158.104.154
63.250.109.128/29 dev eth1  proto kernel  scope link  src
    <Static IP>
192.168.108.0/24 dev eth0  proto kernel  scope link  src
    <Static IP>
default via <Static's GW>  dev eth1

So basically packets are getting out, but they're not getting back
in.

Any suggestions?

----- End forwarded message -----

