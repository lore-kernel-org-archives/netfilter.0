From: SBlaze <dagent.geo@yahoo.com>
Subject: Need help have some questions...
Date: Fri, 15 Aug 2003 02:29:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030815092958.19403.qmail@web40208.mail.yahoo.com>
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

I've been toying around with the idea of redirecting unwanted traffic to the
discard surface. I'm having trouble understanding some concepts though. Could
anyone please explain this in more detail or perhaps suggest a way to
accomplish this.

On the filter tables using IMPUT there is no way to change or alter the
destination of packets and cause them to be sent to another port?

Using the POSTROUTING chain in the nat table is impoosible to effectively
filter traffic via specific matches due to the fact that POSTROUTED packets are
sort of "lumped together" for lack of a better way to explain it?

If anyone can answer these I would MOST appreciate it as it is really causing
me alot of confusion.

Thanks
s-blaze

=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

