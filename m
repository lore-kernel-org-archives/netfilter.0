From: Bob Sully <rcs@malibyte.net>
Subject: Netfilter LOG info dumped to /dev/console - annoying
Date: Sun, 29 Sep 2002 21:08:25 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209272201370.18601-100000@firefox.malibyte.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I've noted some odd behavior for some time lately - despite the fact 
that I have syslog configured to put all kernel messages in 
/var/log/messages, I notice that all of the netfilter messages get 
logged to /var/log/messages *and* get dumped to /dev/console.  

No other kernel messages get dumped to /dev/console - only the iptables 
logs.  This was fairly random and infrequent with earlier versions of 
iptables and RedHat distros; it happens every time a packet gets LOGged 
with the current setup (RedHat 7.3 and iptables 1.2.5).  This is very 
annoying!! Anyone have a fix for this?  This is my current /etc/syslog.conf:


#kern.*                                                 /var/log/kernel
#kern.notice                                            /var/log/kernel

# Real-time dump to tty12
*.*                                                     /dev/tty12

# Log anything (except mail) of level info or higher.
# Don't log private authentication messages!
*.info;mail.none;authpriv.none                          /var/log/messages

# The authpriv file has restricted access.
authpriv.*                                              /var/log/secure

# Log all the mail messages in one place.
mail.*                                                  /var/log/maillog

# Log cron stuff
cron.*                                                  /var/log/cron

# Everybody gets emergency messages, plus log them on another
# machine.
*.emerg                                                 *

# Save mail and news errors of level err and higher in a
# special file.
uucp,news.crit                                          /var/log/spooler

# Save boot messages also to boot.log
local7.*                                                /var/log/boot.log



-- Bob --
________________________________________
Bob Sully - Simi Valley, California, USA
http://www.malibyte.net

"The weather is here - wish you were beautiful." - J. Buffett




