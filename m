From: "U. George" <netbeans@gatworks.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sun, 28 Feb 2010 08:59:52 -0500
Message-ID: <4B8A76D8.5030800@gatworks.com>
References: <4B893433.7020401@gatworks.com> <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com> <4B894581.10700@gatworks.com> <4B8A133F.8030606@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8A133F.8030606@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org



On 02/28/2010 01:54 AM, Mart Frauenlob wrote:
>> >  I dont want to test over (( and over ) and over ) again when I know that
>> >  the packet is already KNOWN to be from eth1 and of protocol UDP.
> now if we add -p icmp -j PRE_UDP,  what should iptables do now?
>
> use 'ferm' if you are too lazy to write iptables rules:
> http://ferm.foo-projects.org/
>
>> >
Do what *I* say it should be doing. Do the jump. None of the tests in 
PRE_UDP chain would/should match, and the packet should fall out by the 
default policy of the chain. An iptable optimizer would recognize that 
the chain only tests for UDP, and would change the -p icmp -j PRE_UDP to 
-p icmp -j $(default policy) without going through any of the chain.

BTW: its not lazy to write efficient code.
