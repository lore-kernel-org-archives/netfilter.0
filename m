From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Filter by IP address problems
Date: Wed, 11 Dec 2002 15:26:13 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPAEHJDLAA.stewart.thompson@shaw.ca>
References: <1039642859.4340.14.camel@damon.betcolan>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1039642859.4340.14.camel@damon.betcolan>
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
To: Damon Brinkley <damon@betcoinc.com>, netfilter@lists.netfilter.org

Hi Damon:

	Iptables is different than Ipchains. The forwarded
Packets do not go through the Input or Output chains. If
you want to deny certain packets from being forwarded,
you have to put your deny rule in the forward chains.
Have a look at the documentation at www.netfilter.org.
They show a diagram there of the packet traversal.
Hope that helps.

Stu.......


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Damon Brinkley
Sent: December 11, 2002 1:41 PM
To: netfilter@lists.netfilter.org
Subject: Filter by IP address problems

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



