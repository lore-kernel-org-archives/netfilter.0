From: Scott Phelps <netfilter@decipher.com>
Subject: Re: iptables + ebtables + snat question
Date: Sun, 14 Aug 2005 00:58:03 -0400
Message-ID: <339AE622-01CB-4A20-81C2-C8A3A5A9CB2C@decipher.com>
References: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
	<200508131323.40526.rob0@gmx.co.uk>
Mime-Version: 1.0 (Apple Message framework v733)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508131323.40526.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org


On Aug 13, 2005, at 2:23 PM, /dev/rob0 wrote:

> On Friday 2005-August-12 17:41, Scott Phelps wrote:
>
>> I have the following setup:
>>
>>            LAN
>>             |
>>             |
>>            if0       ________
>> DMZ---if1     if2---|ROUTER|---INTERNET
>>           \   /      --------
>>            br0
>>
>
> FWIW I think the ASCII drawing made perfect sense. I suspect MUA or
> perhaps MTA/MDA issues on Jan's part.

Thanks, BTW, I did use a fixed-width font.

>> Or do I have to assign a IP to my br0 interface?
>>
>
> That would work. Or have the bridge machine SNAT to 10.0.0.1

Right, Is there any reason to prefer SNATing through br0 over if2?
(I am not trying to add a ton of unnecessary complexity using ARP  
trickery)

Thanks for the help, BTW guys!



