From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Re: Total dropped packet count
Date: Mon, 20 Feb 2006 13:22:45 -0800
Message-ID: <BAY106-F34BF54BE2B93700D4423E8D6FF0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>i think you'd like to have a look in the section "match extensions" of
>the iptables man page. the first of them is "account" that you could
>use for your joy.
>angico.

angico,

The "account" extension you suggested looks very promising. I will give it a 
try.

Thanks!

- Andrew Kraslavsky


>>Hello,
>>
>>Is there a way to get from iptables/netfilter the total number of
>>dropped packets?
>>
>>The way we do this at the moment is with a script that:
>>
>>1) Lists all the rules
>>2) Finds within that list all rules whose target is DROP
>>3) Adds up the packet count for each of those rules
>>
>>This seems to work okay but it is cumbersome.
>>
>>I'm hoping there's some nice little /proc counter or iptables command
>>that will give me the total count of dropped packets.
>>
>>Thanks,
>>
>>Andrew Kraslavsky

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


