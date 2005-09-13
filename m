From: frayn@shaw.ca
Subject: Why must I restart Iptables?
Date: Mon, 12 Sep 2005 17:50:54 -0700
Message-ID: <5.0.2.1.2.20050912172705.01d82d60@shawmail.cg.shawcable.net>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ok, first off I'm new to Netfilter and Iptables.

I've setup an old computer running linux to act as a firewall. It has 
access to the net. On my internal network I have a Win 98 machine connected 
to my linux box/firewall also with access to the net.

I used firehol to start out with to set up my iptable rules. I then saved 
the iptable rules and disabled firehol.

When I boot my linux box I see the message "Applying iptable firewall rules".
 From the linux box I can ping the external (internet) and the internal 
networks.
 From my Win 98 machine I can ping the linux box, but not the internet.

If go to etc/rc.d/init.d  and do a ./iptables restart
everything works fine.   (using RedHat Fedora)

It took me a while to get to this point. Everything seems to be working the 
way I want. I'm just trying to figure out why I must restart Iptables for 
the rules to work?

Thank you.




