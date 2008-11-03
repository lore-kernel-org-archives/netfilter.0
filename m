From: Sylvan <sylvan@nids.com.nf>
Subject: [Fwd: Re: Another way of doing? --state NEW -j DROP]
Date: Mon, 03 Nov 2008 15:01:44 +1130
Message-ID: <1225683104.2479.56.camel@sylv>
Reply-To: sylvan@nids.com.nf
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


>> As an aside, one might question why you are using such a limiting
tool.  :(

Yeah I admit she's not the smartest of things. The main reason being I'd like to try the router is it uses nearly no electricity. I'm not trying to be 
stingy but in my neck of the woods electricity per unit has just gone up to 72c per unit. In the USA I understand it's around 15c and Australia 32c. 



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




