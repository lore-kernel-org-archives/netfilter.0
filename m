From: Les Mikesell <les@futuresource.com>
Subject: Re: masquerading won't flush conntrack cache
Date: Thu, 14 Oct 2004 11:07:53 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097770072.7688.20.camel@moola.futuresource.com>
References: <661ba8be04101406175160a81f@mail.gmail.com>
	<1097765447.7688.9.camel@moola.futuresource.com>
	<661ba8be041014081326ebea75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <661ba8be041014081326ebea75@mail.gmail.com>
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
To: Michael <jlpnetworx@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-10-14 at 10:13, Michael wrote:
> My solution for the moment (which is not really a solution), is to
> flush all iptable rules and unload all netfilter modules in ip-up,
> when the interface goes up again with the new ip-address. However,
> this also flushes all other rules, which were not affected by the
> external interface (e.g. from eth0 to eth1 or so) and therefore all
> state information is lost.

I can fix my particular situation with this approach because the
'correct' route is through a VPN tunnel that normally stays up
once it is established, but this seems like a fairly serious bug
in terms of general purpose routing since you should be able to
change routes on the fly and have the new route work without disrupting
other connections.

---
  Les Mikesell
    les@futuresource.com



