From: methodaut@netscape.net (Thomas Meindl)
Subject: iptables, portforward, DNAT, SNAT
Date: Thu, 31 Oct 2002 10:33:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EC01717.7583E8B5.03240133@netscape.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I have a decent problem that started spreading out in an unconvinient way -=
 for now it simply takes to much time to get solved;
like most of the time it is an simple problem
here we have it - portforwarding:

I have a small LAN at home with a cable connection. so I get my ip from the=
 ISP thru' dhcp..

and here's a part of my script:

#!/bin/bash

EXTIF=3Deth0
INTIF=3Deth1
EXTIP=3Dwww.xxx.yyy.zzz
INTIP=3D192.168.0.1
WWWSRV=3D192.168.0.2

#here I'll make some=20
echo 1 > /proc/sys/net/ipv4/*=20
#to some features like ip_dynaddr, ip_forward, tcp_syncookie


#then I set the default policies
#accept everything except the FORWARD chain=20
#and flush them
iptables -P INPUT -j ACCEPT
iptables -F INPUT=20
iptables -P OUTPUT -j ACCEPT
iptables -F OUTPUT=20
iptables -P FORWARD -j DROP
iptables -F FORWARD
iptables -t nat -f        #flush the nat table=20

# and here's my little disaster
# i try to forward port 1234 to my internal www-server
iptables -t nat -A PREROUTING -p tcp -i $EXTIF -d $EXTIP --dport 1234 -j DN=
AT --to-destination $WWWSRV:80=20
iptables -A FORWARD -p tcp -i $EXTIF -o $INTIF -d $WWWSRV --dport 80 -j ACC=
EPT
iptables -t nat -A POSTROUTING -p tcp -o $EXTIF -s $WWWSRV --sport 80 -j SN=
AT --to-source $EXTIP:1234

# for what i understand from iptables till now is
# packet comes in thru ethernet, arrives in kernel
# so packet looks like this
# ip-layer: source-ip: WWWREQUEST  destination-ip: $EXTIP
# tcp-layer: source-port: a port higher than 1024   destination-port: 1234
# and hits the PREROUTING chain
# with the DNAT rule above it changes following
# ip-layer: source-ip: WWWREQUEST   destination-ip: $WWSRV
# tcp-layer: source-port: a port higher than 1024   destination-port: 80
# then hits FORWARD chain (usually it would hit the INPUT chain,
# but we changed that with DNAT; it has to go out on $INTIF to reach
# its destination..)
# with the FORWARD rule it can bypass..
# when applying DNAT all other packets in that stream are bypassed as well =
=20
# with this two rules it is sure that a request from a www-client from
# the inet is reaching the inner $WWWSRV, and the $WWWSRV can respond but #=
 there is still something wrong with the reply packet:
# ip-layer: source-ip: $WWWSRV destination-ip: WWWREQUEST=20
# tcp-layer: source-port: 80   destination-port: 1024:
# when the packet arrives at the WWWREQUEST-host-browser it doesn't know=20
# what to do with the packet (there was no request to this host $WWWSRV)
# so here comes rule 3; it changes the source ip and port to this
# ip-layer: source-ip: $EXTIP destination-ip: WWWREQUEST=20
# tcp-layer: source-port: 1234   destination-port: 1024:
# now the packet seems like the awaited reply from the request
# he has given to $EXTIP:1234

# and another few rules to complete the firewall script

# allow all connections from inside out and only related
# and established ones in
iptables -A FORWARD -p tcp -i $EXTIF -o $INTIF -m state --state ESTABLISHED=
,RELATED -j ACCEPT
iptables -A FORWARD -p tcp -o $EXTIF -i $INTIF -j ACCEPT

# enable masquerading
iptables -t NAT -A POSTROUTING -o $EXTIF -j MASQUERADE

I hope anyone out there can help me..
I tried serveral permutations with the three portforwarding rules:
I changed some params or even let them away
One Variation was to ACCEPT the full FORWARD chain
I hope there aren't any spelling mistakes, cause I wrote this script
just for email purpose=B4; on my router is the original..
I've also read dozens of mailing-list entry like this and everyone seemed p=
ausible but till now it didn't work - I've tried two days now and I'm kind =
of frustrated
oh yeah, modules loaded by the kernel:
ip_tables
iptable_nat
ip_conntrack=20
ip_conntrack_ftp
ip_conntrack_irc
ip_nat_ftp
iptable_filter
ipt_state
ipt_LOG
ipt_MASQUERADE

it must be a kind of silly, tiny failure
one I haven't looked for yet..

thanks for any little hint!

methodaut

__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels=
.netscape.com/ns/browsers/download.jsp=20

Get your own FREE, personal Netscape Mail account today at http://webmail.n=
etscape.com/

