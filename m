From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: IMQ Replacement
Date: Mon, 26 Jan 2004 15:50:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40153757.2010108@dsl.pipex.com>
References: <1068652569.27810.450.camel@cumulus> <Pine.LNX.4.58.0311131244400.13900@fhynpb.envafyvqr.arg> <1074352525.4761.1389.camel@peterlaptop> <400BDCB6.2000208@pobox.com> <400D0B7F.90104@o2.pl> <400E9246.3020601@pobox.com> <40150537.4040501@pobox.com> <20040126144206.GA11104@zion.homelinux.com>
Reply-To: andy.furniss@dsl.pipex.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040126144206.GA11104@zion.homelinux.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Sven Schuster wrote:
> Hi Andre,
> 
> maybe interessting for you: Marcel Sebek recently started a thread
> on netdev about this topic. He has ported the IMQ device to 2.6
> and asked if this might be accepted. Davem contacted Patrick
> McHardy, the original author, who said that the IMQ device was
> buggy.
> This thread still continues, take a look at netdev ml archives for
> more information.

There is also discussion on the LARTC list at the moment - someone 
called roy has rewritten IMQ but still sees crashes. He thinks they are 
related to locally generated traffic, so IMQ for ingress should be OK.

Personally I have used IMQ for locally generated traffic (> a gig/day up 
with bittorrent running on a P200 gateway) without problems, but I only 
have 256kbit/s up and shutdown everything at night.

Andy.


> 
> HTH
> 
> Sven
> 
> On Mon, Jan 26, 2004 at 10:16:55AM -0200, Andre Correa told us:
> 
>>Hi guys, Andy F. pointed out that Alexander Clouter and other guys 
>>ported IMQ to 2.6. The URL to their port is:
>>
>>http://www.digriz.org.uk/jdg-qos-script/#qos-2.6
>>
>>I had no time or resources to test it so far...
>>
>>I've got no answer from the last IMQ maintainer so I'll start a list for 
>>us to discuss what we'll gonna do about it. I'll let you know later today.
>>
>>I'm sorry if this thread is disturbing somebody in this list. I'll just 
>>post 1 or 2 e-mails about it and we'll be out...
>>
>>Meanwhile, anybody interrested in joining us to work with IMQ please 
>>contact me privately.
>>
>>tks...
>>
>>Andre
> 
> 



