From: Nick <nlai@yahoo.com>
Subject: iptables for port forwarding
Date: Mon, 29 Nov 2004 16:51:54 -0800 (PST)
Message-ID: <20041130005154.6978.qmail@web11204.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I want to do something relatively simple, but have not been able to
figure out from the manual or playing with it how to achieve what I
want.

I have a server which I can only connect to via port 80, due to a
firewall.  I want to connect to VNC on the server, and connect to it
via a VNC client my laptop.  VNC server only wants to run on port 5900.
 I'm not running an HTTP server on 80, so no prob there.  I want to
forward packets  coming into the server on port 80 to the VNC on 5900.

I tried doing this:
/sbin/iptables -A FORWARD -p tcp --dport 80 -j ACCEPT 
/sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0 -j DNAT
--to 127.0.0.1:5900 

But the VNC client hangs for a while before timing out when I try to
connect to it.

Ideas on how to achieve the desired result?

Thanks,

Nick


	
		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - You care about security. So do we. 
http://promotions.yahoo.com/new_mail

