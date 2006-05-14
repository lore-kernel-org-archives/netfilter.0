From: "Stan Prescott" <sprescott58@comcast.net>
Subject: REDIRECT to different interfaces.
Date: Sun, 14 May 2006 11:35:36 -0700
Message-ID: <OAEGKDKHMAKDDLCDGICBKENDCAAA.sprescott58@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all. This is my first time on this mailing list. I am trying to alter
the iptables rules in my SmoothWall firewall to allow transparent web proxy
on different network interfaces. The stock configuration of the firewall is
to allow web proxy on just the green interface. I have altered it so that it
will allow web proxy on green (eth0) and orange (eth1). These are the
default rules in the rc.firewall.up configuration.

# localhost and ethernet.
/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A INPUT -i $GREEN_DEV -j ACCEPT
.
.
.
# squid
/sbin/iptables -t nat -N squid
/sbin/iptables -t nat -N jmpsquid
/sbin/iptables -t nat -A jmpsquid -d 10.0.0.0/8 -j RETURN
/sbin/iptables -t nat -A jmpsquid -d 172.16.0.0/12 -j RETURN
/sbin/iptables -t nat -A jmpsquid -d 192.168.0.0/16 -j RETURN
/sbin/iptables -t nat -A jmpsquid -d 192.168.10.0/16 -j RETURN
/sbin/iptables -t nat -A jmpsquid -d 169.254.0.0/16 -j RETURN
/sbin/iptables -t nat -A jmpsquid -j squid
/sbin/iptables -t nat -A PREROUTING -i $GREEN_DEV -j jmpsquid
.
.
.
And the "restartsquid" script adds the rule
/sin/iptables -t nat -A squid -p tcp --dport 80 -j REDIRECT --to-ports 800

if transparent proxy is enabled. I have modified the chains and added

/sbin/iptables -A INPUT -i $ORANGE_DEV -j ACCEPT
to the INPUT chain and
/sbin/iptables -t nat -A PREROUTING -i $ORANGE_DEV -j jmpsquid
to the PREROUTING chain.

I have also changed the redirect rule to
/sin/iptables -t nat -A squid -p tcp --dport 80 -j REDIRECT --to-ports 8080
if a content filter is enabled (ie DansGuardian) or leave it as redirect to
800 if DansGuardian is not running.

What I want to do is only redirect to a specific interface depending what is
enabled. What I have tried is this

/sin/iptables -t nat -A squid -i eth0 -p tcp --dport 80 -j
REDIRECT --to-ports 800
/sin/iptables -t nat -A squid -i eth1 -p tcp --dport 80 -j
REDIRECT --to-ports 800

And I want to be able to do something like this

/sin/iptables -t nat -A squid -i eth0 -p tcp --dport 80 -j
REDIRECT --to-ports 8080
/sin/iptables -t nat -A squid -i eth1 -p tcp --dport 80 -j
REDIRECT --to-ports 800

to REDIRECT tcp going to green (eth0) on port 80 to port 8080 if the content
filter is enabled ON GREEN and
    REDIRECT tcp going to orange (eth1) on port 80 to port 800 if the
content filter is turned off ON ORANGE.

So far everything I have tried has failed. It will not REDIRECT port 80 to
800 or port 80 to 8080 on a specific interface. It only seems to work for
source of anywhere and destination of anywhere.

Would someone be able to show me how to REDIRECT to a specific port AND
interface?

Thank you,

Stan


