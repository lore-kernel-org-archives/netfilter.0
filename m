From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: netfilter logging
Date: Wed, 08 Jun 2005 12:14:01 -0500
Message-ID: <42A72759.7000906@gmx.co.uk>
References: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jimmy wrote:
> I have just started to log my iptables drops. As seen with this line in my
> iptables-save output.

IMO a big mistake. Well, it's not so much a mistake as it is an 
important exercise to show you how much useless logging netfilter can 
produce. My firewalls now generally do very little logging, logging only 
for specific purposes.

> -A INPUT -j LOG --log-level 1
> -A INPUT -j LOG --log-prefix "Dropped: "

Ouch!!

> What I would like to know is how I can get iptables to NOT log to console
> only to the message logs. Currently it goes into /var/log/syslog

First, understand that this is more a syslogd question than a netfilter 
one. Second, understand what --log-level 1 is! Of course that logs to 
console:

> Here is my syslog configuration. I cant see whats wrong with it.

(It's typical. You could have cut out the comments, BTW.)

> # /etc/syslog.conf
> [snip]
> # Emergency level messages go to all users:
> *.emerg                                                 *

  From iptables(8):
--log-level level
     Level of logging (numeric or see syslog.conf(5)).

The pointer is incorrect, at least for my Slackware: numeric levels are 
listed in syslog(2), not in syslog.conf(5). If you meant debug, I think 
that is "--log-level 8" (or just "--log-level debug").

Finally, and this IS your iptables issue: you have two LOG target lines, 
thus the aforementioned "ouch". You're logging first with --log-level 1 
and again with the --log-prefix "Dropped: ".

Delete all those log files. Have fun. :)
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

