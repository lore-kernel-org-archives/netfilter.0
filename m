From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: How multiple PCs on private LAN possible if incoming is DNAT'd
 to *same* server *always*?
Date: Fri, 04 Feb 2005 15:41:12 +0200
Message-ID: <42037B78.8080605@hotpop.com>
References: <20050203172500.GB29677@spawar.navy.mil>	<20050203173506.GA4619@bender.817west.com>	<20050203225936.GA31268@spawar.navy.mil>	<1107472297.3866.12.camel@hubcap.ljm.dom>
	<20050204004651.GA31859@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050204004651.GA31859@spawar.navy.mil>
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
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org

seberino@spawar.navy.mil wrote:

>>>Doesn't EVERY incoming packet go through PREROUTING?? And hence,
>>>the rule above will be applied to ALL incoming packets right?!?
>>>      
>>>
>>your statement is true for -t mangle PREROUTING, -t nat is not traversed
>>by every packet, no.
>>    
>>
>
>Whoa! I didn't know that there is a PREROUTING for //both//
>mangle and nat tables!!!
>
>So mangle PREROUTING for all packets and net PREROUTING only for
>NEW state packets.  Beautiful!!! Now I get it!!!
>
>Thanks again for the help!
>
>Chris
>
>
>  
>
Take a look at this:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFTABLES


Georgi Alexandrov

