From: Oran G <jihad@redwhitearmy.com>
Subject: Re: port forwaring from localhost to inet
Date: Mon, 06 Jun 2005 13:25:09 +0200
Message-ID: <42A43295.6050609@redwhitearmy.com>
References: <42A1DDEB.9040207@redwhitearmy.com> <42A40FC9.4040804@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A40FC9.4040804@mnemon.de>
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

>
>
>Oran G schrieb:
>  
>
>>hello,
>>
>>I want to forward local requests to a mashine on the network.
>>    
>>
>
>This is done in nat table with OUTPUT chain. This chain is for natting
>locally generated packages. If you don't have this chain, you have to
>recompile the kernel with appropriate settings.
>
>Have a nice time
>
>Joerg
>  
>

that was it, thanx!

iptables -t nat -A OUTPUT -o lo -p tcp --dport 8111 -j DNAT --to-destination 192.168.0.11:80

this leadts me to my second question, maybe little offtopic:

i can realize the same functionality with an ssh tunnel. since encryption is a nice extra but not neccesary i wonder about how it would affect the performance of the communikation line. 

both of my mashines have 2-3 GigH CPUs, and as i described befor, one runs apache the another mysql, both under heavy use.

oran G


