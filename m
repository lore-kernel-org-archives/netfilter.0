From: Damon Brinkley <damon@betcoinc.com>
Subject: RE: Filter by IP address problems
Date: 12 Dec 2002 09:13:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039702392.6682.14.camel@damon.betcolan>
References: <FLEKIPPLAEDMJMOOBBDPAEHJDLAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPAEHJDLAA.stewart.thompson@shaw.ca>
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
To: stewart.thompson@shaw.ca
Cc: netfilter@lists.netfilter.org

Thanks Stu but I'm still doing something wrong.

Here's the rules I have now.

###############################

echo 0 > /proc/sys/net/ipv4/ip_forward

/sbin/modprobe iptable_nat
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp

/sbin/iptables -F
/sbin/iptables -t nat -F
/sbin/iptables -X
/sbin/iptables -t nat -X

/sbin/iptables -P INPUT DROP
/sbin/iptables -P OUTPUT DROP
/sbin/iptables -P FORWARD DROP

# INPUT CHAIN
# NONUSERS = 172.17.0.0/20
/sbin/iptables -A INPUT -s $NONUSERS -j ACCEPT

# FORWARD CHAIN
/sbin/iptables -A FORWARD -s $NONUSERS -j ACCEPT

# POSTROUTING
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward

######################################

This should give my laptop, IP 172.17.0.244, complete access but I get
Request timed out when pinging www.yahoo.com

Here's what I get when running iptables -nL

Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  172.17.0.0/20        0.0.0.0/0          

Chain FORWARD (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  172.17.0.0/20        0.0.0.0/0          

Chain OUTPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          

Has there been a book written on iptables yet?  

Thanks for your help.

Damon

On Wed, 2002-12-11 at 18:26, Stewart Thompson wrote:
> Hi Damon:
> 
> 	Iptables is different than Ipchains. The forwarded
> Packets do not go through the Input or Output chains. If
> you want to deny certain packets from being forwarded,
> you have to put your deny rule in the forward chains.
> Have a look at the documentation at www.netfilter.org.
> They show a diagram there of the packet traversal.
> Hope that helps.
> 
> Stu.......
> 
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Damon Brinkley
> Sent: December 11, 2002 1:41 PM
> To: netfilter@lists.netfilter.org
> Subject: Filter by IP address problems
> 
> Hey everyone!  I'm getting extremely frustrated at iptables right now
> because it doesn't seem to follow the rules as ipchains did.  Basically
> I'm just trying to replace my ipchains server with a new computer that
> uses 2.4 and iptables.  This is a NAT/gateway machine and we filter our
> users by IP addresses.  The different ip blocks have certain access to
> certain services.  I've copied over my old script that's running right
> now and changed everything to work with iptables but it doesn't seem to
> deny anyone.
> 
> Here's the basic rules I have right now for testing.
> 
> ###################################
> 
> # disable ip forwarding while rules are applied
> echo 0 > /proc/sys/net/ipv4/ip_forward
> 
> /sbin/modprobe iptable_nat
> /sbin/modprobe ip_conntrack
> 
> /sbin/iptables -F
> /sbin/iptables -t nat -F
> /sbin/iptables -X
> /sbin/iptables -t nat -X
> 
> /sbin/iptables -P INPUT DROP
> /sbin/iptables -P OUTPUT DROP
> /sbin/iptables -P FORWARD DROP
> 
> # no access
> /sbin/iptables -A INPUT -s 172.17.0.0/20 -j DROP
> 
> # NAT
> /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> /sbin/iptables -A FORWARD -j ACCEPT
> 
> # turn on ip forwarding
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> ####################
> 
> If I change my laptop IP to 172.17.0.244 then I'm able to ping
> www.yahoo.com when the no access rule should deny then from doing
> anything.  This is all working on a machine that uses ipchains...what am
> I doing wrong?
> 
> Thanks
> Damon Brinkley
> 
> 
> 



