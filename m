From: Martijn Lievaart <m@rtij.nl>
Subject: Re: throttling an internal IP's upstream bandwidth
Date: Sun, 18 Feb 2007 14:46:21 +0100
Message-ID: <45D858AD.5060501@rtij.nl>
References: <Pine.LNX.4.64.0702091134220.18820@novak.ethosuk.org.uk>	<45D83C7C.6000501@rtij.nl>
	<Pine.LNX.4.64.0702181232550.32641@novak.ethosuk.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0702181232550.32641@novak.ethosuk.org.uk>
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
To: Scott van Looy <scott@ethosuk.org.uk>
Cc: netfilter@lists.netfilter.org

Scott van Looy wrote:
> Today Martijn Lievaart did spake thusly:
>
>> Scott van Looy wrote:
>>>
>>> I'm on DSL, I only have small upstream and big downstream. 
>>> Everything goes through a 1:1 NAT iptables firewall - so internal 
>>> IPs are directly mapped to an external IP. I want to throttle the 
>>> internal upstream bandwidth so the internal machines can't upload at 
>>> more than 25k/s as the maxing out of the upstream is killing the 
>>> much faster downstream...is there a way to do this using iptables?
>>>
>>
>> Google for wondershaper.
>
> I use wondershaper, it doesn't let me throttle on a per machine basis 
> tho - I want the firewall to only allow a max of 25k out for each of 
> my internal machines
>

Ah, then you have to do some work yourself. The answer is most probably 
tc, not netfilter. If you don't have a lot of internal machines, you can 
add a filter/qdisc for all of them but for large amounts of internal 
machines (or with dhcp), this gets unwieldy.

However, wondershaper should do what you ultimately want, shape traffic 
so uploads don't disturb downloads. It works for me.

M4


