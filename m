From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: OT: Logs on console (nfcan: addressed to exclusive sender for this address)
Date: Fri, 16 Jul 2004 14:52:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040716185214.GA17586@salty>
References: <40F7BB44.24155.3BC614@localhost>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40F7BB44.24155.3BC614@localhost> (from +nfcan+jimlaur+c5c49c4dd0.vwren_netfilter#timension.com@spamgourmet.com on Fri, Jul 16, 2004 at 15:25:56 -0400)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.07.16 15:25, Victor Wren  - vwren_netfilter@timension.com wrote:
> This is off-topic, but IPTABLES is the only place I have this problem.  I've
> tried several different configurations to try to stop it from logging  
> dropped
> 
> packets to my monitor.  I've put "kern.none /dev/console" in my syslog.conf,
> and it is STILL throwing the logs entries to the monitor, even when nobody  
> is
> 
> logged in!  I've got all my log entries set to --log-level info, and they're
> getting properly logged to an iptables logfile, but they are still showing  
> up
> 
> on the screen (the tutorials say this isn't an iptables issue, but ONLY the
> iptables logs are showing up on the screen).  I've been searching the
> internet for days trying to STOP THE MADNESS!
> 
> Anybody got any suggestions?

I had a problem like this too, and it also drove me nuts.

At least on my RH system, there is a file /etc/sysconfig/syslog.
This file contains optional settings, including logging levels,
for BOTH syslogd and klogd!
In this file are some lines like this:

 # See klogd(8) for more details
 KLOGD_OPTIONS="-x -c 1"

I added the -c 1 to KLOGD_OPTIONS so that
only high priority messages would print.
Look at the man page for more.

Hope this helps,

Jim

