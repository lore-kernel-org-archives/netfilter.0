From: "alok pathak" <alokpathak79@gmail.com>
Subject: iptables MAC problem
Date: Sat, 25 Nov 2006 13:40:55 +0530
Message-ID: <c31bf6690611250010i7b922bd2te31a7a1308c96450@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I am using CentOS3.8 (with kernel version 2.4.21-47.EL, iptables
version 1.2.8-12.3, on AMD sampron x68_64).  I want to restrict my
users based on their MAC, and used the command:

# iptables -A INPUT -m --mac-source 12:12:12:12:12:12 -j DROP

but i am getting error :
iptables v1.2.8: Couldn't load match
`--mac-source':/lib64/iptables/libipt_--mac-source.so: cannot open
shared object file: No such file or directory

I also installed latest iptables version from the site (
iptables-1.3.6.tar.bz2) but still getting the same error.

please help me.

thanks,
Alok Pathak

