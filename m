From: Andy Samuel <asorg@yahoo.com>
Subject: IP range
Date: Thu, 25 Sep 2003 06:02:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030925130213.58577.qmail@web9904.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear All

I follow the example of ip range feature to block my
incoming connection starting from IP 192.168.0.76 to
254, but allowing 192.168.0.1 to 75 to pass.
So I use :
iptables -A FORWARD -m iprange --src-range
192.168.0.76-192.168.0.254 -p TCP -j DROP.

It shows error that iptables can not find
libipt_iprange.
I've check /lib/iptables and no any file about
iprange.
But I know my kernel already compiled with iprange
enabled and ipt_iprange is already loaded as module (
I can see it from lsmod ).

How do I get libipt_iprange.so ?
What is the connection of the file with the kernel
module of ipt_iprange.so ?

Thank you so much

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

