From: "Neil Aggarwal" <neil@JAMMConsulting.com>
Subject: NAT machines cant do 'dir' after connecting to FTP
Date: Mon, 3 Jun 2002 10:30:34 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <ENEBKGGOKDOEALIKAJMBAEEMCHAA.neil@JAMMConsulting.com>
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
To: netfilter <netfilter@lists.samba.org>

Hello:

I have this setup:
	Internet --- Linux Server --- Switch --- Internal Machines

The Linux server has a set of public IP addresses, lets
say 11.22.33.44 thru 11.22.33.99.  These are mapped
using NAT to the internal machines running static IP
addresses of 192.168.1.44 thru 192.168.1.99.

I can ftp from an internal machine and connect to an
external server.  I can give it a user name and password
and login successfully, but when I try to type dir or
ls, the ftp client sits for a long time
and then I get a message:
 425 Not able to open data connection.

Here are the commands that I used:
	# Load the conntrack ftp module
      /sbin/modprobe ip_conntrack_ftp

      # Flush any existing rules
      /sbin/iptables -F
      /sbin/iptables -t nat -F

	# Set the default policies to ACCEPT all packets
      /sbin/iptables -P INPUT ACCEPT
      /sbin/iptables -P OUTPUT ACCEPT
      /sbin/iptables -P FORWARD ACCEPT
      /sbin/iptables -t nat -P PREROUTING ACCEPT
      /sbin/iptables -t nat -P POSTROUTING ACCEPT

      # Turn on forwarding
      echo "1" > /proc/sys/net/ipv4/ip_forward

	# Set-up routing to allow NAT of the internal machines (I did these
	# three commands foe each of the internal machines)
      /sbin/ifconfig eth0:n 11.22.33.n netmask $NETMASK broadcast $BCAST
      /sbin/iptables -t nat -A PREROUTING -d 11.22.33.n -j DNAT --to
192.168.1.n
      /sbin/iptables -t nat -A POSTROUTING -s 192.168.1.n -j SNAT --to
11.22.33.n

Any ideas??

Thanks,
	Neil.

--
Neil Aggarwal
JAMM Consulting, Inc.    (972) 612-6056, http://www.JAMMConsulting.com
Custom Internet Development    Websites, Ecommerce, Java, databases


