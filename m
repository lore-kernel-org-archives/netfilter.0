From: William Fitzgerald <wfitzgerald@tssg.org>
Subject: Re: Query: Stateful parameters Explicitly and Implicitly defined,
 which is it?
Date: Wed, 21 Oct 2009 09:46:02 +0100
Message-ID: <4ADECA4A.5000907@tssg.org>
References: <4ADE2689.4070707@tssg.org> <4ADEBF52.7050602@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADEBF52.7050602@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Mart,


Mart Frauenlob wrote:
> netfilter-owner@vger.kernel.org wrote:
>> Dear experts,
>>
>> If a rule has a state of NEW does it implicitly imply ESTABLISHED also?
>>
>> Looking at examples on the web I see references to both.
>>
>> For example to permit access to an internal Web server, which of the 
>> straw-man rules are correct?
>>
>> Implicit Established Example:
>> iptables -a FORWARD -i eth0 --dport 80 -m state --state NEW -j ACCEPT
>>
>> Explicit Established Example:
>> iptables -a FORWARD -i eth0 --dport 80 -m state --state 
>> NEW,ESTABLISHED -j ACCEPT
>
> both are, but both miss: '-p tcp'; and its '-A' not '-a'.
Your right a typo and a little too much of a straw-man rule here ;-)
> It depends what your other rules in the ruleset do.
> if you have some like:
> iptables -A FORWARD -m state --ESTABLISHED -j ACCEPT
> the first of the 2 rules above will work out, though the second will 
> also work, just has this redundant state descriptor (which does not 
> matter all).
>
> To allow http traffic, without other rules:
yep, just for the example to fully understand the semantics.
> iptables -A FORWARD -i eth0 -m tcp --dport 80 -m state --state 
> NEW,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -o eth0 -m tcp --sport 80 -m state --state 
> ESTABLISHED -j ACCEPT
>
As I suspected, one must explicitly defined both NEW and ESTABLISHED in 
the inbound rule. Of course, it can be separated into 2 rules. But the 
important point is that both are required.

Just specifying NEW is not good enough.

I got a little mixed up looking at various examples on the web, some of 
which are probably snippets of a full configuration that probably also 
included a rule as John Lister stated previously:
iptables -A FORWARD -m state --state RELATED, ESTABLISHED -j ACCEPT

I guess what also got me  thinking was,  the  Netfilter connection 
track. I was thinking perhaps if a certain kind of traffic was permitted 
to request a new connection with the NEW state then the connect track 
engine does some magic to implicitly imply it must also be allowed to 
continue a connection with the ESTABLISED. However, as i can see from 
your example, one must explicitly define the "states" within the rules. 
Thus, NEW to the conection track engine means only NEW and does not also 
imply ESTABLISHED behind the scenes.


>>
>> Similarly, I see reference to setting TCP flags as a control measure. 
>> Particularly for port scanning etc. However sticking with the  Web 
>> server example, an internal Web Server should expect a client to 
>> initiate a connection (SYN flag) but the server itself should not do 
>> this.
>>
>> example strawman-rules of the stateless kind:
>> iptables -a FORWARD -i eth0 --dport 80 --tcp-flags SYN -j ACCEPT
>>
>> iptables -a FORWARD -o eth1 --sport 80 --tcp-flags ACK -j ACCEPT
>>
>> The thing is, what happens after the 3-way handshake? Incoming http 
>> requests will no longer have a SYN flag set! So is there some 
>> implicit knowledge that netfilter or other packet filters operate over?
>>
> Same as before, you need other rules to handle that. 
Ok.
> Usually I normalize TCP traffic, even before it hits the rules for the 
> servers, but if i wouldn't do it globally, I'd rather write the rule 
> like this:
> iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -m state 
> --state NEW -j ACCEPT
>
I see your using stateful operators also in the above rule. Why would 
there be a need to use the stateless SYN flag operator given the NEW 
operaror implicitly handles this?


I have some interesting questions about flags, so what I will do is 
start a thread for them as the discussion about them may get lost with 
the heading of this particular thread.

Thanks so much for the comments,
Will.
>> regards,
>> Will.
>>
> hope it helps
>
> regards
>
> Mart
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

