From: "Christopher Davis" <cldavis@speakeasy.net>
Subject: RE: Firewall Script Help
Date: Mon, 8 Mar 2004 14:19:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <JKELJHHMDHPOLKFBOEGHMECLFDAA.cldavis@speakeasy.net>
References: <200403081849.49587.lists@edeca.net>
Reply-To: <cldavis@speakeasy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403081849.49587.lists@edeca.net>
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

David:

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On
> Behalf Of David Cannings
> Sent: Monday, March 08, 2004 1:50 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Firewall Script Help
>
> Just a quick point, it is (in my opinion at
> least) far easier to read your
> firewall rules if they're output from iptables
> itself.  Following through
> the script is harder.
>
> # iptables -L -v
>
> David

Here it is!  If it is easier to read, I can forward indivual
txt docs with the same information -- I didn't want to
attach anything being sent to the list.

Thanks again!
Christopher Davis


Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  any    any     anywhere
anywhere           state INVALID
    0     0 ACCEPT     all  --  any    any     anywhere
anywhere           state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  lo     any     anywhere
anywhere
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:FIN,ACK/FIN
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:PSH,ACK/PSH
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:ACK,URG/URG
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:FIN,RST/FIN,RST
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:FIN,SYN/FIN,SYN
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:SYN,RST/SYN,RST
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:FIN,SYN,RST,PSH,ACK,URG/NONE
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,PSH,URG
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
    0     0 ACCEPT     tcp  --  any    any     anywhere
anywhere           tcp dpt:www
    0     0 ACCEPT     tcp  --  any    any     anywhere
anywhere           tcp dpt:ssh
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:SYN/SYN
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp flags:SYN,RST,ACK/SYN
    0     0 ACCEPT     icmp --  any    any     anywhere
anywhere           icmp destination-unreachable
    0     0 ACCEPT     icmp --  any    any     anywhere
anywhere           icmp source-quench
    0     0 ACCEPT     icmp --  any    any     anywhere
anywhere           icmp time-exceeded
    0     0 ACCEPT     icmp --  any    any     anywhere
anywhere           icmp parameter-problem

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     tcp  --  any    any
www01.colligatedtechnologies.com  anywhere           tcp
spt:www
    0     0 ACCEPT     tcp  --  any    any
www01.colligatedtechnologies.com  anywhere           tcp
spt:ssh
    1    66 ACCEPT     all  --  any    any
www01.colligatedtechnologies.com  anywhere

Chain BADIP (0 references)
 pkts bytes target     prot opt in     out     source
  destination
    0     0 LBADIP     all  --  any    any     0.0.0.0/8
anywhere
    0     0 LBADIP     all  --  any    any     anywhere
0.0.0.0/8
    0     0 LBADIP     all  --  any    any     10.0.0.0/8
anywhere
    0     0 LBADIP     all  --  any    any     anywhere
10.0.0.0/8
    0     0 LBADIP     all  --  any    any     127.0.0.0/8
anywhere
    0     0 LBADIP     all  --  any    any     anywhere
127.0.0.0/8
    0     0 LBADIP     all  --  any    any
169.254.0.0/16       anywhere
    0     0 LBADIP     all  --  any    any     anywhere
169.254.0.0/16
    0     0 LBADIP     all  --  any    any     172.16.0.0/12
anywhere
    0     0 LBADIP     all  --  any    any     anywhere
172.16.0.0/12
    0     0 LBADIP     all  --  any    any     192.0.0.0/24
anywhere
    0     0 LBADIP     all  --  any    any     anywhere
192.0.0.0/24
    0     0 LBADIP     all  --  any    any
192.168.0.0/16       anywhere
    0     0 LBADIP     all  --  any    any     anywhere
192.168.0.0/16
    0     0 LBADIP     all  --  any    any     192.0.34.0/24
anywhere
    0     0 LBADIP     all  --  any    any     anywhere
192.0.34.0/24
    0     0 LBADIP     all  --  any    any
BASE-ADDRESS.MCAST.NET/4  anywhere
    0     0 LBADIP     all  --  any    any     anywhere
BASE-ADDRESS.MCAST.NET/4
    0     0 LBADIP     all  --  any    any     240.0.0.0/5
anywhere
    0     0 LBADIP     all  --  any    any     anywhere
240.0.0.0/5
    0     0 LBADIP     all  --  any    any
255.255.255.255      anywhere
    0     0 LBADIP     all  --  any    any     anywhere
255.255.255.255

Chain LBADIP (22 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       tcp  --  any    any     anywhere
anywhere           tcp dpts:netbios-ns:netbios-ssn
    0     0 DROP       udp  --  any    any     anywhere
anywhere           udp dpts:netbios-ns:netbios-ssn
    0     0 DROP       all  --  any    any     anywhere
anywhere

Chain LDROP (0 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  any    any     anywhere
anywhere

Chain LSHUN (0 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  any    any     anywhere
anywhere

Chain SHUN (0 references)
 pkts bytes target     prot opt in     out     source
destination



