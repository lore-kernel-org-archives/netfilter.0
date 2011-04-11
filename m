From: John Lister <john.lister@kickstone.com>
Subject: Re: Load Balancing issue
Date: Mon, 11 Apr 2011 16:37:57 +0100
Message-ID: <4DA32055.9030904@kickstone.com>
References: <4DA2CB4D.2070402@pierce.co.za> <4DA2F4A7.4030902@kickstone.com> <4DA2FB80.4050306@pierce.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DA2FB80.4050306@pierce.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Evan Pierce <evan@pierce.co.za>, Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/04/2011 14:00, Evan Pierce wrote:
> On 2011/04/11 2:31 PM, John Lister wrote:
>> Have you saved/restored the marks in the conntrack table? Otherwise they
>> will be lost for all subsequent packets.. eg:
>>
>> -j CONNMARK --save-mark
>>
>> John
>>
> John
>
> No I haven't do I need a rule like:
>
> iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
>
> or rather
>
> iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark
I do this:

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -somerules -j MARK --set-mark xx
iptables -t mangle -A PREROUTING -somerules -j CONNMARK --save-mark

Generally, i have separate tables that do the mark/saving so as to only put the rules in once.
I also have a route for the local net in my fwmark(ed) tables.


Hope that helps

John


