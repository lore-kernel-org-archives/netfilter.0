From: Michael Thompson <mike@thompsonmike.co.uk>
Subject: Is this possible?
Date: Fri, 11 Feb 2005 16:06:45 +0000
Message-ID: <420CD815.1000806@thompsonmike.co.uk>
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

I have a issue where I cannot connect to my server because the firewall 
only allows ports 80 and 443 out.

I previously ran SSH on port 443 to overcome this, but I have had to 
implement a HTTPS solution for users who wanted secure access, so that 
is now gone.

This system has DNS records for ssh.server.co.uk and www.server.co.uk, 
so can I use IPTables or similar to recognise if it is being connected 
to via ssh.server.co.uk on port 443 and forward the traffic to port 22? 
If www.server.co.uk:443 is used apache gets the traffic? Or is this (As 
I suspect) Impossible?

