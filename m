From: Sudheer Divakaran <sudheer@svw.com>
Subject: Re: 'recent' module HOWTO
Date: Thu, 12 Aug 2004 09:17:18 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411AE846.2060708@svw.com>
References: <4119B0DA.6030903@svw.com> <2197.216.239.93.106.1092241302.squirrel@216.239.93.106>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2197.216.239.93.106.1092241302.squirrel@216.239.93.106>
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
To: netfilter@lists.netfilter.org

Hi,
    The problem has been solved.  When I set the rules like this, it 
worked as expected (i.e., it accepted an icmp echo request, then 
rejected icmp echo requests for 10 seconds, ...). Earlier it were 
rejecting ALL icmp-echo requests. My question is  this the correct usage 
of this module?

iptables -A INPUT -m recent -p icmp --icmp-type echo-request --update

iptables -A INPUT -m recent -p icmp --icmp-type echo-request --rcheck 
--seconds 10 -j REJECT

iptables -A INPUT -m recent -p icmp --icmp-type echo-request --set

Thanks everybody,
Sudheer.



Samuel Jean wrote:

>On Wed, August 11, 2004 1:38 am, Sudheer Divakaran said:
>
>>Hi,
>>    Where can I find detailed documentation of 'recent' module?.
>>
>>
>
>http://snowman.net/projects/ipt_recent/
>
>
>>To test the recent module, I've given the following commands and pinged
>>to my machine from another one.  But I got the reply 'Destination port
>>Unreachable'.  What is wrong in it?
>>
>
>There's nothing wrong with that.  You did specify to REJECT packets, which
>means that you can send back an ICMP error of your choice.
>
>I guess 'Destination port Unreachable' is the default one.
>
>
>>iptables -F
>>
>>iptables -P INPUT ACCEPT
>>
>>iptables -P OUTPUT ACCEPT
>>
>>iptables -A INPUT -m recent -p icmp --icmp-type echo-request --update
>>--seconds 10 -j REJECT
>>
>>iptables -A INPUT -m recent -p icmp --icmp-type echo-request --set -j
>>ACCEPT
>>
>>
>
>However, you should be able to get a single ping reply before being
>rejected. Is that what happen ?
>
>
>
>>Kind Regards,
>>Sudheer
>>
>>
>
>Hope this helps.
>
>Samuel Jean
>CookingLinux.org
>
>
>


