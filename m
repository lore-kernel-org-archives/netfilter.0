From: Ales Stibal <astib@giganet.cz>
Subject: Re: Why want my iptables scripts run in cron
Date: Mon, 24 Mar 2003 17:03:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E7F2C5B.9040601@giganet.cz>
References: <200303182201.19202.dlm4444@bigzoo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303182201.19202.dlm4444@bigzoo.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: david <dlm4444@bigzoo.net>
Cc: netfilter@lists.netfilter.org

david wrote:

 >I have a simple script called routup.sh to start the routing at a certain
 >time, it is excutable. It runs fine at the command line but not cron. 
here is
 >what my cron entry looks like:                0 9 * * * root   
/etc/routup.sh

What is the reason to run this script in cron? ;-)

 >#routup.sh
 >#!/bin/bash
 >
 >echo 1 > /proc/sys/net/ipv4/ip_forward
 >iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

At first look: remove the first line. Let the #!/bin/bash
be at the first instead of #routup.sh.

BTW: why do you run bash? Run sh. It's not error
in fact, but the sh usage is something like idiom.
AFAIK sh is link to your default shell, probably bash.

 >I even went as far to add a path to the crontab file like this:
 >vi crontab   
 >/sbin/iptables.

This looks strange to me. Could you send  more info if
the stuff above wont help?

 >where am i going wrong.
 >The o.s. is linux mandrake 9.0
 >
 >thanks for any help,

Hope this helps,
      Astib();

-- 
A l e s  S t i b a l, Wintel free, powered by AthlonXP and Gentoo Linux.
<astib@giganet.cz> Giganet.cz community network, Litomerice, Czech Republic




