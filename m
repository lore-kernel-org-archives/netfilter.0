From: Dominic <cvs@technoplaza.net>
Subject: cvs iptables question...
Date: Sat, 03 Apr 2004 12:01:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406EEDEE.9040301@technoplaza.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am trying to connect to a cvs pserver, but whenever I try, my firewall 
confiruation blocks me from doing so.

I should be able to add a rule to the OUTPUT chain that allows 
connections on tcp protocol port 2401. I did this, but it doesn't work. 
I know it is iptables blocking me because when I flush all the rules, I 
can login to the cvs server.

When I tried Windows cvs with Sygate Personal Firewall and examined the 
traffic log, there was only one outgoing note to the CVS server, using 
tcp on port 2401. I don't know what Linux version would do that the 
Windows version isn't doing.

The following are my iptable rules. I have modeled it after the gentoo 
security guide tutorial.

  $IPTABLES -P FORWARD DROP
  $IPTABLES -P INPUT   DROP
  $IPTABLES -P OUTPUT  DROP

  $IPTABLES -N allowed-connection
  $IPTABLES -F allowed-connection
  $IPTABLES -A allowed-connection -m state --state ESTABLISHED,RELATED 
-j ACCEPT
  $IPTABLES -A allowed-connection -i eth0 -m limit -j LOG --log-prefix 
"Bad packet from eth0:"
  $IPTABLES -A allowed-connection -j DROP

  $IPTABLES -N icmp_allowed
  $IPTABLES -F icmp_allowed
  $IPTABLES -A icmp_allowed -m state --state NEW -p icmp --icmp-type 
time-exceeded -j ACCEPT
  $IPTABLES -A icmp_allowed -m state --state NEW -p icmp --icmp-type 
destination-unreachable -j ACCEPT
  $IPTABLES -A icmp_allowed -p icmp -j LOG --log-prefix "Bad ICMP traffic:"
  $IPTABLES -A icmp_allowed -p icmp -j DROP

  $IPTABLES -N allow-ssh-traffic-out
  $IPTABLES -F allow-ssh-traffic-out
  $IPTABLES -A allow-ssh-traffic-out -p tcp --dport ssh -j ACCEPT

  $IPTABLES -N allow-ftp-traffic-out
  $IPTABLES -F allow-ftp-traffic-out
  $IPTABLES -A allow-ftp-traffic-out -p tcp --dport ftp -j ACCEPT

  $IPTABLES -N allow-dns-traffic-out
  $IPTABLES -F allow-dns-traffic-out
  $IPTABLES -A allow-dns-traffic-out -p udp -d $DNS1 --dport domain -j 
ACCEPT
  $IPTABLES -A allow-dns-traffic-out -p udp -d $DNS2 --dport domain -j 
ACCEPT

  $IPTABLES -N allow-www-traffic-out
  $IPTABLES -F allow-www-traffic-out
  $IPTABLES -A allow-www-traffic-out -p tcp --dport www -j ACCEPT
  $IPTABLES -A allow-www-traffic-out -p tcp --dport https -j ACCEPT

  $IPTABLES -N allow-rsync-traffic-out
  $IPTABLES -F allow-rsync-traffic-out
  $IPTABLES -A allow-rsync-traffic-out -p tcp --dport rsync -j ACCEPT

  $IPTABLES -N allow-mail-traffic-out
  $IPTABLES -F allow-mail-traffic-out
  $IPTABLES -A allow-mail-traffic-out -p tcp --dport smtp -j ACCEPT
  $IPTABLES -A allow-mail-traffic-out -p tcp --dport pop3 -j ACCEPT

  $IPTABLES -A allow-cvs-traffic-out
  $IPTABLES -F allow-cvs-traffic-out
  $IPTABLES -A allow-cvs-traffic-out -p tcp --dport 2401 -j ACCEPT

  $IPTABLES -A INPUT -m state --state INVALID -j DROP
  $IPTABLES -A INPUT -j icmp_allowed
  $IPTABLES -A INPUT -i lo -j ACCEPT
  $IPTABLES -A INPUT -j allowed-connection

  $IPTABLES -A FORWARD -m state --state INVALID -j DROP
  $IPTABLES -A FORWARD -j icmp_allowed
  $IPTABLES -A FORWARD -o lo -j ACCEPT
  $IPTABLES -A FORWARD -j allow-www-traffic-out
  $IPTABLES -A FORWARD -j allowed-connection

  $IPTABLES -A OUTPUT -m state --state INVALID -j DROP
  $IPTABLES -A OUTPUT -j icmp_allowed
  $IPTABLES -A OUTPUT -o lo -j ACCEPT
  $IPTABLES -A OUTPUT -j allow-ssh-traffic-out
  $IPTABLES -A OUTPUT -j allow-dns-traffic-out
  $IPTABLES -A OUTPUT -j allow-www-traffic-out
  $IPTABLES -A OUTPUT -j allow-ftp-traffic-out
  $IPTABLES -A OUTPUT -j allow-rsync-traffic-out
  $IPTABLES -A OUTPUT -j allow-mail-traffic-out
  $IPTABLES -A OUTPUT -j allow-cvs-traffic-out
  $IPTABLES -A OUTPUT -j allowed-connection

Does anyone have any suggestions?

--Dominic


