From: Les Mikesell <les@futuresource.com>
Subject: Re: masquerading won't flush conntrack cache
Date: Thu, 14 Oct 2004 09:50:47 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097765447.7688.9.camel@moola.futuresource.com>
References: <661ba8be04101406175160a81f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <661ba8be04101406175160a81f@mail.gmail.com>
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
To: Michael Hecker <jlpnetworx@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-10-14 at 08:17, Michael Hecker wrote:

> However, when my line gets disconnected and reconnects again, the
> entries in the cache are not flushed as expected. Now, the
> masquerading of outbound traffic is done improperly. The outgoing
> packets use the OLD IP-address, which was valid before the
> disconnection of the dialup line and not the new one.

I see exactly the same effect with GRE packets that make it out
the default masq'd interface before the correct route for them
is established.  When the correct route comes up, the packets go
there but continue to be source-NATed with the address of the
incorrect masq-ing interface. It appears to be impossible to ever
change a route after an ip_conntrack entry has been established, at
least when NAT is involved.  Is there a better source for information
about the ip_conntrack module than this list?

---
  Les Mikesell
   les@futuresource.com



