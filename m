From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: What is the diference between ipfw of *bsd and netfilter
	of	linux?
Date: Tue, 05 Oct 2004 15:21:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4162F428.3000903@SCampbell.net>
References: <1096920404.658.4.camel@pretorian>	<1096979251.668.2.camel@nostromo.bgsecm.com>	<20041005172315.GA22610@legolas.on.net.mk>
	<1097000655.4415.4.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1097000655.4415.4.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason Opperisano wrote:

>On Tue, 2004-10-05 at 13:23, Damjan wrote:
>  
>
>>However I agree with you that netfilter is easier to use and has more
>>capabilities, I still can't beleive that netfilter (iptables actually)
>>doesn't have a way to identify rules uniquely (via an ID). So simple
>>feaure, so powerfull, and still iptables doesn't have this.
>>
>>And no, linenumbers don't identify rules uniquely, they can change at
>>any moment.
>>    
>>
>
>check out the comment patch from POM.
>
>-j
>
>  
>
I feel obliged to add that wrongly configured proxy-arp devices can 
bring havoc onto a network.  I get a few cases a year where some network 
devices had proxy-arp left on (we typically disable it on most devices) 
and a routing error was made, the result in many devices is that the 
device will start answering for ip addresses it has no actually ability 
to communicate with thereby effectively knocking that device off the 
net.   Just a warning that it can be nasty.


