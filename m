From: "Curby ." <kirbysdl@hotmail.com>
Subject: network/iptables start order
Date: Mon, 10 Jan 2005 18:19:06 +0000
Message-ID: <BAY101-F3520280EA804079C9229A4DF970@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

In what order should i have /etc/init.d/network and my iptables setup script 
(henceforth called "iptables") start?

If network starts first, netfilter defaults all filter chains in ACCEPT 
policy, so there's a tiny chance that someone could do something unwanted.  
Is this sufficient reason to start iptables or otherwise change chain 
policies before network? I'm thinking yes.

If iptables starts before network, then network could override settings in 
/proc/sys/net when it calls upon /etc/sysctl.conf.   Additionally, it would 
be harder to identify dynamic IPs, additional IPs set with "ip addr add," 
etc.  simply because the network isn't up yet.

Some choices are:
1) load a "stub" with priority 9 that will set all chains in table to DROP 
policy, and have iptables start after network.
2) have a stub with priority 11 reset the wanted sysctl settings, and have 
iptables start before network
3) either of the above by calling the entire firewall script both before and 
after network .. ugh
4) simply have the firewall script start after network, ignoring the brief 
security hole.

As much as possible, I'd like to have my firewall script(s) be 
self-contained... that is, I'd prefer that it didn't modify sysctl.conf, 
/etc/init.d/network, etc. directly.   Any thoughts?  Thanks!

--Curby



