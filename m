From: Othmar Pasteka <pasteka@kabsi.at>
Subject: Getting rid of the masses of ip_conntrack messages
Date: Sun, 1 Dec 2002 11:04:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021201100429.GB18712@davinci>
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

Hello,

I get quite many "ip_conntrack: max number of expected connections 1
of ftp reached for 1.2.3.4->4.3.2.1, reusing" messages. How can I
configure netfilter that he doesn'T show such messages at all?
I am not interested in it and actually don't need/care about
them.
So far i googled a bit but just found that someone else had that
as well, but didn't find an answer :(. Answers are greatly
appreciated.

iptables: 1.2.6a
kernel: 2.4.20

anything else what's needed?

TIA
Othmar

