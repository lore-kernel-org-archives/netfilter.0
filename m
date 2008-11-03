From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Another way of doing? --state NEW -j DROP
Date: Sun, 02 Nov 2008 21:21:25 -0600
Message-ID: <490E6E35.9090005@riverviewtech.net>
References: <1225679763.2479.34.camel@sylv> <20081103030057.GF19842@outback.rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081103030057.GF19842@outback.rfc2324.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/2/2008 9:00 PM, Maximilian Wilhelm wrote:
> So you have to input all your rules via a GUI which does not accept 
> '--state NEW' right?

As an aside, one might question why you are using such a limiting tool.  :(

> Asuming yes and the you catch all '--state ESTABLISHED,RELATED' 
> packet which are/could be answer packets to outbound connections, how 
> about just leaving '--state NEW' out and DROP'ing all packets 
> remaining? Obviously after all rules which should accept things.

*nod*

This will work.

As far as TCP, you could watch for the SYN and ACK flag and filter out 
any packet that has are not fully established, i.e. SYN,ACK ACK.

> DROP'ing unwanted packets IMO is rather bad behavior as it makes 
> debugging (possible) network problems a lot harder. If you just 
> REJECT packets you don't want (with a appropriate limit) everybody 
> knows he is not welcome. So IMO it would be nicer to use '-j REJECT 
> --reject-with icmp-admin-prohibited'.

Agreed.

However you need to make sure that you will not reject packets with 
spoofed source address in to your network.  Consider Reverse Path filtering.



Grant. . . .
