From: Trevor Morrison <trevor@hailix.com>
Subject: Redirect of DNS requests
Date: Sun, 17 Aug 2003 20:41:22 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F403CD2.4060507@hailix.com>
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

Hi,
I have looked back through the archives and searched on "Redirect" but I 
did not find the answer to my specific problem.

I have a RH 9.0 with a 2.4.20 kernel.  The box is running iptables-1.2.7 
and does NAT from my 192.168.1.x network to my  ISP assigned dhcp IP. 
 What I would like to do is redirect a certain domain's email, DNS, or 
Web traffic to a w2k server that sits in my private network, sort of 
like a DMZ situation and have the another domain's services continue to 
be routed to the RH box.  On the RH box I am running Bind and Sendmail 
amoung other things.

 I am sorry if this quesiton has been asked before, but I have looked 
through the last 12 months of the archeives looking for the answer.

TIA

Trevor


