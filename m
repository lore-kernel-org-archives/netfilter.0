From: Martijn Lievaart <m@rtij.nl>
Subject: Re: can't ssh outside with OUTPUT (policy ACCEPT)
Date: Thu, 09 Aug 2007 07:16:17 +0200
Message-ID: <46BAA321.1040503@rtij.nl>
References: <b400c69a0708080942j69063e1em16ef7224f78f6fea@mail.gmail.com>	
	<46BA013D.6020709@rtij.nl>	
	<b400c69a0708081235t3ff42d69yb28f60cb79231032@mail.gmail.com>	
	<46BA39CD.1010802@rtij.nl>
	<b400c69a0708081546r394f0123x108cec305d3dda55@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b400c69a0708081546r394f0123x108cec305d3dda55@mail.gmail.com>
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
>   
>> Add LOG rules for dropped traffic.
>>     
>
> I would appreciate an example for this tip.
>   

At the end of any of the {INPUT,OUTPUT,FORWARD} chains where policy is 
DROP, add the rule

-j LOG --log-prefix "(default): "
-j DROP

(that last one is optional, it duplicates the policy. But it is 
considered good style, plus you have counters on this rule, another 
debugging aid).

Another good way to debug such things is to add specific log rules at 
the top of all chains:

-A INPUT -s aaa.bbb.216.35 -j LOG --log-prefix "debug INPUT: "
-A INPUT -d aaa.bbb.216.35 -j LOG --log-prefix "debug INPUT: "

>   
>> Get out wireshark (formerly ethereal)
>>     
>
> Got it, tcpdump -w /tmp/iptables_lock.cap, it seems that iptables hook
> drops the packet before libpcap has a chance on seeing it.
>   

No, tcpdump/wireshark/ethereal sees the packets before netfilter on 
input and after netfilter on output. I think you did something else 
wrong here.

I personally never run a gui on my firewalls, but do have the X 
libraries installed. That way I can ssh -X into the box and run 
wireshark on it.

>   
>> to see what goes on at the line. Read up on how to construct good
>> rulesets
>>     
>
> Would very much appreciate good links here.
>   

I don't know any, but the documentation section of www.netfilter.org is 
a good start. I still want to write a document/site on writing good 
iptables rules, but don't have the time. Maybe I should make the time.

Anyway Rusty Russels unreliable packet filtering guide is a good read 
for the basics, especially on the -m state.

 >> and maybe even on IP (no sorry, I don't have any links).

>
> rfc791, that's for IP. Please correct me if I'm wrong but you meant
> read on TCP because IP is stateless and has no verification what so
> ever buildin, the only tracking IP does is for fragmentation and
> reconstruction of packets. I don't think this was the case here and
> further more I don't see how --state ESTABLISHED,RELATED could have
> any effect on it. Again, please correct me if I'm wrong.
>   

No, you're quite right.

HTH,
M4


