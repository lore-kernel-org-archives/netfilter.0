From: Ruslan Spivak <alienoid@is.lg.ua>
Subject: Re: REDIRECT question
Date: Wed, 02 Jul 2003 16:13:09 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F02DA65.60904@is.lg.ua>
References: <Pine.LNX.4.44.0307021216100.16552-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0307021216100.16552-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

Chris Wilson wrote:

>Hi Ruslan,
>
>  
>
>>I just want to be sure that after redirecting, the packet is going to 
>>input chain where i can filter it. (am i right?)
>>    
>>
>
>As far as I know, that's right.
>
>Cheers, Chris.
>  
>
One more question, please.

I have three nets that located in our city and i treat them as local, 
cause we have direct connection with that networks.
i need to redirect traffic that is going to outside world to port 
3128(squid) and traffic to local nets leave alone.
Following your previous advices, i have made suggestions about how it 
should look:

LOCAL_NET_1=193.108.240.0/22
LOCAL_NET_2=193.220.70.32/27
LOCAL_NET_3=193.220.70.64/27

iptables -t nat -N REDIRECT_CHAIN
iptables -t nat -A REDIRECT_CHAIN -p tcp -d  $LOCAL_NET_1 --dport 80 -j 
RETURN
iptables -t nat -A REDIRECT_CHAIN -p tcp -d  $LOCAL_NET_2 --dport 80 -j 
RETURN
iptables -t nat -A REDIRECT_CHAIN -p tcp -d  $LOCAL_NET_3 --dport 80 -j 
RETURN
iptables -t nat -A REDIRECT_CHAIN -p tcp --dport 80 -j REDIRECT 
--to-port 3128
iptables -t nat -A PREROUTING -j REDIRECT_CHAIN

Can you tell me if i'm on on a right way?

Again, thanks in advance.

Best regards,
Ruslan





