From: wolf-r1@wispertel.net
Subject: Port Forwarding - try again
Date: Fri, 30 Dec 2005 12:58:49 -0700 (MST)
Message-ID: <2174.65.117.240.212.1135972729.squirrel@secure.wispertel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I don't think my first two emails went through, either that or the list is
incredibly slow today. Thus I'm trying this from a different email
address.

I am thoroughly confused by IPTables. I'm not totally new to Linux however
I'm clearly no guru.
I have an older Linux machine running IPChains that I am going to need to
replace soon. This machine was set up by another person who is no longer
available to me. I've been researching how to convert this IPChains setup
to IPTables but I just can't seem to figure it out.

This is executed from rc.local on the old machine (IP addresses altered to
protect the innocent):

echo "Turning on IP Forwarding"
/bin/echo "1" > /proc/sys/net/ipv4/ip_forward

echo "Setting IPMasq Rules"
/usr/sbin/ipmasqadm mfw -A -m 3 -r 10.0.0.1

echo "PortForwarding"
/usr/sbin/ipmasqadm portfw -a -P tcp -L 192.168.1.1 25 -R 10.0.0.1 25

The new machine that I'm running this on is a CentOS 4.2 x86-64 running
kernel 2.6.9-22.0.1.EL. Some of the research that I've done indicates that
I should have something like this going on:

iptables -t nat -A PREROUTING -p tcp -i eth1 -d 192.168.1.1 --dport 25 -j
DNAT --to 10.0.0.1:25
iptables -A FORWARD -p tcp -i eth0 -d 10.0.0.1 --dport 25 -j ACCEPT

But that doesn't work. Then I ran across a site that added a couple of
statements to the mix:

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

The additional lines don't help my cause either and I am a bit lost here.
If anyone has any helpful information I would greatly appreciate it. Thanks.


