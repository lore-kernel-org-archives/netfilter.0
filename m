From: Florin Andrei <florin@andrei.myip.org>
Subject: protocol helpers deemed "safe"
Date: Mon, 28 Mar 2005 12:35:49 -0800
Message-ID: <1112042149.19132.15.camel@stantz.corp.sgi.com>
Reply-To: netfilter@lists.netfilter.org
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

So far, i've been only using the FTP and IRC protocol helpers
(ip_nat_irc, ip_nat_ftp) with iptables. The results were very good.

Now i want to build a more complex firewall and perhaps use other
protocol helpers. I know that commercial firewalls offer protocol
helpers for things like H.323, SIP, various SQL flavors, PPTP, IPSec,
RPC, RSH, etc.

Of the current set of protocol helpers available on a recent 2.6 kernel,
which ones are deemed "safe" for using in production, on a system that
must run unattended for long periods of time?
"Safe" meaning not only "does not crash the system" but also "works as
expected".

Thanks,

-- 
Florin Andrei

http://florin.myip.org/


