From: =?UTF-8?B?0JvQvtC20LXRh9C90LjQuiDQkNC70LXQutGB0LDQvdC00YA=?=
	<A.Logechnik@itak.ua>
Subject: Re: Differentiating direct, and redirected access?
Date: Mon, 18 Oct 2004 17:34:40 +0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4173FEB0.9070605@itak.ua>
References: <D5C9032B2B09C64EA2409D6214E91AC9C05820@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9C05820@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


>>Hello all,
>>
>>I'm running a squid at port 3128 as a transparent proxy.
>>
>>There are requests coming directly to 3128 port and
>>those coming to 80 port and then redirected to 3128 by
>>following rule:
>>
>>-t nat -A PREROUTING -i eth0 -p tcp -m tcp \
>>   --dport 80 -j REDIRECT --to-ports 3128
>>
>>What I want is block direct requests to 3128, allowing
>>redirected access (transparent proxy) only. How do I do it?
>>
>>If I just set up a rule in filter chain like:
>>
>>-t filter -A INPUT -i eth0 -p tcp -m tcp \\
>>   --dport 3128 -j DROP
>>
>>Those requests redirected from port 80 to 3128 are also
>>blocked by this rule. It seems that the redirected packets
>>come in to this chain once again with the new port number.
>>
>>How can I differentiate these two different kinds of
>>request? Any clue will be greatly appreciated.
>>
>>Jinsuk Kim
>>    
>>
-t nat -A PREROUTING -i eth0 -d ! $INT_ROUTER_IP -p tcp --dport 80 -j 
REDIRECT --to-ports 3128
-A INPUT -i eth0 -d $INT_ROUTER_IP -p tcp --dport 3128 -J REJECT

TCP SYN have external ip dst_ip.

-- 
wbr, Logechnik Alexandr

In God we trust, but something 
else must have X.509 certificate


