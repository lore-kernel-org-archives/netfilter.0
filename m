From: Jason Opperisano <opie@817west.com>
Subject: Re: ip_conntrack_max vs ip_conntrack
Date: Thu, 30 Sep 2004 19:03:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096585425.22962.19.camel@wolfpack.ljm.dom>
References: <561dc32604092710524f3a8b5b@mail.gmail.com>
	<1096311443.1079.11.camel@nostromo.bgsecm.com>
	<561dc3260409301548488b387e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc3260409301548488b387e@mail.gmail.com>
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

On Thu, 2004-09-30 at 18:48, Jiann-Ming Su wrote:
> 
> There's some good info on what I was looking for at the end of this section:
> 
> http://www.iptables.org/documentation/HOWTO//packet-filtering-HOWTO-7.html#ss7.3
> 
> Does the limit option work on a per connection basis?  Or, does one
> attacker's syn flood cause everybody to be limited as well?

the limit match works per-rule.  however you define what matches the
rule is what will be limited.

-j

-- 
Jason Opperisano <opie@817west.com>


