From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: is this NAT setup right?
Date: Thu, 19 Sep 2002 18:48:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020919184840.19c02006.arc_of_descent@gmx.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


HI,
I've just read a few mails on this list,
and now i'm suddenly wondering if the firewall rules
i've been using for over 3 months are correct! :-)

Allow me to elaborate:

                             (eth1)            (eth0)
        {LAN}      <---------> {  L  I  N  U  X  } <---------> {ISP}
   (172.16.0.0/16)       (172.16.0.1)      (203.1.2.3)      (203.1.2.1)

As in the diagram above, the Linux box has
eth1 (LAN interface) with ip 172.16.0.1
		AND
eth0 (EXT interface) with ip 203.1.2.3

This is my firewall setup

<code>
#!/bin/sh
 
PATH=$PATH:/sbin
lockfile -2 /var/lock/firewall.lock
 
iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F
 
echo 1 > /proc/sys/net/ipv4/ip_forward
 
# authentication
iptables -P FORWARD ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
################# Add authenticated users here ##################
# eg. iptables -A FORWARD -i eth1 -s 172.16.0.2/32 -j ACCEPT
# which means 172.16.0.2 is authenticated
#################################################################
iptables -A FORWARD -i eth1 -j REJECT

# masquerading
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 172.16.0.0/16

rm -f /var/lock/firewall.lock
</code>

Now the questions:
The FORWARD chain has a default ACCEPT policy
I am then ACCEPTING only users who have been authenticated
Then I'm REJECTING others with icmp-port-unreachable

Is this OK?
Further more, is the "-i eth1" correct?
I've read one of Antony's mail where it is "-i eth0"

So far this setup has been working decently. 
All though i've had few problems I couldn't trace it
to the firewall setup.

Thanx 

--
arc_of_descent

ps.
I've used this setup for more than 6 months now :p

