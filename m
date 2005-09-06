From: =?ISO-8859-1?Q?Javier_Miguel_Rodr=EDguez?=
	<javier.miguel@talika.eii.us.es>
Subject: Re: Question about high perfomance Linux firewall
Date: Tue, 06 Sep 2005 19:12:46 +0200
Message-ID: <431DCE0E.3050205@talika.eii.us.es>
References: <431C9027.3010104@talika.eii.us.es>
	<200509061537.05637.mbellion@hipac.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509061537.05637.mbellion@hipac.org>
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
To: netfilter@lists.netfilter.org
Cc: Michael Bellion <mbellion@hipac.org>

Michael Bellion wrote:

>Hi,
>
>  
>
>>I need to keep connection tracking, so nf-hipac is discarded. 
>>    
>>
>
>nf-hipac does support connection tracking.
>
>  
>

I have been reading their website ( I have NOT tested nf-hipac) and this 
paragraph made me think that does NOT support connection tracking:

"Despite its usefulness there are still situations where you want to 
avoid the overhead of connection tracking. Although only a constant 
amount of time is added to the processing time of each packet (at least 
in theory) you may need to prevent that in order to achieve maximum 
packet rates. Those kind of setups require a highly efficient stateless 
packet filter which is very robust against DoS or DDoS attacks. Again, 
nf-HiPAC fulfils this requirement to the full extent."


Thank you for your comment, I will try it ASAP


>regards
>	Michael Bellion
>  
>


