From: Juergen Schmidt <abcdmail@freenet.de>
Subject: Re: sip helper doesn't match on calls to myself
Date: Fri, 11 Nov 2016 14:17:55 +0100
Message-ID: <ef946ca8-4edd-6194-3912-fb45887d1adb@freenet.de>
References: <a3cf2e4b-1345-1efc-b211-5fea64438baf@freenet.de>
 <a2fd4690-63c9-36a9-d5eb-8d00ae79b149@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a2fd4690-63c9-36a9-d5eb-8d00ae79b149@freenet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 11/10/2016 at 07:27 PM, Juergen Schmidt wrote:
> On 11/09/2016 at 05:01 PM, Juergen Schmidt wrote:
>> Hello!
>>
>> I've got the following problem: If I'm calling myself, the incoming call
>> isn't matched by the sip helper rules, but the rules w/o sip helper. I
>> would have expected, that both calls are matched by the sip helper rules.
>>
>>
>> In detail:
>>
>> Given is an asterisk server, one extension (C610 IP with 3 phones, which
>> can handle 2 lines at the same time) and a trunk to the provider.
>>
>> The extension calls the own number, which provides the following scenario:
>>
>> outgoing call: extension -> asterisk -> provider
>>
>>    and
>>
>> incoming call: provider -> asterisk -> extension
>>
>>
>> *Important*: the provider uses independent media servers. This means:
>> the signaling server and the media servers have different IP addresses.
>>
> 
> Addition:
> 
> The problem *only* happens if at the same time a third (outgoing) call
> is initiated (via ring group) - which is *not answered* but closed at
> the moment the call is accepted internally.
> 
> If the third (-> outgoing) call via ring group is omitted, things work
> as expected.
> 
> Calls in detail:
> 
> outgoing call:    extension -> asterisk -> provider
> incoming call:     provider -> asterisk -> extension
> outgoing call* via ring group: asterisk -> provider -> ext. destination
> 
> answer the incoming call
> outgoing call* is exited.

One more addition:

If the via ringgroup triggered call doesn't use the same provider
compared to the initial outgoing and incoming calls, there doesn't seem
to be any problem and the rules are working as expected:

outgoing call:    extension   -> asterisk -> provider-1
incoming call:    provider-1  -> asterisk -> extension
outgoing call* via ring group: asterisk -> provider-2 -> ...



I don't think that the match via

iptables -A internet-out -p udp -o ppp0 -s $IPLOCAL -d 217.0.0.0/13
--sport 30000:40000 -m conntrack --ctstate ESTABLISHED -j ACCEPT

(w/o sip helper definition) for the incoming call is a correct match
(even more an intended one) if there are two outgoing calls at the same
time using the *same* provider. From my point of view, there is
something broken. The conntrack definition as written above w/o helper
definition is not expected to match at all if

	/proc/sys/net/netfilter/nf_conntrack_helper

is set to 0.


BTW: the chain internet-out is a subchain of the OUTPUT chain.



Thanks,
Juergen.


> 
> 
> * triggered by incoming call

