From: "Luis Fernando C. Talora" <talora-listas@talora.com.br>
Subject: iptables logging exhibites lines on current virtual console
Date: 08 Dec 2002 23:42:33 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039380153.1095.13.camel@osbourn.intranet>
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

Hi there!

I having some trouble with iptables' logging functionality and would
like some help. I've enabled logging for every dropped packet, using LOG
target. On /etc/syslog.conf, I'm using the following:

kern.*                                                 /dev/tty10
kern.*                                                 /var/log/kernel

(I want syslogd to generate a log of dropped packets both on console 10
and /var/log/kernel file.)

Here's the problem: I've realized that many of the log lines generated
are exhibited on current console: tty1, tty2, etc. Do anybody know the
reason of that behavior? Is there a way to change that?

Thank you all!

[]'s

Luis Fernando C. Talora





