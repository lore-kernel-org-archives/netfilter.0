From: "Andy B." <globi@hot.lu>
Subject: port forwarding through localhost
Date: Fri, 26 Jan 2007 22:56:27 +0100
Message-ID: <000001c74194$d484d9b0$0d01a8c0@Mobi>
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

I have a port forwarding issue with localhost.

Here is the deal:

Webserver that uses many many mySQL connections to 127.0.0.1 (Port 3306).

Now I would like to put the mySQL server onto a dedicated machine without
changing the "127.0.0.1" setting on a few hundred websites.

The new mySQL Server listens on 10.0.0.100:3306

My first guess was the following ruleset on the webserver:

iptables -t nat -A PREROUTING -p tcp -i lo --dport 3306 -j DNAT --to
10.0.0.100

Then I tried to telnet 127.0.0.1 3306, which failed immediately


I figured out the prerouting is no good for localhost and changed it into:

iptables -t nat -A OUTPUT -o lo -p tcp --dport 3306 -j DNAT --to
10.0.0.100:3306

telnet 127.0.0.1 3306 seems to do something, but not what I expected:

$ telnet 127.0.0.1 3333
Trying 127.0.0.1...

<sleeping...... sleeping......>

Timeout eventually.


A few more informations on the webserver:

- eth0 = public IP (not needed here)
- eth1 = 10.0.0.99
- lo = 127.0.0.1

Dedicated MySQL Server:

- eth0 = public IP (not needed here)
- eth1 = 10.0.0.100
- lo = 127.0.0.1


What am I missing or doing wrong?

Thanks a lot,

Andy


