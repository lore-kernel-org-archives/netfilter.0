From: "Matthew Simpson" <matthew@txlink.net>
Subject: Re: netfilter digest, Vol 1 #1410 - 14 msgs
Date: Tue, 23 Dec 2003 10:28:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009d01c3c971$c142be10$0100a8c0@KARI>
References: <20031223161403.3308.78203.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: antony@soft-solutions.co.uk

Message: 11
From: Antony Stone <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Subject: Re: using iptables to route between public networks
Date: Tue, 23 Dec 2003 15:42:48 +0000

On Tuesday 23 December 2003 3:32 pm, Matthew Simpson wrote:

>> I must have been doing something stupid last night, because I retried it
>> this morning and it works.  Here is what I have for the forward chain:
>>
>> $IPTABLES -A FORWARD -d 209.210.10.1/28 -j ACCEPT
>> $IPTABLES -A FORWARD -d ! 209.210.10.1/28 -j DROP
>> $IPTABLES -P FORWARD ACCEPT
>> $IPTABLES -F FORWARD
>>
>> This works.

>When you say "this works", is assume that's only for minimal values of
>"working" :)
>
>I can't believe that a router which will drop all packets except those
>addressed to 209.210.10.0/28 (note that your address designation is
slightly
>incorrect above) will do an effective job.

Putting 209.210.10.0/28 is what 'broke' things last night.  If I change my
script to that, then it doesn't add that rule to the FORWARD chain.  It
doesn't output any error, but it doesn't add the rule, either.

>
>You may want to route inbound packets only to these IP addresses, but what
>about the replies?   They are going to be going to other destination
>addresses, and need routing too.....

Correct me if I'm wrong, but doesn't the -destination flag only drop
incoming FORWARD packets that do not have a DESTINATION of 209.210.10.1/28 ?
Therefore any packets coming from the 209.210.10.1/28 subnet will be able to
go out unimpeded because I have the default policy to ACCEPT the FORWARD
packets.  I'm only dropping packets that are coming in the FORWARD chain and
are not addressed to my network.

This IS working like I want it to, I can telnet for example to 209.210.10.11
and things work fine, I can go out from 209.210.10.11, and I can ping
209.210.10.11 from the outside.

>Antony.


