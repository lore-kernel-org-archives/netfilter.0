From: Tomasz Wrona <twr@wp.pl>
Subject: ipt_limit overflow with HZ=1000
Date: Thu, 4 Sep 2003 14:28:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <15615709178.20030904142817@wp.pl>
Reply-To: Tomasz Wrona <twr@wp.pl>
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

Hello,

I patched 2.4.21 with "Variable HZ" patch from
http://members.optusnet.com.au/ckolivas/kernel/
and set up config to HZ=1000

When launched previous working iptables setup strange behaviour
appeared...

ie. following rule:
iptables -t nat -A info -s $i -p tcp --dport 80 -m limit --limit-burst 2 --limit 1/day -j CONNMARK --set-mark 80

give me: "invalid argument"

when changed --limit-burst to 1 it worked
iptables -t nat -A info -s $i -p tcp --dport 80 -m limit --limit-burst 1 --limit 1/day -j CONNMARK --set-mark 80

I also tried change --limit-burst and --limit values to have
ocasionaly succes or fail.

Messages from syslog when tried --limit-burst params:
[2,4,5,7,8 didnt work, 3,6 worked !]

Sep  4 13:48:03 kojot kernel: Call rusty: overflow in ipt_limit: 864000000/2
Sep  4 13:51:59 kojot kernel: Call rusty: overflow in ipt_limit: 864000000/4
Sep  4 13:52:05 kojot kernel: Call rusty: overflow in ipt_limit: 864000000/5
Sep  4 13:52:32 kojot kernel: Call rusty: overflow in ipt_limit: 864000000/2
Sep  4 13:52:55 kojot kernel: Call rusty: overflow in ipt_limit: 864000000/7
Sep  4 13:53:17 kojot kernel: Call rusty: overflow in ipt_limit: 216000000/8


Regards
tw
--


