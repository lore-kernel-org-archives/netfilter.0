From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IPTables logging
Date: Mon, 3 Feb 2003 23:07:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302032307.47227.netfilter@newkirk.us>
References: <3E3F35B9.2040903@pobox.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E3F35B9.2040903@pobox.com>
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
To: Patrick Topping <ptopping@pobox.com>, netfilter@lists.netfilter.org

On Monday 03 February 2003 10:38 pm, Patrick Topping wrote:
> Is it possible to have iptables log to some other file than the
> messages file on a linux server??  I would like to be able to have a
> log file of just iptables info and not all the other system info.=20
> Thanks in advance.
>
> -Patrick

How you do this will depend on your Linux distribution, but the following=
=20
is the general method that works in most cases.

Edit your /etc/syslog.conf file and add the following line:

kern.=3Ddebug =09 /var/log/firewall

This will tell it to send Kernel logging messages (Netfilter is part of=20
the kernel, after all) of level "debug" to the listed file.  In normal=20
usage, most people have very little kernel debug logging traffic.  You=20
WILL have other messages occasionally, but unless you are actually=20
debugging a kernel build they will be minimal.

You will need to restart the syslogd daemon after this change.  On many=20
systems this can be done (as root) with:

service syslog restart

Or by simply restarting the machine.

The final ingredient is to append "--log-level 7" to all your iptables=20
log rules, telling it to log as debug-level messages, which you've=20
already told syslog to write to their own file.

j


