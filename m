From: Askar Ali Khan <askarali@gmail.com>
Subject: too may error requests
Date: Sun, 1 Aug 2004 13:39:33 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e50408010039494fe0d7@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

hi all,
we are small town base ISP for dialup users, from sometime we are
getting too many request like .... on our squid access.log

203.xx.xxx.62   | NONE/413                     | 1653     | NONE 
|error:request-too-large

its getting worse if we let the client connected for a while who
sending such request, after sometime (within a minutes) if we check
the client sending errors with
netstat -taun | grep IP | wc -l 
500
500 is too many connection (and sometimes its somewhere in 700-800)
from a single client normally it would be 10 or 20 maximum.

And here is the tcpdum -n -t host IpOfClient-error-request-too-large

3.89.146.62.4563 > 203.89.149.112.http: S 4257159308:4257159308(0) win
8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4579 > 203.89.146.213.6129: S 4257825751:4257825751(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4572 > 203.89.146.213.2745: S 4257614747:4257614747(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4608 > 203.248.165.97.2745: S 4259124906:4259124906(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4612 > 203.248.165.97.3127: S 4259306850:4259306850(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4605 > 203.171.104.23.6129: S 4258977243:4258977243(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4592 > 203.89.210.235.1025: S 4258477049:4258477049(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4604 > 203.171.104.23.3127: S 4258938239:4258938239(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)
203.89.146.62.4598 > 203.89.210.235.http: S 4258699747:4258699747(0)
win 8760 <mss 1460,nop,nop,sackOK> (DF)

It just a small snapshot :)

As we categories this sorta client with virsu infected and got
disconnect him forcefully  :( not a good practice, however its
necessary to get rid of such shits and also sometime block the user
until he get cleaned his system.

1) Alright im not going to ask squid related things in this mailing
list, however I love to know if someone knows after watching tcpdump
output what sorta request he is sending and is he really infected with
some type of virues, spyware?

2) Is it possible to block his "error:request-too-large" requests with iptables?


Any help in this requed will be greatly appreciated as before :)

Regards
Askar Ali

