From: Michael Leun <netfilter@newton.lahn.de>
Subject: Re: kernel 2.6 ipsec and DNAT
Date: Thu, 16 Sep 2004 07:25:27 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916072527.58f1ffb9@xenia.leun.net>
References: <1095068909.27900.953.camel@cluster>
	<HAEOIFPIBBBLGLHOMLLIMEFACMAA.bclark@eccotours.biz>
Reply-To: mlist-20040910@newton.leun.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLIMEFACMAA.bclark@eccotours.biz>
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
To: netfilter@lists.netfilter.org

Hello,

On Mon, 13 Sep 2004 12:29:56 +0200
"Brent Clark" <bclark@eccotours.biz> wrote:

> >Hi all,
> 
> >i have recently discovered on the list that more people is suffering
> >the nat problem with ipsec vpn tunnels on 2.6.x kernels, does anyone
> >know if its fixed on 2.6.8.1 ??
> 
> >The unique way i found to bypass the nat problem is using a proxy
> >server(squid), not the best solution but for now im able to surf the
> >web .-)

> But why would nat a vpn tunnel be a problem.
> Are there certain requirement for creating tunnel.
> Can the vpn server \ client be on the same box as the iptables
> gateway\router\firewall.

I've a notebook, running linux of course and I have an vpn tunnel. There
are sometimes some jobs which require windows, because there is no such
software for linux - then I run windows in vmware and need, of course
linux to forward the packets from vmware through the tunnel.

I would really appreciate to see this fixed soon.

-- 
Bye,

Michael Leun


