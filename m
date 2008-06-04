From: Martin <mylists@itcom.com.ar>
Subject: Re: Difficulty with iptables script to only allow 3 ports across
	the  firewall
Date: Wed, 04 Jun 2008 10:23:59 -0300
Message-ID: <1212585840.2539.19019.camel@kr0sty.1.com.ar>
References: <W424637935269591212542985@webmail15>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <W424637935269591212542985@webmail15>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: john@langherd.com
Cc: netfilter@vger.kernel.org


On Wed, 2008-06-04 at 01:29 +0000, john@langherd.com wrote:
> First, thanks for taking the time to look.
> 
> I've been poking at this for almost 2 weeks and am quite stuck.
> 
> Here's the nutshell version of what I'm trying to do:
> 
> Client machine has an IP address of 192.168.100.101.  The only way I want this client to be able to communicate with machines on the 10.138.x.x network is via HTTPS (443), plus make DNS lookup requests.  I don't want PING, or any windows SMB type connections to succeed.  Just HTTPS and DNS.  Also, the linux box provides dhcp services to the 192.168.200.x network.
> 
> I think my fundamental understanding of iptables is wrong.
> 
> I 'think' the INPUT is what's allowed to the local machine (i.e. firewall box)
> FORWARD is what's passed from NIC to NIC.
> OUTPUT is what's allowed off the NIC.
> 
> Would anybody please give me a hand here?  I learn quickly by examples.  I've poked at a large number of websites, but am not making much headway.
> 
> Respectfully,
> 
> John
> 
> Here's my script as it sits.  It's driving me nuts that I can connect via SMB from the clients on the 192 network to windows SMB shares on the 10. network.
> 
> 
> IPT="/sbin/iptables"
> 
> # THE NETWORK CONTAINING THE SITE SYSTEMS
> DMZ_IP="10.138.2.117"
> DMZ_IFACE="eth0"
> DMZ_BROADCAST="10.138.2.255"
> 
> # THE IP RANGE FOR CLIENT COMPUTERS (disconnected network)
> CLIENTS_IP="192.168.200.1"
> CLIENTS_IP_RANGE="192.168.200.0/24"
> CLIENTS_IFACE="eth1"
> 
> $IPT --flush
> $IPT --table nat --flush
> $IPT --delete-chain
> $IPT --table nat --delete-chain
> 
> $IPT -A INPUT -j LOG --log-prefix "INPUT_PACKETS: "
> $IPT -A FORWARD -j LOG --log-prefix "FORWARD_PACKETS: "
> $IPT -A OUTPUT -j LOG --log-prefix "OUTPUT_PACKETS: "
> 
> $IPT --policy INPUT DROP
> #$IPT --policy OUTPUT DROP
> 
> 
> $IPT -A INPUT -p tcp --dport 22 -j ACCEPT
> $IPT -A INPUT -p tcp --dport 80 -j ACCEPT
> $IPT -A INPUT -p tcp --dport 443 -j ACCEPT
> $IPT -A INPUT -p tcp --dport 53 -j ACCEPT
> $IPT -A INPUT -p udp --dport 53 -j ACCEPT
> 
> #$IPT -A INPUT -p udp -j ACCEPT
> #$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> #$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> #$IPT -A FORWARD -p tcp --dport 80 -j ACCEPT
> $IPT -A FORWARD -p tcp --dport 443 -j ACCEPT
> $IPT -A FORWARD -p udp --dport 53 -j ACCEPT
> $IPT -A FORWARD -p tcp --dport 53 -j ACCEPT
> $IPT -A FORWARD -p tcp --dport 445 -j DROP
> $IPT -N LOGDROP
> $IPT -A LOGDROP -j LOG
> $IPT -A LOGDROP -j DROP
> $IPT -A INPUT -j LOG
> $IPT -A FORWARD -j LOG
> 
> $IPT --table nat --append POSTROUTING --out-interface $DMZ_IFACE -j MASQUERADE
> echo 1 > /proc/sys/net/ipv4/ip_forward
[...]

You can be a bit more strict using source and destination

$IPT -A FORWARD -s 192.168.100.101 -d 10.138.x.x -m tcp --dport 443 -j
ACCEPT

$IPT -A FORWARD -s 192.168.100.101 -d 10.138.x.x -m udp --dport 53 -j
ACCEPT

$IPT -A FORWARD -s 192.168.100.101 -j LOG #To see if there is another
attemp of connection
$IPT -A FORWARD -s 192.168.100.101 -j DROP


You probably will need the reverse rules (from 10.138.x.x to
192.168.100.101).


Cheers


Martin

