From: Geffrey Velasquez <g_netfilter@netfids.com>
Subject: Re: iptable question
Date: Wed, 18 Jun 2003 12:26:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1625070150.20030618122638@netfids.com>
References: <20030618134048.90305.qmail@web14708.mail.yahoo.com>
Reply-To: Geffrey Velasquez <g_netfilter@netfids.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030618134048.90305.qmail@web14708.mail.yahoo.com>
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
To: Craig <elitesyntax@yahoo.com>
Cc: netfilter@lists.netfilter.org

Hi, I use set -x:


C> How can i debug my iptables script?


C> #!/bin/sh
C> #
C> # The location of the IPTables binary file on your
C> system.
C> IPT=3D"/sbin/iptables"

set -x

C> # The Internet interface. For ADSL or Dialup users,
C> this should be "ppp0".
C> # For a cable modem connection, this will probably be
C> "eth0".
C> INT=3D"ppp0"

C> # Out with the old stuff.
C> $IPT -F
C> $IPT -F INPUT
C> $IPT -F OUTPUT
C> $IPT -F FORWARD
C> $IPT -F -t mangle
C> $IPT -F -t nat
C> $IPT -X

C> # These will setup our policies.
C> $IPT -P INPUT DROP
C> $IPT -P OUTPUT ACCEPT
C> $IPT -P FORWARD ACCEPT

C> # Use this for NAT or IP Masquerading.
echo 1 >> /proc/sys/net/ipv4/ip_forward
C> $IPT -t nat -A POSTROUTING -o $INT -j MASQUERADE

C> # This rule protects your fowarding rule.
C> $IPT -A FORWARD -i $INT -m state --state NEW,INVALID
C> -j DROP

C> # Port forwarding looks like this.
C> #$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 25
C> -j DNAT --to 192.168.0.50
C> #$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 53
C> -j DNAT --to 192.168.0.50
C> #$IPT -t nat -A PREROUTING -i $INT -p udp --dport 53
C> -j DNAT --to 192.168.0.50
C> # These two redirect a block of ports, in both udp and
C> tcp.
C> #$IPT -t nat -A PREROUTING -i $INT -p tcp --dport
C> 2300:2400 -j DNAT --to 192.168.0.50
C> #$IPT -t nat -A PREROUTING -i $INT -p udp --dport
C> 2300:2400 -j DNAT --to 192.168.0.50

C> # This rule will accept connections from local
C> machines.
C> $IPT -A INPUT -i lo -j ACCEPT
C> $IPT -A INPUT -s 192.168.0.0/24 -d 0/0 -p all -j
C> ACCEPT

C> # Drop bad packets.
C> $IPT -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j
C> DROP
C> $IPT -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
C> $IPT -A INPUT -p tcp --tcp-flags ALL
C> SYN,RST,ACK,FIN,URG -j DROP
C> $IPT -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
C> $IPT -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j
C> DROP
C> $IPT -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j
C> DROP

C> # Drop icmp, but only after letting certain types
C> through.
C> $IPT -A INPUT -p icmp --icmp-type 0 -j ACCEPT
C> $IPT -A INPUT -p icmp --icmp-type 3 -j ACCEPT
C> $IPT -A INPUT -p icmp --icmp-type 11 -j ACCEPT
C> $IPT -A INPUT -p icmp --icmp-type 8 -m limit --limit
C> 1/second -j ACCEPT
C> $IPT -A INPUT -p icmp -j DROP


C> =3D=3D=3D=3D=3D
C> EliteSyntax  www.linuxnewbie.org





C> __________________________________
C> Do you Yahoo!?
C> SBC Yahoo! DSL - Now only $29.95 per month!
C> http://sbc.yahoo.com


Regards,
Geffrey Vel=E1squez


