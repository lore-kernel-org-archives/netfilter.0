From: Gary Metcalf <gtm@lou-telecom.net>
Subject: ip masqurade
Date: Fri, 06 Jun 2003 12:31:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EE0C1E9.4000502@lou-telecom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm running Slackware 8.1 with kernel 2.4.18. I'm needing to have some 
computers on my LAN to gateway to the internet via my Linux Modem. My 
modem does connect to the internet ok and I can use it via my Linux 
system. What I don't know and have been reading the How-To's is how to 
set this thing up. I've un-remarked some lines in my rc.modules file 
that is supose to allow ipmasqurade when I boot. Now I have learned that 
I need to build some tables and this is where I get lost.
    My Linux IP address is: 192.168.168.1   and one of my computers 
(windows) on my lan is: 192.168.168.2
What lines do I need to input for iptables to set this up where it will 
allow browsing and mail for my windows computer and other computers on 
my lan which will fall in the ip range of 192.168.168.0/24
     Gary


