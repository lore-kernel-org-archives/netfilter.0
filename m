From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: Logging
Date: Mon, 15 Mar 2004 17:25:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040315162528.GI10272@home.manuelm.org>
References: <1079365863.2163.8.camel@vejan>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1079365863.2163.8.camel@vejan>
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

* Mario Udina <m.udina@libero.it> 15. Mar 04:
> Hello!

Hi,

> As I read in the man the file where the logs are written is the kernel
> log i.e. /var/log/messages

Maybe, by default.

> is there a way to send this output to another file in order to keep the
> logs clean?

This is not possible with iptables or netfilter.  You want to read the
man page of your sysklogd, especially of syslog.conf.  You can specify
priority in a rule.   Maybe you want to use another syslogger (syslog-ng
provides file redirect on patterns, AFAIK, would be usefull with the
--log-prefix option.).

HTH,
 regards, Frank.
-- 
Sigmentation fault

