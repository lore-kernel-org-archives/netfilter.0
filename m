From: "Michael K" <micke@klintan.se>
Subject: How to log
Date: Tue, 25 Feb 2003 22:01:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2dd11$129f2f80$0200a8c0@klintan.local>
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

When I uses the --jump LOG in iptables it logs to /dev/console. Read the
man page for syslog.conf(5) and added "kern.warn /var/log/krnmsg".
Restarted syslog; and still it logs to /dev/console.
Can I prevent this from happening?
Is there another (better) way to log?
Can't I use something like "iptables.* /var/log/iptables" so that I only
get messages from iptables? (Did try it, byt didn't work)

BTW: the system is Redhat 7.3



