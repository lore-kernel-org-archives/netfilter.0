From: Marcin Sura <slacklist@op.pl>
Subject: Re: iptables + MRTG
Date: Sat, 28 Aug 2004 17:23:55 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1910446864.20040828172355@op.pl>
References: <a0f69e5040828042815b5e61e@mail.gmail.com>
Reply-To: Marcin Sura <slacklist@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5040828042815b5e61e@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Witam

Saturday, August 28, 2004, 1:28:27 PM, you wrote:

> Anyone here using MRTG with iptables? for example to check iptables -L
> -nvx things graphical using mrtg... or any other statistics
> any possibility ?

With MRTG you can graph temperature even this how many times your dog
go outside, so also you can make charts of iptables output. Simply,
you must parse iptables -L -vnx output, and provide what you want to
graph to MRTG.

You can also try a rrdtool. This is a (imo better) successor of MRTG.

Try to google. There is a lot of examples for both - MRTG and rrdtool

-- 
Pozdrawiam
 Marcin                            mailto:slacklist@op.pl


