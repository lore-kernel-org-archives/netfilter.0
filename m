From: "Danny Ma" <drp666c@email.com>
Subject: Can iptables NAT do this?
Date: Thu, 31 Jul 2003 15:40:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030731204019.26323.qmail@email.com>
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

Hi, 
   Here is my network layout:


Internal            o-------------------------o	
Network   eth0  |  Firewall/Gateway    | eth1
===========>|  Linux 2.4.18            |====>ROUTER==> INTERNET
                        o-------------------------o

I'm able to see all the packets from my internal LAN regardless of what their IP configuration is (DHCP, Static ip, etc) on the eth0 PREROUTING table on the Linux Gateway and am trying to figure out what I need to do to the packets so that they will go thru my Linux firewall/Gateway to the internet. I've successfully been able to proxy ARP (spoof) so that all internal machines think that the Linux server is the gateway and they all send their packets to the Linux server but now I need to know what routing changes I need to make on the Linux server so that it can route via NAT all the packets to the internet.

Any help is greatly appreciated.

Danny


-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

CareerBuilder.com has over 400,000 jobs. Be smarter about your job search
http://corp.mail.com/careers


