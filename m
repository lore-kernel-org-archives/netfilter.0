From: "Matthew Boehm" <mboehm@cytelcom.com>
Subject: rules dissapearing
Date: Wed, 23 Mar 2005 17:48:37 -0600
Message-ID: <030601c53002$e7528560$3400000a@cytelcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,
 We run a webserver on FC1 with iptables 1.2.9 and kernel 2.4.22.

If I do "service iptables save" and then "cat /etc/sysconfig/iptables|wc -l"
I get 325 rules.

In particular, rule #106 on the INPUT chain allows incomming FTP to a
specific IP from anywhere. There are some other rules that allow for ftp to
stay alive (I think).

106  ACCEPT     tcp  --  anywhere             mydomain.com        tcp
dpt:ftp
210  ACCEPT     tcp  --  anywhere             anywhere            tcp
spts:1023:65535 dpt:ftp state RELATED,ESTABLISHED
211  ACCEPT     tcp  --  anywhere             anywhere            state
RELATED,ESTABLISHED multiport dports ftp,ftp-data
212  ACCEPT     udp  --  anywhere             anywhere            state
RELATED,ESTABLISHED multiport dports ftp,ftp-data

I just added rule #106. At some point between now and say 24hrs from now,
rule #106 will dissapear. It is the "ONLY" rule that disappears. So I readd
it. And within another 24 hrs, its gone again. To my knowledge, there are no
cron jobs modifying iptables. The system has an uptime of over 4 weeks.

1stly: How can I find out what time this is happening? I added the rule and
then did a "tail -f /var/log/messages | grep iptables" and left that
running. The next day, I come back and no new lines have been produced from
the tail/grep however, rule #106 is gone!

2ndly: How do I fix this? We have clients that call in all the time wanting
to know why ftp isn't working. Its not working because that rule is missing.

3dly: Why is it "this" rule that is dissapearing? Why not any others?

I've temporaraly fixed this by calling "service iptables restart" every 10
min but that can't be the right way.

Thanks,
Matthew


