From: "Victor Wren" <vwren@timension.com>
Subject: Re: OT: Logs on console
Date: Fri, 16 Jul 2004 12:28:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F7C9E9.30435.74F90D@localhost>
References: <40F7BB44.24155.3BC614@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200407161942.32228.Antony@Soft-Solutions.co.uk>
Content-description: Mail message body
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
To: netfilter <netfilter@lists.netfilter.org>



> On Friday 16 July 2004 8:25 pm, Victor Wren wrote:
> 
> > This is off-topic, but IPTABLES is the only place I have this problem. 
> >
> > I've got all my log entries set to --log-level
> > info, and they're getting properly logged to an iptables logfile, but they
> > are still showing up on the screen
> 
> Show us the contents of your /etc/syslog.conf

auth,authpriv.* -/var/log/auth
*.*;auth,authpriv.none -/var/log/messages
kern.none /dev/console
daemon.* -/var/log/daemon
kern.* -/var/log/kern
kern.=info -/var/log/iptables
mail.* -/var/log/mail
user.* -/var/log/user
cron.* -/var/log/cron
*.emerg *
local7.* /var/log/boot.log

I think I may have found a clue.  kernel message logging is handled by klogd. 
 the manfile for klogd says that it defaults to putting all messages of 
priority higher than 7 (debug) to the screen (info is 6) unless launched with 
"-c [level]"  I see no mention of any use of a configuration file in klogd, 
and it appears to hand kernel messages to syslogd after prioritizing, but has 
the ability to send messages to the screen (or files) itself.

Ha.  Changing it to klogd -c 3" seems to have cured it.  Now to fix it on my 
home network!

Victor


Victor Wren
Designer,
Timension Inc.
1350 C Pear Ave
Mountain View CA 94043
(650) 564-9397
Fax: (650) 564-9398
Opinions stated in this letter are not necessarily
those of Timension Inc. or the management.  All
Rights Reserved.  No spitting.


