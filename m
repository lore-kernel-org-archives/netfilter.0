From: nikhil hegde <ndhegde@yahoo.com>
Subject: scp and sftp: large files not being transfered
Date: Wed, 22 Sep 2004 11:04:49 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040922180449.65926.qmail@web53101.mail.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi All,
I've mentioned this prblem earlier. It is about large
file transfer not taking place in fedora core 2 kernel
2.6.5-1.358. When I am getting packets into userspace
and doing some processing.

http://lists.netfilter.org/pipermail/netfilter/2004-September/056036.html

I was doing "ip route change 10.6/16 mtu 1000 dev
wlan0"

If I lock the mtu value then it just works fine. Does
it mean that this kernel is not considering my request
to set the mtu to 1000?because..I read that..

"If the modifier lock is not used, the MTU may be
updated by the kernel due to Path MTU Discovery. If
the modifier lock is used, no path MTU discovery will
be tried, all packets will be sent without the DF bit
in IPv4 case or fragmented to MTU for IPv6"

If this is so what is the role of
"/proc/sys/net/ipv4/ip_no_pmtu_disc " , which still
shows the value 0. Also given the fact that transfer
happens on 2.4.18-3 kernel with same pmtu setting. 

Could anyone pleasse explain me the fundaes behind
this?

thanks
Nikhil





	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

