From: "Slawomir Orlowski" <orlowscy@hotpop.com>
Subject: help needed: clogged console
Date: Tue, 23 Dec 2003 13:31:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ea01c3c982$fe3196a0$4900a8c0@cympak.com>
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
To: shrike-list@redhat.com, redhat-list@redhat.com
Cc: netfilter@lists.netfilter.org

Hello,

I have Linux RH 9.0 configured as filtering firewall, and getting a lot of
(kernel, iptables) messages on active consoles.
I have thought that putting in /etc/syslog.conf:

# *.kern /dev/console
kern.* /var/log/kernel
kern.* /dev/tty8

would free me from this, but it did not.
How can I force kernel message to appear only in /var/log/kernel log and on
tty8 only?

Best Regards
I hope that somebody will be able to help me.
When  I'm getting a lot of dropped packages it is not possible even to log.

Slawomir Orlowski


