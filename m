From: Al Sparks <data345@yahoo.com>
Subject: Changing the desitnation (DNAT) locally
Date: Thu, 5 Feb 2004 12:14:34 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040205201434.57440.qmail@web9706.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm new to netfilter.

I've been going through the HOW-TO's on NAT, and I want to change the
destination on packets based on it's destination.

I set up a test, the idea being, I want to change the destination of a
packet from 192.168.100.99 to 127.0.0.5.  The packet will be generated
locally.

The first thing I did, is I set up my route tables so that
192.168.100.99  127.0.0.5   255.255.255.255 UGH 0      0        0 lo
10.254.223.0    *           255.255.255.0   U   0      0        0 eth0
127.0.0.0       *           255.0.0.0     U     0      0        0 lo
default         whatever    0.0.0.0       UG    0      0        0 eth0



So I have 192.168.100.99 routed to my local interface, "lo".


Here's my NAT listing:
# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       all  --  anywhere             192.168.100.99     to:127.0.0.5

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



To test it, I telnet to the SSH port with
   telnet 127.0.0.5 22
which gets me a connection, but
   telnet 192.168.100.99 22
just shows a SYN_SENT when I check with netstat.

So, is what I'm doing doable?  If so, how do I do it?
   === Al


