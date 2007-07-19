From: Konstantin Svist <kostya@relevad.com>
Subject: Re: need advice for high traffic network
Date: Thu, 19 Jul 2007 15:53:28 -0700
Message-ID: <469FEB68.2070905@relevad.com>
References: <469FE2DC.90300@relevad.com> <20070719224909.GA17077@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070719224909.GA17077@internet24.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@lists.netfilter.org

as I said, the current (and default) value is 65536
what would you suggest changing it to?

Thomas Jacob wrote:
>> I'l looking at nf-HiPAC right now - will probably try it some time soon. 
>> Beyond that, I'm out of ideas for the moment.
>>     
>
> nf-HiPAC won't help there if you just have 25 rules
> ( => http://people.netfilter.org/kadlec/nftest.pdf ), the problem is
> very likely down to you using the default parameters for the conntrack hash table,
> just like the other reply indicated.
>
>   

