From: Kenneth Sande <sandekt@wow-ia.net>
Subject: Re: Squid Redirection
Date: Tue, 05 Jan 2010 18:24:27 -0500
Message-ID: <4B43CA2B.40309@wow-ia.net>
References: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>	 <4B4235A3.2010409@wow-ia.net> <8ec0428d1001051445j60c7a32q25d34e8b0db7560a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8ec0428d1001051445j60c7a32q25d34e8b0db7560a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Aaron Clausen wrote:
> On Mon, Jan 4, 2010 at 10:38, Kenneth Sande <sandekt@wow-ia.net> wrote:
>   
>> I do it this way for my one internal subnet. There may be more and better
>> options, but this works for me.
>>
>> "iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s ${INT_NETWORK} -p tcp
>> --dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED -j
>> REDIRECT --to-port 3128"
>>
>> Squid must also be set up to accept transparent connections.
>>     
>
> Thanks.  Now for another question.  I have about a dozen workstations
> that I want to bypass squid (they are in the same subnet as the
> workstations that I want traffic sent through squid).  Reading squid's
> documentation, they recommend that this be done at the client end or
> via iptables.  What's the rule to allow these hosts to bypass squid?
>
>   
What I do is have a special portion of my subnet set aside for 
"unfiltered" access, and I just put an ACCEPT chain in for that portion 
before the REDIRECT for the whole subnet.
So it looks similar to this:

"iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s 
${INT_NOSQUID-NETWORK} -p tcp
--dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED 
-j ACCEPT"

"iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s ${INT_NETWORK} -p tcp
--dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED -j
REDIRECT --to-port 3128"


In my case the INT-NOSQUID-NETWORK is 192.168.0.32/28, which gives me 16 
addresses that can bypass this--which I assign manually.
I believe that you can also set up squid so that it makes these 
computers bypass the cache. I think it's the "always_direct [allow|deny] 
'acl list'" directive. I haven't played with that too much, and not 
entirely sure if that is working right for my WSUS server.

(Sending reply to the list this time)
-Ken Sande/KC8QNI
