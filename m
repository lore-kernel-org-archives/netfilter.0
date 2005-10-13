From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: DNAT problems using a single interface
Date: Thu, 13 Oct 2005 23:46:59 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510132345590.22615@filer.marasystems.com>
References: <434D8802.40702@satchell.net>
	<3063e50510121719n3199ee10q628397955772f136@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e50510121719n3199ee10q628397955772f136@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: George Alexandru Dragoi <waruiinu@gmail.com>
Cc: Stephen Satchell <list@satchell.net>, netfilter@lists.netfilter.org

On Thu, 13 Oct 2005, George Alexandru Dragoi wrote:

> application level (if you need them), even it can be tracked very well in
> FORWARD chains. Else ... who knows, maybe you can do tricks with iproute2
> and MARK target from iptables, and instead of nat-ing, you will do some ugly
> routing. I can't tell exactly how to do this because i didn't read and
> understand all aspects of your situation.

That might work as well, at least as long as there is no MTU issues or 
fragmented packets...

Regards
Henrik

