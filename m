From: "Raj Wurttemberg" <rajw@c64.us>
Subject: RE: Netmeeting NATing IP address
Date: Mon, 9 Sep 2002 11:08:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <70A355A3DBADD611816A00508BE382F84D965A@ATAEXPST03>
References: <70A355A3DBADD611816A00508BE382F8029F1E@ATAEXPST03>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <70A355A3DBADD611816A00508BE382F8029F1E@ATAEXPST03>
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
Cc: 'Sundaram Ramasamy' <sun@percipia.com>

I can't help the rule writing but so that others more experienced than I
can understand what ports NetMeeting uses here is what MS has on their
web site:

(From http://support.microsoft.com/default.aspx?scid=kb;en-us;Q158623)

When you use NetMeeting to establish a connection over the Internet,
NetMeeting uses several IP ports to communicate with other meeting
participants. If you use a firewall to connect to the Internet, the
firewall must be configured so that the ports used by NetMeeting are not
blocked. 

NetMeeting uses the following Internet Protocol (IP) ports: 
   Port      Purpose
   -------------------------------------
   389       Internet Locator Server [Transmission Control Protocol
(TCP)]
   522       User Location Server (TCP)
   1503      T.120 (TCP)
   1720      H.323 call setup (TCP)
   1731      Audio call control (TCP)
   Dynamic   H.323 call control (TCP)
   Dynamic   H.323 streaming [Realtime Transport Protocol (RTP) over
User Datagram Protocol (UDP)]

To establish outbound NetMeeting connections through a firewall, the
firewall must be configured to do the following: 
Pass through primary TCP connections on ports 522, 389, 1503, 1720 and
1731.
Pass through secondary UDP connections on dynamically assigned ports
(1024-65535). 
NOTE: Some firewalls are capable of passing through TCP connections on
specific ports, but are not capable of passing through secondary UDP
connections on dynamically assigned ports. When you establish NetMeeting
connections through these firewalls, you are unable to use the audio
features of NetMeeting. 

In addition, some firewalls are capable of passing through TCP
connections on specific ports and secondary UDP connections on
dynamically assigned ports, but are not capable of virtualizing an
arbitrary number of internal IP addresses, or are not capable of doing
so dynamically. With these firewalls, you are able to establish
NetMeeting connections from computers inside the firewall to computers
outside the firewall and you are able to use the audio features of
NetMeeting, but you are unable to establish connections from computers
outside the firewall to computers inside the firewall. 

The H.323 call setup protocol (over port 1720) dynamically negotiates a
TCP port for use by the H.323 call control protocol. Also, both the
audio call control protocol (over port 1731) and the H.323 call setup
protocol (over port 1720) dynamically negotiate User Datagram Protocol
(UDP) ports for use by the H.323 streaming protocol, called the real
time protocol (RTP). In NetMeeting, two ports are determined on each
side of the firewall for audio and video streaming. These dynamically
negotiated ports are selected arbitrarily from all ports that can be
assigned dynamically. 

NetMeeting directory services require either port 389 or port 522,
depending on the type of server you are using. Internet Locator Servers
(ILSs), which support the lightweight directory access protocol (LDAP)
for NetMeeting 2.0 or later, require port 389. User Location Servers
(ULSs), developed for NetMeeting 1.0, require port 522. 

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Sundaram Ramasamy
> Sent: Monday, September 09, 2002 11:03 AM
> To: netfilter@lists.netfilter.org
> Subject: Fw: Netmeeting NATing IP address
> 
> 
> 
>  Hi,
> 
>  I want  outside user  initiate the  Netmeeting connection to 
> inside user, I
>  NATed public IP address to my user machine, but still  we 
> are not able to
>  connect from outside.
> 
>  I am attaching me script. can any one help me on this. Is 
> there any other
>  way to achive this.
> 
>  Thanks
>  -SR
> 
> 
>  #!/bin/bash
>  #set -xv
> 
>  EXT="eth0"
>  INT="eth1"
>  LO="lo"
> 
>  GW_IP="192.168.1.10"
>  ANY="Any/0"
>  SUB_NET="192.168.1.0/24"
> 
>  PRIVP="0:1023"
> 
>  UNPRI="1024:65535"
> 
>  IPT="/sbin/iptables"
> 
>  modprobe ip_nat_h323
> 
>  echo 1 > /proc/sys/net/ipv4/tcp_syncookies
> 
>  for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
>          echo 1 > $f
>  done
> 
>  echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> 
>  $IPT -P INPUT DROP
>  $IPT -P OUTPUT ACCEPT
>  $IPT -P FORWARD DROP
> 
>  $IPT -X
>  $IPT -F
>  $IPT -t nat -F
>  $IPT -t nat -X
> 
> 
>  $IPT -A INPUT   -i $INT -j ACCEPT
>  $IPT -A OUTPUT  -o $INT -j ACCEPT
>  $IPT -A FORWARD -i $INT -j ACCEPT
>  $IPT -A FORWARD -o $INT -j ACCEPT
> 
>  $IPT -A INPUT  -i $LO -j ACCEPT
>  $IPT -A OUTPUT -o $LO -j ACCEPT
> 
> 
>  $IPT -t nat -A POSTROUTING -o $EXT -j MASQUERADE
>  $IPT -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED 
> -j ACCEPT
>  $IPT -A FORWARD -i $EXT -m state --state NEW -j ACCEPT
> 
>  : For NetMeeting
>  $IPT -A OUTPUT -o $EXT -p udp --sport 1024:65535 --dport 53 -j ACCEPT
>  $IPT -A INPUT  -i $EXT -p udp --sport 53 --dport 1024:65535 -j ACCEPT
>  $IPT -A OUTPUT -o $EXT -p tcp --sport $UNPRI --dport 53 -j ACCEPT
>  $IPT -A INPUT  -i $EXT -p tcp --sport 53 --dport $UNPRI -j ACCEPT
> 
>  $IPT -A FORWARD -i $EXT -p tcp --dport 113 --syn -j REJECT
> 
>  #NAT to user machine for Netmeeting
>  EXT_IP1=215.183.76.135
>  INT_IP1=192.168.1.135
> 
>  ip addr add $EXT_IP1 dev $EXT
> 
>  $IPT -t nat -A PREROUTING -i $EXT -d $EXT_IP1 -j DNAT --to $INT_IP1
>  $IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1 -j SNAT 
> --to-source $EXT_IP1
> 
>  $IPT -A INPUT -j LOG --log-prefix "input "
>  $IPT -A OUTPUT -j LOG --log-prefix "output "
>  $IPT -A FORWARD -j LOG --log-prefix "forward "


