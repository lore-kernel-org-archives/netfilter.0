From: Jason Opperisano <opie@817west.com>
Subject: Re: Allow particular website/port
Date: Thu, 10 Feb 2005 15:10:10 -0500
Message-ID: <1108066210.4489.0.camel@hubcap.ljm.dom>
References: <1108064090.420bb75ac0009@mail.gnvfc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108064090.420bb75ac0009@mail.gnvfc.net>
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

On Thu, 2005-02-10 at 14:34, spdesai@gnvfc.net wrote:
> Hi
>  
> I have one linux machine with two NIC cards. One is connected to internet and 
> one is private PC. Below is my IP configuration
>  
> I have enable ip_forward to 1 in linux machine as well as donw masqared in 
> linux.
> 
> I can browse the internet as well from window machine.
> 
> Now I want to allow/restricted my window machine to access/deny particular 
> site/block/messanger ...
> 
> i have tried with FORWARD chain but..it restricted all HTTP traffic which i 
> dont want.
> 
> So pl.  give me the solution.

squid.

-j

--
"Mr. Simpson, why are you here?
 Don't say revenge! Don't say revenge!
 Revenge?
 That's it! I'm outta here!"
	--The Simpsons


