From: Adam Wiggins <hiro@dusk.org>
Subject: local port redirect to remote IP
Date: Thu, 7 Nov 2002 18:57:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021107185721.B34761@dusk.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


Greetings,

I need to redirect a port on the loopback device to a remote IP -
basically the reverse of a transparent Squid proxy.

The example I'm trying to get working is to make port 8000 on the
local machine connect me to www.yahoo.com:80.

I tried both DNAT and REDIRECT (not sure which is applicable here),
as follows:

[root@ash root]# iptables -F -t nat
[root@ash root]# iptables -t nat -A PREROUTING -s 127.0.0.1 -p tcp --dport 8003 -j REDIRECT --to 64.58.76.225:80
[root@ash root]# telnet localhost 8003
Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused
[root@ash root]# iptables -F -t nat
[root@ash root]# iptables -t nat -A PREROUTING -s 127.0.0.1 -p tcp --dport 8003 -j DNAT --to 64.58.76.225:80
[root@ash root]# telnet localhost 8003
Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused

The REDIRECT works on a remote machine (if I specify -s <someIP> and
then connect from that machine), so I know I must be close.  I
experimented with POSTROUTING as well, but that doesn't allow you to
specify a source IP and I need to make sure this only works when
connecting locally.

Any pointers much appreciated.

-Adam


