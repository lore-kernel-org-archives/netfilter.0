From: Nikolai Georgiev <voyager123bg@gmail.com>
Subject: Re: Re: iptables problem
Date: Wed, 02 Nov 2005 09:20:49 +0200
Message-ID: <436868D1.4080508@gmail.com>
References: <4367AEA5.7080501@pcraft.com>	<43a0cdcb0511011631k1bd1cfci@mail.gmail.com>
	<43681694.1040406@pcraft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43681694.1040406@pcraft.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: "Ashley M. Kirchner" <ashley@pcraft.com>

Ashley M. Kirchner wrote:

> Buddy wu wrote:
>
>> what's your problem or what do you mean?
>>  
>>
>    Problem is that while they can connect OUT, nothing from the
> outside can connect to them.
>
Hello there, i think this should do
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -A INPUT --dst $YOUR_IP -m state --state ESTABLISHED,RELATED -j
ACCEPT
iptables -A OUTPUT --src $YOUR_IP -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

