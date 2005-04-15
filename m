From: Julian Labuschagne <personxx@wan4u.co.za>
Subject: Port Forwarding Problem
Date: Fri, 15 Apr 2005 10:34:24 +0000
Message-ID: <425F98B0.7040303@wan4u.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everyone I'm a bit new to iptables so please bear with me on this one ;)

I wrote a small firewall that basicaly nats users through my gateway 
machine only allowing certain hosts on my network Web DNS and Mail access.

This section works fine.

But I also want to port forward any connections from outside to port 800 
to a host running inside my LAN.
I added a rule in the PREROUTING table to do this.

But it seems that no connection gets forwarded.

If I set my default policies to ACCEPT and add the PREROUTING rule it 
actualy does the port forwarding correctly.

I attached a copy of the firewall I wrote with this message.

Please can someone have a look through it for me cause I'm sure I'm just 
missing something.

Kind Regards Julian.



