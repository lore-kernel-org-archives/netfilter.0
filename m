From: "Victor Wren" <vwren_netfilter@timension.com>
Subject: OT: Logs on console
Date: Fri, 16 Jul 2004 11:25:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F7BB44.24155.3BC614@localhost>
Reply-To: vwren_netfilter@timension.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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

This is off-topic, but IPTABLES is the only place I have this problem.  I've 
tried several different configurations to try to stop it from logging dropped 
packets to my monitor.  I've put "kern.none /dev/console" in my syslog.conf, 
and it is STILL throwing the logs entries to the monitor, even when nobody is 
logged in!  I've got all my log entries set to --log-level info, and they're 
getting properly logged to an iptables logfile, but they are still showing up 
on the screen (the tutorials say this isn't an iptables issue, but ONLY the 
iptables logs are showing up on the screen).  I've been searching the 
internet for days trying to STOP THE MADNESS!

Anybody got any suggestions?

Victor
sysadmin, Timension Inc.

