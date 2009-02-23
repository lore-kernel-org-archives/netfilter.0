From: Bill Brelsford <wbrels@k2di.net>
Subject: NAT: re-route localhost to otherhost
Date: Mon, 23 Feb 2009 15:09:57 -0800
Message-ID: <20090223230957.GA17174@k2di>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On machine host1 (10.1.1.1) I want to re-route localhost port 25
traffic to host2 (10.1.1.2).  My only nat table entries are:

 iptables -t nat -A OUTPUT -p tcp --dport 25 \
 	-j DNAT --to-destination 10.1.1.2

 iptables -t nat -A POSTROUTING -p tcp --dport 25 \
 	-j SNAT --to-source 10.1.1.1

Then "telnet host1" connects to host2 as expected (as does
"telnet host3" etc.), but "telnet localhost" hangs.  Log
statements inserted before each statement show expected results
(addresses, interfaces, etc.), except that in the localhost case
the POSTROUTING log statement is never executed; I assume SNAT is
not executed either.

The reverse translation works, i.e. changing both addresses to
127.0.0.1 results in "telnet host2" connecting to localhost.

Any explanations/fixes/suggestions?  I'm using kernel 2.6.26 and
iptables 1.4.2 (Debian lenny).

Thanks,

Bill Brelsford
