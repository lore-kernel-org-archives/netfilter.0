From: Robert Vazan <robertvazan@host.sk>
Subject: How does squid know original destination?
Date: Sat, 1 Feb 2003 17:00:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030201160032.GA1032@pc77969vm1.soluziona.sk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

If I forward intranet -> internet connections to a proxy program, how do
I discover from within my proxy what was original internet destination?
My manpage for getsockopt says that NAT options aren't documented yet,
so I guess getsockopt is used for this? If so, where can I find some
documentation? Programming is one side, but how does this look on
network? Does it work only locally or is there some TCP option attached 
to SYN packet? Is the information transmitted by other means, like
separate connection for accounting data? I know that squid does it, but
I don't know how. I couldn't find a single resource for programmers on
netfiler website, maybe it is impossible and I just overestimated squid?

