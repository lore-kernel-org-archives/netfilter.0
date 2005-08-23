From: Chadley Wilson <chadley@ngn.co.za>
Subject: Susefirewall2 redirecting
Date: Tue, 23 Aug 2005 15:20:08 +0200
Message-ID: <200508231520.08360.chadley@ngn.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Greetings,

I am struggling to figure out what I have wrong, 

We have a remote desktop situation here. 

My firewall is a Suse 9.3 box, and works well, but now I have a problem with 
the firewall, and I think its because I lack some knowledge on how-to do 
this:

Our ISP hosts the dns records for ngn.annoip.org which resolves to 
196.31.62.99. But this is our firewall not the windows pc.

There are two lan cards in each the firewall 196.31.62 being the external and 
196.100.100 being the internal. 

Everthing on our lan must go through the firewall to gain access to the net 
and vica-versa,

I have treid a few rules to redirect traffic from the internet --dport 3389 to 
the remote desktop pc port 3389. But nothing seems to work.
These are the currecnt rules in my firewall setup for this.

-A PREROUTING -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p tcp -m tcp 
--dport 3389 -j MARK --set-mark 0x1

-A PREROUTING -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p udp -m udp 
--dport 3389 -j MARK --set-mark 0x1

-A forward_ext -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p tcp -m limit 
--limit 3/min -m tcp --dport 3389 -m state --state NEW -j LOG --log-prefix 
"SFW2-FWDext-ACC-REVMASQ " --log-tcp-options --log-ip-options

-A forward_ext -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p tcp -m tcp 
--dport 3389 -j ACCEPT

-A forward_int -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p tcp -m limit 
--limit 3/min -m tcp --dport 3389 -m state --state NEW -j LOG --log-prefix 
"SFW2-FWDint-ACC-REVMASQ " --log-tcp-options --log-ip-options

-A forward_int -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p tcp -m tcp 
--dport 3389 -j ACCEPT

-A input_ext -p tcp -m limit --limit 3/min -m tcp --dport 3389 --tcp-flags 
SYN,RST,ACK SYN -j LOG --log-prefix "SFW2-INext-ACC-TCP " --log-tcp-options 
--log-ip-options

-A input_ext -p tcp -m tcp --dport 3389 -j ACCEPT

-A input_ext -p udp -m udp --dport 3389 -j ACCEPT

-A PREROUTING -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p tcp -m tcp 
--dport 3389 -j REDIRECT --to-ports 3389

-A PREROUTING -s 196.31.62.0/255.255.255.0 -d 196.100.100.2 -p udp -m udp 
--dport 3389 -j REDIRECT --to-ports 3389

-A PREROUTING -s 196.31.62.0/255.255.255.0 -d 196.31.62.99 -i eth0 -p tcp -m 
tcp --dport 3389 -j DNAT --to-destination 196.100.100.2:3389


Any ideas as to how I can force this to work?

TIA

-- 
--
Chadley Wilson
Production Line Superintendant
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================

