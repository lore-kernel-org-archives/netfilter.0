From: John McMonagle <johnm@advocap.org>
Subject: Allowing ping cauing problems with udp
Date: Thu, 24 Jun 2004 10:27:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DAF2D2.9090706@advocap.org>
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
To: netfilter <netfilter@lists.netfilter.org>

Think I have found a bug in either netfilter or the 2.6.6 kernel.

Main system I'm testing is using debian sarge.
kernel 2.6.6-1-386
iptables v1.2.9

Did the same with
kernel  2.6.5-1-386

Also same problem on a similar k7 system.

Also the same on Fedora core 2 with 2.6.6 kernel
Also tried different version of nmap.

I'm working on a new firewall.
While testing nmap reported that all udp ports were open :-(
Any I mean ALL tested ports.

Finally figured out allowing ping was doing it.

Here is a test script:
#!/bin/bash
#
# flush all the rules in the filter and nat tables.
#
/sbin/iptables -F
/sbin/iptables -t nat -F
#
# erase all chains that's not default in filter and nat table.
/sbin/iptables -X
/sbin/iptables -t nat -X
#
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables -P OUTPUT ACCEPT
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A INPUT -p TCP --dport ssh -j ACCEPT
/sbin/iptables -A INPUT -p ICMP  --icmp-type 8 -j ACCEPT
#
# reset the default policies in the nat table.
#
/sbin/iptables -t nat -P PREROUTING ACCEPT
/sbin/iptables -t nat -P POSTROUTING ACCEPT
/sbin/iptables -t nat -P OUTPUT ACCEPT

Only the icmp rule is needed in INPUT to cause the problem.

nmap -sU -p 1-10 -PI -PT fw
Starting nmap 3.50 ( http://www.insecure.org/nmap/ ) at 2004-06-24 09:18 CDT
Interesting ports on fw (192.168.101.254):
PORT   STATE SERVICE
1/udp  open  tcpmux
2/udp  open  compressnet
3/udp  open  compressnet
4/udp  open  unknown
5/udp  open  rje
6/udp  open  unknown
7/udp  open  echo
8/udp  open  unknown
9/udp  open  discard
10/udp open  unknown

Nmap run completed -- 1 IP address (1 host up) scanned in 0.950 seconds

Only did 1-10 believe me they are all shown as open!

Without icmp rule no ports open.

Starting nmap 3.50 ( http://www.insecure.org/nmap/ ) at 2004-06-24 09:33 CDT
Note: Host seems down. If it is really up, but blocking our ping probes, 
try -P0
Nmap run completed -- 1 IP address (0 hosts up) scanned in 12.053 seconds

Also should note they really are not open. I have named running and was 
unable to access it.

Any way to fix this?

John

