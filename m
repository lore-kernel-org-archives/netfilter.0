From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: ip_conntrack_max vs ip_conntrack
Date: Thu, 30 Sep 2004 18:48:16 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <561dc3260409301548488b387e@mail.gmail.com>
References: <561dc32604092710524f3a8b5b@mail.gmail.com>
	<1096311443.1079.11.camel@nostromo.bgsecm.com>
Reply-To: Jiann-Ming Su <sujiannming@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096311443.1079.11.camel@nostromo.bgsecm.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On 27 Sep 2004 20:57:24 +0200, Jose Maria Lopez <jkerouac@bgsec.com> wrote:
> 
> For the limit match look at:
> iptables -m limit --help
> 
> 

There's some good info on what I was looking for at the end of this section:

http://www.iptables.org/documentation/HOWTO//packet-filtering-HOWTO-7.html#ss7.3

Does the limit option work on a per connection basis?  Or, does one
attacker's syn flood cause everybody to be limited as well?
-- 
Jiann-Ming Su
"I have to decide between two equally frightening options.  
                                            If I wanted to do that,
I'd vote." --Duckman

