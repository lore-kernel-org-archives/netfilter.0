From: Chris Shepherd <chriss@whstuart.com>
Subject: Re: how to configure iptables / syslog to log to separate file
Date: Wed,  8 Jan 2003 15:37:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042058254.3e1c8c0e93c83@mail.whstuart.com>
References: <3E1C89D7.7000706@TemporalArts.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E1C89D7.7000706@TemporalArts.com>
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
To: "Randall J. Parr" <RParr@TemporalArts.COM>
Cc: netfilter@lists.netfilter.org

Quoting "Randall J. Parr" <RParr@TemporalArts.COM>:

> Can I, and if so how can I, configure iptables (esp using GuardDog which
> I use to configure iptables) and/or syslog (ie /etc/syslog.conf, ...) so
> that my firewall messages are logged into a file other than
> /var/log/messages?
> 
> I have searched, looked at tutorial, etc. and found this question asked
> many times but without ever finding a decent answer.
> 
> If it just can not be done, could someone who knows this please state so?

Configure Syslog to log a certain log-level to an alternate file, and then just 
use  "-j LOG --log-level <level>". ie: if you wanted it to log as a notice, 
just setup Syslog to log notices to another file, and drop in a line that reads 
like:

iptables -A LOGGING_TABLE -j LOG --log-level notice --log-prefix="NF: "

I'm not too up on Syslog myself, so you should read the docs for that, but I do 
believe it is possible to log specific log-levels to an alternate file.

-- 
Chris Shepherd

-------------------------------------------------
This email may contain confidential information. Use of any such information
is strictly prohibited without express written consent of the sender



