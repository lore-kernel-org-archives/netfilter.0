From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Preventing DoS attacks using iptables?
Date: Sat, 12 Aug 2006 10:07:39 -0700 (PDT)
Message-ID: <20060812170739.39960.qmail@web56203.mail.re3.yahoo.com>
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

Hi all, 

I have just one question related to preventing DoS
attack using iptables. I know there is possible limit
of receiving packets causef by DoS attacks using --m
limit --limit 1/s and on that way pushing firewall to
accept just on packet per second. But in some cases
the kernel will accept that packets and we can reject
theu putting 1 in /proc/sys/net/ipv4# cat
tcp_syncookies....According to
 
http://cr.yp.to/syncookies.html

where they say that this method is stil experimenting
I am asking you what is your experineces related to
oreventing DoS attacks this way.

Thanks 

Regards 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

