From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ipset returns "Zero valued IP address" when trying to add '0.0.0.0/7'
Date: Wed, 12 Nov 2008 00:23:04 -0600
Message-ID: <491A7648.6000703@riverviewtech.net>
References: <7259d7020811112155j5315d0e0ke9bc7576e927ad76@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811112155j5315d0e0ke9bc7576e927ad76@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/11/2008 11:55 PM, JC Janos wrote:
> I'm using IPSET to create a nethash typed set to contain a short list 
> of "bogons" as defined @ 
> http://www.team-cymru.org/Services/Bogons/#http for eventual use in a 
> firewall rule.
> 
> But for one of those defined nets, ipset fails to add,
> 
>  ipset -N BOGONS nethash
>  ipset -A BOGONS 0.0.0.0/7
>     ipset v2.4.3: Zero valued IP address `0.0.0.0' specified
>     Try `ipset -H' or 'ipset --help' for more information.
> 
> I can certainly use the "0.0.0.0/7" in a rule.  How can I correctly 
> add it to an ipset?

It sounds like ipset does not like the fact that you are using an IP 
address that is all zeros.  You may have to add something like the 
following:

    ipset -A BOGONS 1.0.0.0/7
    ipset -A BOGONS 2.0.0.0/7
    ipset -A BOGONS 4.0.0.0/7
    ipset -A BOGONS 6.0.0.0/7
    ipset -A BOGONS 8.0.0.0/7
    ipset -A BOGONS 10.0.0.0/7
    ...
You probably will not be able to start the zero (0.0.0.0/7) network with 
a zero for the same reason you are running in to your problem.  However 
a 1.0.0.0 is with in the zero network with a netmask of /7.  The rest of 
the networks will probably add ok.

Also, are you sure you meant to enter a netmask of /7 and not /8?



Grant. . . .
