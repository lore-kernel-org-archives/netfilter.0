From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 12:35:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040109173530.GC24304@cannon.eng.us.uu.net>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001d01c3d6cc$191fc210$1684188d@Kiste>
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
To: Thhoep <thhoep@gmx.de>
Cc: netfilter@lists.netfilter.org

On Fri, Jan 09, 2004 at 05:17:36PM +0100, Thhoep wrote:

> if using the inbuilt "ip rule add from .." directive of iproute for advanced
> routing everything is working fine. but if i try to use netfilter marks to
> do the exact same thing using "ip rule add fwmark ..." outgoing packets find
> their way through my routing stuff and out of the net, but incoming replies
> just get lost between PREROUTING and FORWARD, probably during the routing
> process, for just no reason and without any icmp error messages or
> something.

OK. You mean when doing MARK in mangle for ping a -> b, you see both
ping and pong on ppp4 but the pongs get dropped somewhere between
PREROUTING and FORWARD. When you remove the MARK from netfilter then
all works fine??

Instead of "iptables -L..." can you send the exact commands you enter
from scratch for both netfilter and iproute2 instructions? "iptables -L..."
wraps the lines and is hard to read for me and also doesn't show you all the
actions taken (or at least I have difficulty interpretting them).

Just make sure that you start from scratch and a clean setup.

Ramin

