From: sven@hin.de
Subject: Re: Update Iptables in order to use String-Match
Date: Mon, 03 Apr 2006 00:36:10 +0200
Message-ID: <443051DA.5090700@hin.de>
References: <001b01c656a5$314bc680$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001b01c656a5$314bc680$0101000a@sterenborg.info>
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

Rob Sterenborg schrieb:
> The last part between the brackets, I suppose iptables wrote it ? (I
> think I got confused there.)
> If this is true, you have the string match from 1.3.3 installed (if you
> already had it, why build a new kernel/iptables ?) and are using
> iptables 1.3.5. (That means you have iptables-1.3.5 installed but didn't
> install string match 1.3.5 which would be true, reading below.)
When I used String-Match with Hex, I got a Sigfault.

 > I think that will solve your problem.
> (Remember to also recompile iptables..)
I will do...

