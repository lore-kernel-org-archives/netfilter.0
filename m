From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: Re: Log with log amount
Date: Thu, 28 Oct 2004 11:59:23 +0000 (UTC)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.NEB.4.61.0410281155230.20388@xm.freeshell.org>
References: <02b201c4bcd8$b5dd17e0$3a00200a@ThaiAn>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02b201c4bcd8$b5dd17e0$3a00200a@ThaiAn>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: thaian <thaian@6wind.com>
Cc: netfilter@lists.netfilter.org

On Thu, 28 Oct 2004, thaian wrote:

> Hi All
>
> In FreeBSD, ipfw uitiliy can log with amount of packet: ipfw add 1200 
> deny log tcp from any to any log-amount 100
>
> But with netfilter, I do not see any option for setting amount of packet 
> I want to log iptables -A INPUT -j LOG ...................????

Umm, is

iptables -A INPUT -m limit --limit 100/day -j LOG

what you want? Or are you trying to limit to 100 packets ever?

 			Alexey

