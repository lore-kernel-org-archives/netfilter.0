From: john melon <johnmelond@yahoo.com>
Subject: iptables issue after kernel compilation
Date: Mon, 21 Aug 2006 06:16:19 -0700 (PDT)
Message-ID: <20060821131619.11631.qmail@web38608.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,
     I have compile new kernel 2.6.17.8 for my access
vpn server and  
everythings are fine. I am able to connet vpnserver
through MS-clients. 
but when ever i run iptables for nating and
firewalling , following 
errors occurs.
 
 FATAL: Module ip_tables not found.
 iptables v1.3.5: can't initialize iptables table
`filter': iptables 
who? (do you  need to insmod?)
 Perhaps iptables or your kernel needs to be upgraded.
 
 
 I have  select all  networking options during kernel
compilation and 
also upgrade iptables from iptables-1.2 to
iptables-1.3.0-2 but still 
face same problem.
  
   Any suggestion is appreciated.
 
 Thanks in advance.
 
 Regards,
 John

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

