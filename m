From: Damon Brinkley <damon@betcoinc.com>
Subject: Filter by IP address problems
Date: 11 Dec 2002 16:40:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039642859.4340.14.camel@damon.betcolan>
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

Hey everyone!  I'm getting extremely frustrated at iptables right now
because it doesn't seem to follow the rules as ipchains did.  Basically
I'm just trying to replace my ipchains server with a new computer that
uses 2.4 and iptables.  This is a NAT/gateway machine and we filter our
users by IP addresses.  The different ip blocks have certain access to
certain services.  I've copied over my old script that's running right
now and changed everything to work with iptables but it doesn't seem to
deny anyone.

Here's the basic rules I have right now for testing.  

###################################

# disable ip forwarding while rules are applied
echo 0 > /proc/sys/net/ipv4/ip_forward

/sbin/modprobe iptable_nat
/sbin/modprobe ip_conntrack

/sbin/iptables -F
/sbin/iptables -t nat -F
/sbin/iptables -X
/sbin/iptables -t nat -X

/sbin/iptables -P INPUT DROP
/sbin/iptables -P OUTPUT DROP
/sbin/iptables -P FORWARD DROP

# no access
/sbin/iptables -A INPUT -s 172.17.0.0/20 -j DROP

# NAT
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/sbin/iptables -A FORWARD -j ACCEPT

# turn on ip forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

####################

If I change my laptop IP to 172.17.0.244 then I'm able to ping
www.yahoo.com when the no access rule should deny then from doing
anything.  This is all working on a machine that uses ipchains...what am
I doing wrong?

Thanks
Damon Brinkley


