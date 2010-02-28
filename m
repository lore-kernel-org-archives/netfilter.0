From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sun, 28 Feb 2010 15:41:39 +0100
Message-ID: <4B8A80A3.80806@chello.at>
References: <4B893433.7020401@gatworks.com> <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com> <4B894581.10700@gatworks.com> <4B8A133F.8030606@chello.at> <4B8A76D8.5030800@gatworks.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8A76D8.5030800@gatworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 28.02.2010 14:59, netfilter-owner@vger.kernel.org wrote:
> 
> 
> On 02/28/2010 01:54 AM, Mart Frauenlob wrote:
>>> >  I dont want to test over (( and over ) and over ) again when I
>>> know that
>>> >  the packet is already KNOWN to be from eth1 and of protocol UDP.
>> now if we add -p icmp -j PRE_UDP,  what should iptables do now?
>>
>> use 'ferm' if you are too lazy to write iptables rules:
>> http://ferm.foo-projects.org/
>>
>>> >
> Do what *I* say it should be doing. Do the jump. None of the tests in
> PRE_UDP chain would/should match, and the packet should fall out by the
> default policy of the chain. An iptable optimizer would recognize that
> the chain only tests for UDP, and would change the -p icmp -j PRE_UDP to
> -p icmp -j $(default policy) without going through any of the chain.

which of the 2 jumps is to give precedence?
how to judge? read your mind?

> 
> BTW: its not lazy to write efficient code.

ok, don't be lazy write the netfilter chain/jump optimizer :)
Because such a thing does not exist, netfilter will not do what you want.


