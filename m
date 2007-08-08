From: Martijn Lievaart <m@rtij.nl>
Subject: Re: can't ssh outside with OUTPUT (policy ACCEPT)
Date: Wed, 08 Aug 2007 23:46:53 +0200
Message-ID: <46BA39CD.1010802@rtij.nl>
References: <b400c69a0708080942j69063e1em16ef7224f78f6fea@mail.gmail.com>	
	<46BA013D.6020709@rtij.nl>
	<b400c69a0708081235t3ff42d69yb28f60cb79231032@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b400c69a0708081235t3ff42d69yb28f60cb79231032@mail.gmail.com>
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
To: Maxim Veksler <hq4ever@gmail.com>
Cc: netfilter@lists.netfilter.org

Maxim Veksler wrote:
> On 8/8/07, Martijn Lievaart <m@rtij.nl> wrote:
>   
>> Maxim Veksler wrote:
>>     
>>> Hello,
>>>
>>> Follwing a recent theread on this list, I've configued my firewall to
>>> allow incoming traffic from specific IP's only. Now I can't ssh
>>> outside, could some please explain why this happening ?
>>>
>>> The system is redhat 4.
>>>
>>>       
>> You don't allow the return packets in. Add a -m state --state
>> ESTABLISHED,RELATED match as the first rule in your INPUT chain.
>>
>>     
>
> That was it, thank you very much.
> How could I've debug it myself ?
>   

Good question!

Add LOG rules for dropped traffic. Get out wireshark (formerly ethereal) 
to see what goes on at the line. Read up on how to construct good 
rulesets and maybe even on IP (no sorry, I don't have any links).

HTH,
M4


