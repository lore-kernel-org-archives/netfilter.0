From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Re: hi..
Date: Mon, 09 Dec 2002 18:23:59 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF49267.2050704@inbox.lv>
References: <3DF47485.6040709@inbox.lv> <1039433479.1713.24.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: raymondl@knowledgefactory.co.za
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Raymond Leach wrote:
> On Mon, 2002-12-09 at 12:46, Arindam Haldar wrote:
> 
>>hi all,
>>
>>just a thought....
>>i want to know if the -N  flag is avaiable for PREROUTING/POSTROUTING 
>>mangle/nat etc ?
>>i know the below is possible ...
>>iptables -N myTable
>>iptables -A INPUT -s <ip> -j myTable
>>
>>but if want to do this-->>
>>iptables -A POSTROUTING -t nat -s <> -j myTableTwo
>>or
>>iptables -A PRETROUTING -t mangle -s <> -j myTableTwo
>>is it possible ?.. how do i create a new table for this ?
> 
> 
> try this:
> iptables -t nat -N test
> iptables -A PREROUTING -t nat -s <> -j test
> 

THANX so MUCH .....:)... it works...:)



