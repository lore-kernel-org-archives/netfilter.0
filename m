From: Tim Burress <hokousha2001@yahoo.com>
Subject: Dropped/Corrupted Log Entries?
Date: Mon, 2 Aug 2004 23:19:36 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040803061936.50702.qmail@web21121.mail.yahoo.com>
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

Hello!

We've run across a problem and I thought I would check
to see if anyone else has seen this, or has
suggestions for how to fix or work around it. On both

Linux 2.4.21, iptables v1.2.8
Linux 2.4.26, iptables v1.2.11-20040621

When we do a very fast port scan of a system on the
other side of a firewall with various common rules, a
majority of the denied connection attempts are not
showing up in the logs even though they should be, and
depending on circumstances and versions, anywhere from
1% to 100% of the accepted connections are also not
being logged.

At the same time, we also notice that some corrupted
Netfilter log entries are appearing in our default
system log, each typically the last 3/4 or so of a
legtimate-looking log entry. There are only a few of
these -- they don't make up the balance of the missing
entires mentioned above -- but it does indicate that
the scan is overwhelming the ability of the system to
correctly manage log data.

We tried rebuilding the 2.4.26 kernel with a larger
value for CONFIG_LOG_BUF_SHIFT, but this did not seem
to have an effect. We do not have any explicit log
rate-limiting configured. Does anyone know what is
happening here, or have suggestions for what we might
tune to eliminate the problem?

Thanks!

Tim

PS Certainly if it would help to see the rules, I can
send those as well, but they're long, and anyway this
seems like more of a general issue. Just let me know!


		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 

