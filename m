From: Andrew Schulman <andrex@alumni.utexas.net>
Subject: Re: ipt_state
Date: Fri, 24 Sep 2004 16:02:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <MPG.1bbe47627bfeb5709896a1@localhost>
References: <e73cec800409241231211e671c@mail.gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> i have decided to remove ipcontrack
> i have to remove the mods used by it first.
> however this one i cannot remove and i need too.
> rmmod ipt_state
> ERROR: Module ipt_state is in use
> 
> how can i remove ipt_state

Remove all iptables rules that use -m state.

-- 
To reply by email, change "deadspam.com" to "alumni.utexas.net"


