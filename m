From: ignaciob@123plaza.com
Subject: Re: ip_tables_names not showing any results.. please help
Date: Sun, 2 May 2004 15:49:37 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2846.216.22.86.180.1083527377.squirrel@www.123plaza.net>
References: <1402.216.22.86.180.1083517083.squirrel@www.123plaza.com>
    <200405021823.58366.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405021823.58366.Antony@Soft-Solutions.co.uk>
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

> On Sunday 02 May 2004 5:58 pm, 123plaza Malls wrote:
>
>> Hi All,
>>
>> Please forgive my ignorance, but being an inexperienced linux user I
>> managed to break something with my iptables
>
> What were you doing when it broke?   Recompiling your kernel?
> Recompiling
> iptables?   Fiddling with the startup scripts?  Un/Installing netfilter
> RPMs?

The last thing I remember doing was 2 things:

1) Modify a script I use via cron.hourly used to clear iptables blocking
entries set by portsentry, AND made a mistake when calling a command to
clear history files. The script with the mistake looks like this:

----%<-----------------------------------------
#!/usr/bin/perl

# Script: iptables.restart
#
# Use on cron.hourly to restart (flush) iptables that may be
# polluted with ecessive IPs blocked by portsentry intrusion
# detection
#
# IMPORTANT NOTE:
#
# Change the next line to 0 instead of 1 to enable this script.
# By default it will be disabled and will not do anything.
#

$disabled = 0;

exit if $disabled;

# Clear and reload original iptables file
my $results_01 = `service iptables restart` or print STDERR "couldn't exec
\"service iptables restart\": $!";

# Clear porsentry local blocked history files
my $results_02 = `/bin/cat /dev/null > /bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.atcp`;

my $results_03 = `/bin/cat /dev/null > /bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.audp`;

my $results_04 = `/bin/cat /dev/null > /bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.stcp`;

my $results_05 = `/bin/cat /dev/null > /bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.sudp`;

my $results_06 = `/bin/cat /dev/null > /bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.tcp`;

my $results_07 = `/bin/cat /dev/null > /bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.udp`;

When run the script bombed, although do not see how this could have caused
the problem other that the faulty lines where executed immediately after
restarting iptables. Notice the errors in the double entries for
"`/bin/cat /dev/null > ", the correct code should be:

my $results_02 = `/bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.atcp`;

my $results_03 = `/bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.audp`;

my $results_04 = `/bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.stcp`;

my $results_05 = `/bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.sudp`;

my $results_06 = `/bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.tcp`;

my $results_07 = `/bin/cat /dev/null >
/var/log/portsentry/portsentry.blocked.udp`;


2) Other than this recently upgraded the kernel to latest (rpm) version
from redhat

Is any way I can get things back to normal again?



-----------------------------------------
This email was sent using SquirrelMail.
   "Webmail for nuts!"
http://squirrelmail.org/

