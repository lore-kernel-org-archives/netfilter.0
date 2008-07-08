From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Port Forwarding .
Date: Tue, 08 Jul 2008 14:37:04 -0500
Message-ID: <4873C1E0.2010609@riverviewtech.net>
References: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>	 <4872943B.2060309@riverviewtech.net>	 <5078d3df0807071532w4ab76fe4vcf4e60a8980525ba@mail.gmail.com>	 <5078d3df0807071533k47a5dd16i254b3ae3592d7a77@mail.gmail.com>	 <5078d3df0807071610m5b47a81qc5d830a8b7bd0cff@mail.gmail.com>	 <5078d3df0807071658p73a25291v8522a9645fa8b8f9@mail.gmail.com>	 <4872CFA4.4030406@riverviewtech.net> <5078d3df0807081220q71674472m660de0de432e6bd7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0807081220q71674472m660de0de432e6bd7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/08/08 14:20, Charles Romestant wrote:
> ok, flushed all tables, and all chains, changed back the policy to 
> accept, and then reentered the rules you sent me before Grant.  And 
> still no dice.

*nod*

<snip>

> still the prerouting seems to be matching but the others stay at 0.

Agreed.

> At the moment i m still reading documentation to see if i can spot 
> the mistake, thanks again for the help.
> 
> Why would the prerouting accept and not continue to postrouting?

If ip forwarding is not enabled, things may not do what they need to. 
What is your /proc/sys/net/ipv4/ip_forward file set to?  Try setting it 
to 1.

echo "1" > /proc/sys/net/ipv4/ip_forward

Also, can I get a current iptables-save output?



Grant. . . .
