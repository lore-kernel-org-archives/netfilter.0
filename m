From: Ralph Churchill <mrchucho@yahoo.com>
Subject: simply confusing
Date: Thu, 23 Jan 2003 12:03:14 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030123200314.99399.qmail@web11401.mail.yahoo.com>
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

I work at a large company and was having some fellow
employees regularly scanning my box... so I put up a
little firewall. Here's my one and only rule:

iptables -A INPUT --source 192.168.0.0/16 -j DROP

Now, shouldn't that block any and ALL traffic from any
computer on the 192.168.*.* subnet? Do I need to be
more explicit? I also have snort running and I see
some stuff getting through... Thanks.

RMC

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

