From: Renee Darby <reneedarby@earthlink.net>
Subject: Is there a "sync" for iptables?
Date: Thu, 16 Dec 2004 10:11:44 -0700
Message-ID: <41C1C1D0.4090400@earthlink.net>
Reply-To: reneedarby@earthlink.net
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


How does the iptables interface work?   It looks like the user command 
sends a message in to the kernel which responds immediately,   the 
kernel appears to queue that command up and not actually commit the 
firewall until it can get a globla lock or somethnig.   Is this how it 
works?   Is there a sync or a way to nknow when the rule was comitted?

