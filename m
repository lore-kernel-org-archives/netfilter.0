From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: MAC Block for the DHCP via iptables
Date: Mon, 17 Nov 2003 13:17:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB910A6.9040207@Loudoun-Fairfax.com>
References: <008801c3ad28$da9e4b50$0d1ea8c0@win2000adv> <200311171702.hAHH2pj22305@agate.rockstone.co.uk> <3FB90889.9040804@Loudoun-Fairfax.com> <200311171757.hAHHvTj22359@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311171757.hAHHvTj22359@agate.rockstone.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

Antony Stone wrote:

>On Monday 17 November 2003 5:42 pm, Jeffrey Laramie wrote:
>
>  
>
>>Antony Stone wrote:
>>    
>>
>>>iptables -P INPUT DROP
>>>iptables -P FORWARD DROP
>>>iptables -P OUTPUT DROP
>>>
>>>iptables -F INPUT
>>>iptables -F FORWARD
>>>iptables -F OUTPUT
>>>
>>>then no IP traffic will be allowed into, out of, or through, the machine.
>>>      
>>>
>>Chandana, Antony is making a theoretical point here. Your loopback
>>interface uses the OUTPUT chain and dropping every OUTPUT packet could
>>cause some unexpected problems. I wouldn't recommend doing this. If you
>>ever really wanted to block *all* traffic just unplug the network card(s).
>>    
>>
>
>Very well said, Jeffrey :)
>
>Netfilter rules should never be implemented without understanding what they 
>do, and "blocking all traffic" is an unlikely condition for a working 
>machine.   Apart from anything else, what use is a machine that can't talk or 
>listen :) ?
>  
>

On this side of the pond we call them "paper weights" :p

Jeff


