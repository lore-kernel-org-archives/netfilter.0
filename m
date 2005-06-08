From: "Jimmy" <squid@oranged.to>
Subject: netfilter logging
Date: Wed, 8 Jun 2005 14:25:33 +0100 (BST)
Message-ID: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from 212.100.225.55
	(SquirrelMail authenticated user squid@oranged.to)
	by webmail.* with HTTP; Wed, 8 Jun 2005 14:25:33 +0100 (BST)
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

I have just started to log my iptables drops. As seen with this line in my
iptables-save output.

-A INPUT -j LOG --log-level 1
-A INPUT -j LOG --log-prefix "Dropped: "

What I would like to know is how I can get iptables to NOT log to console
only to the message logs. Currently it goes into /var/log/syslog

Here is my syslog configuration. I cant see whats wrong with it.

# /etc/syslog.conf
# For info about the format of this file, see "man syslog.conf"
# and /usr/doc/sysklogd/README.linux.  Note the '-' prefixing some
# of these entries;  this omits syncing the file after every logging.
# In the event of a crash, some log information might be lost, so
# if this is a concern to you then you might want to remove the '-'.
# Be advised this will cause a performation loss if you're using
# programs that do heavy logging.

# Uncomment this to see kernel messages on the console.
#kern.*                                                 /dev/console

# Log anything 'info' or higher, but lower than 'warn'.
# Exclude authpriv, cron, mail, and news.  These are logged elsewhere.
*.info;*.!warn;\
        authpriv.none;cron.none;mail.none;news.none     -/var/log/messages

# Log anything 'warn' or higher.
# Exclude authpriv, cron, mail, and news.  These are logged elsewhere.
*.warn;\
        authpriv.none;cron.none;mail.none;news.none     -/var/log/syslog

# Debugging information is logged here.
*.=debug                                                -/var/log/debug

# Private authentication message logging:
authpriv.*                                              -/var/log/secure

# Cron related logs:
cron.*                                                  -/var/log/cron

# Mail related logs:
mail.*                                                  -/var/log/maillog

# Emergency level messages go to all users:
*.emerg                                                 *

# This log is for news and uucp errors:
uucp,news.crit                                          -/var/log/spooler

# Uncomment these if you'd like INN to keep logs on everything.
# You won't need this if you don't run INN (the InterNetNews daemon).
#news.=crit                                     -/var/log/news/news.crit
#news.=err                                      -/var/log/news/news.err
#news.notice                                    -/var/log/news/news.notice


Any advice would be great.

Thanks





