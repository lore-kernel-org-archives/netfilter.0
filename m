From: Michael Milvich <mm@gmx.de>
Subject: Time Patch and Kernel 2.6.10
Date: Fri, 14 Jan 2005 15:02:51 +0100
Message-ID: <41E7D10B.1080004@gmx.de>
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

Hallo,

I want to update my firewall from kernel 2.4 to 2.6.
When testing the new system the time patch doesn't work correctly. I 
have the following problems:

The option --timestart doesn't work. I can set any time for the hour 
highter  then zero and iptables will block them. The timestop option 
works correctly.

#This works
iptables -A INPUT -m time --timestart 00:00/ --timestop 10:00 --days 
Thu,Fri -j DROP
#but if I set the timestart to/
iptables -A INPUT -m time --timestart 01:00/ --timestop 10:00 --days 
Thu,Fri -j DROP
#everything will be blocked
/
The other Problem is the option days: if I set only one day it doesn' t 
work.

#This will block all
iptables -A INPUT -m time --timestart 00:00/ --timestop 10:00 --days Fri 
-j DROP/

#This will work
iptables -A INPUT -m time --timestart 00:00/ --timestop 10:00 --days 
Thu,Fri -j DROP/

Now my question is if the time patch could not work with kernel 2.6 or 
if I am doing something wrong.

Thanks for help

Michael


