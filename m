From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: IMQ Replacement
Date: Tue, 27 Jan 2004 08:24:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40162033.4040701@dsl.pipex.com>
References: <1068652569.27810.450.camel@cumulus> <Pine.LNX.4.58.0311131244400.13900@fhynpb.envafyvqr.arg> <1074352525.4761.1389.camel@peterlaptop> <400BDCB6.2000208@pobox.com> <400D0B7F.90104@o2.pl> <400E9246.3020601@pobox.com> <40150537.4040501@pobox.com> <20040126144206.GA11104@zion.homelinux.com> <40153757.2010108@dsl.pipex.com> <4015AE11.1090607@dsl.pipex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4015AE11.1090607@dsl.pipex.com>
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

Andy Furniss wrote:
> Andy Furniss wrote:
> 
>> There is also discussion on the LARTC list at the moment - someone 
>> called roy has rewritten IMQ but still sees crashes. He thinks they 
>> are related to locally generated traffic, so IMQ for ingress should be 
>> OK.
> 
> 
> He just posted this, thought it may be of interest.
> 
> 
> Finaly I made imq driver stable it did not crashed for all 5 hours under
> high load, soo looks stable.
> (old one was crashing after 1-5 min for me)
> 
> no need to patch anything just compile and insmod, should work with any
> kernel probably must be > than 2.4.20
> 
> This is completely diferent code than old imq.
> you can find it on my server http://pupa.da.ru
> please tell how it works for you and how stable it is.

He has since posted that it crashes on locally generated traffic, 
apparently the kernel resends what gets dropped and at 100mbs this uses 
too many resources.

Andy.



