From: Palmer Sample <lsample@massconfusion.com>
Subject: Help: iptables INPUT/OUTPUT packet statistics (no INPUT packets?)
Date: Mon, 18 Nov 2002 21:01:07 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211182050510.2228-100000@www.massconfusion.com>
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
To: netfilter@lists.samba.org


Hi all,

I'm running iptables 1.2.5 on a RedHat 7.2 box, and am trying to use MRTG 
to graph some statistics about the firewall.  My original thought was to 
record the INPUT and OUTPUT packets and go from there.

My problem is that I don't seem to have any INPUT packets!  I recently 
zeroed out the statistics, and see plenty of OUTPUT packets accumulating 
but nothing on the INPUT side.

This is a single box with one interface (eth0), not connected to a 
network behind it (I'm using iptables to prevent access to pretty much 
anything but ssh on eth0)

iptables -A INPUT -p tcp -s localhost -j ACCEPT
iptables -A INPUT -p udp -s localhost -j ACCEPT
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -j REJECT
iptables -A INPUT -p udp -j REJECT
iptables -A INPUT -j ACCEPT

Display of stats since I zeroed them:

# iptables -nvxL | grep Chain
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
Chain OUTPUT (policy ACCEPT 8574 packets, 1796431 bytes)

Any ideas / questions / suggestions?

Also - on a side note (i know this isn't the MRTG mailing list, but I 
think this applies to either/or):  Is there any way I could gather 
statistics for a certain port (e.g. 22 for ssh, 80 for www if I open up 
web services) - without bloating my already suffering syslog with packet 
debug info?  I like the idea of the chain packet list - that's easy enough 
to grok out)

Please reply to this email address; I have not yet subscribed to the 
netfilter list.

Thanks!
-Palmer Sample

-- 
"A man is but the product of his thoughts; what he thinks, he becomes."
 - Mohandas Gandhi 

"I'm on the Zoloft to keep from killing y'all."
 -Mike Tyson
--

Palmer Sample
[e] lsample@massconfusion.com


