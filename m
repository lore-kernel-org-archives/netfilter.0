From: Joshua Jackson <jjackson@vortech.net>
Subject: PPTP NAT module
Date: Tue, 9 Dec 2003 18:03:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312091803.55451.jjackson@vortech.net>
Reply-To: jjackson@vortech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I know there have been a pile of questions about this module in the past, but 
I can't seem to find any responses about the behaviour I am seeing.

I am currently running a 2.4.23 kernel with the lastest officially released 
POM patches applied to it. The network being protected by the firewall is 
providing NAT for the hosts behind it. If the ip_nat_pptp module is loaded, 
none of the protected clients can establish an outbound PPTP session. If the 
conntrack modules are removed, a single session can be established (as would 
be expected).

The remote PPTP server log shows the initial TCP connection, but never sees 
any GRE traffic from the connecting host.

I have seen posts about the local NAT kernel option, I have tried it both ways 
with the same results. If there are any kernel settings in particular that I 
may be missing, please let me know.

My iptables firewall rules include a default policy of DROP for INPUT and 
FORWARD, ACCEPT for OUTPUT. The first line in the rules includes an ACCEPT 
for the INPUT chain for established and related connection. There is also a 
rule allowing any traffic for all protocols to any host which originates from 
the protected network on the internal interface.

-- 
Joshua Jackson
Vortech Consulting
http://www.vortech.net


