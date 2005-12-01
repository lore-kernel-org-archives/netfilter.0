From: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Subject: Re: dumb question...route from local eth1 to eth2 and vice versa
Date: Thu, 01 Dec 2005 11:22:09 +0800
Message-ID: <438E6C61.3030305@inxsoft.net>
References: <20051201024311.18382.qmail@web54602.mail.yahoo.com>
	<08c101c5f625$3318e6e0$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <08c101c5f625$3318e6e0$5e00800a@printserver>
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
To: Jesse Gordon <jesseg@nikola.com>
Cc: netfilter@lists.netfilter.org

Jesse,

I think his problems has nothing to do with iptables but routing in general.

Joel,

I guess you want to ask your question (which is very basic) to a network 
related linux beginners groups (there are thousands of those), but you might 
find the one that is related to your linux distribution.

Or one of the linux network related usenet groups that you can simply browse 
at http://groups.google.com/

Best Regards,
Thomas



Jesse Gordon wrote:
> ----- Original Message ----- From: "Joel F" <roadapathy@yahoo.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, November 30, 2005 6:43 PM
> Subject: dumb question...route from local eth1 to eth2 and vice versa
> 
> 
>> eth0 - my WAN ip.
>>
>> eth1 - 192.168.0.0  My kids network
>> eth2 - 192.168.1.0  My personal network
>>
>> How can I route packets to and from my network of
>> 192.168.1.x (eth2)
>> to my kids network 192.168.0.x (eth1) so that we can
>> all play
>> network games???
> 
> 
> You may get away with simply enabling forwarding between eth1 and eth2, 
> something like this might allow both the *.1.x and the *.0.x networks to 
> communicate with eachother:
> iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT  #Data going one way is 
> allowed
> iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT #And data going other way 
> is allowed.

...

