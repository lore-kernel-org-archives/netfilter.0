From: "Ian Hunter" <ihunter@hunterweb.net>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 08:26:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009801c3c0b3$8d45d9b0$b2c2a70a@melita.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <1071234823.2020.8.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

I'll log all web traffic in detail and see about the timings... thanks!

> My "guess" is, you are receiving a SYN packet from 204.157.6.223. This
> creates a state table entry with with a 60 second timer. Your system is
> taking longer than 60 seconds to respond, so iptables is removing the
> state table entry. Your system then responds causing the log entry shown
> above.


