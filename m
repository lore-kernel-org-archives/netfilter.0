From: "Hurley, Michael" <MHurley@law.uconn.edu>
Subject: logging to console
Date: Tue, 16 Dec 2003 10:59:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AD8D39C727CBD411BB2C0090273A727408F9ED49@mortimer.law.uconn.edu>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Using iptables 1.2.8-8.72.3 on Red Hat Linux 7.3, kernel 2.4.20-20.7.

Haven't found a solution to this so far: iptables LOG is logging to console.
This only occurs on the consoles directly connected to the machine. Logging
in remotely does not have this problem.

Here's what I've tried so far, w/o success:
set log-level to notice, added kern.=notice /var/log/firewall to
syslog.conf, restarted syslogd.
set log-level to warning, added kern.=warning /var/log/firewall to
syslog.conf, restarted syslogd.

Still keeps on logging to local consoles. (BTW, kern.* is not accounted for
in syslog.conf).

I haven't tried setting the printk values yet (at present, the values are 6
4 1 7)--unsure of what the consequences might be of tinkering with that.

What is the best way to stop this irritating behavior? Thanks,


Michael Hurley
mhurley@law.uconn.edu 

