From: KJ <ksj@sover.net>
Subject: iptables, PPTP, and actually making it all work!
Date: 18 Mar 2003 13:18:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048011490.1161.5.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
I have a small network at my house (where I work out of, lucky me!) and
I have been running Linux 7.3 and ipchains for sometime now.  I have a
Linux 8 box built and ready to roll, but everytime I try to get it
running, I run into roadblocks.  The issues are this.
1) When I first get everything running I have access to the internet
from my firewall box through eth0, I setup iptables to masquerade all,
that is all I do... it worked in the past, but seems to not be working
now.  I can't even ping eth1 from inside my network.
2) I need to do PPTP through my iptables firewall and I can't... 

I'm very confused and frustrated, this has been going on for about a
month and I can't find any help.  anyone that can help would be GREATLY
appreciated. 

Thank you in advance. 
KJ




