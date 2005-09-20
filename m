From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: netfilter conntrack performance problems
Date: Tue, 20 Sep 2005 12:38:18 +0200
Message-ID: <200509201238.18248@nienna>
References: <20050919203442.GA4111@hsz.tmp.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050919203442.GA4111@hsz.tmp.hu>
Content-Disposition: inline
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
Cc: root@sth.sze.hu


  Hi,

On Monday 19 September 2005 22.34, Horvath Szabolcs wrote:
> from the munin graphics, I see the nic's interrupts generate the
> machine load. What can we tuning to provide better performance?

  As someone already recommended, try using network cards which have 
good drivers. e1000 is probably one of those cards. The keyword is NAPI 
(or some kind of driver-dependant interrupt mitigation). For example 
the sk98lin driver you're using for eth1 has some kind of interrupt 
mitigation, however it's not enabled by default - take a look at the 
driver documentation to find out how you could set it up to lower the 
interrupt rate the card is generating.

-- 
 Regards,
  Krisztian Kovacs

