From: debritoa@frcu.utn.edu.ar
Subject: Sparc question
Date: Fri, 25 Jul 2003 10:54:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059130465.3f210c61ae555@webmail.frcu.utn.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all, i am using iptables (1.2.8) + iproute on Slackware 8.0 working fine, 
marking packet based in destination port and network and selecting the 
appropriate route with this marks (i have two links, a 256Kb frame relay and a 
512Kb ADSL).  
Now i change the machine for a Sun Enterprise 250 (with Debian 3.0r1) and 
iptables works fine (the packets are marked) but iproute don't send them by 
the correct interface (only use the default gateway, ppp0). I compile from 
source the kernel (2.4.19, 2.4.20, 2.4.21) with the last patch-o-matic and 
several versions of iproute.  
 
Any idea?.  
 
Thanks. 
 



